/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (GameService.java) Last Modified on 7/25/23, 12:50 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games;

import com.brendanharan.mathmatchupbackend.players.Player;
import com.brendanharan.mathmatchupbackend.players.PlayerRepository;
import com.brendanharan.mathmatchupbackend.teams.Team;
import com.brendanharan.mathmatchupbackend.teams.TeamId;
import com.brendanharan.mathmatchupbackend.teams.TeamRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class GameService {

    private final GameRepository gameRepository;
    private final TeamRepository teamRepository;
    private final PlayerRepository playerRepository;
    private Long nextTeamId = 0L;

    @Autowired
    public GameService(GameRepository gameRepository, TeamRepository teamRepository, PlayerRepository playerRepository) {
        this.gameRepository = gameRepository;
        this.teamRepository = teamRepository;
        this.playerRepository = playerRepository;
    }

    public Game createGame(Game game) {
        // Implement any validation or additional logic here if needed
        return gameRepository.save(game);
    }

    public List<Game> getAllGames() {
        return gameRepository.findAll();
    }

    public Game getGameById(Long gameId) {
        Optional<Game> optionalGame = gameRepository.findById(gameId);
        return optionalGame.orElse(null);
    }

    public void deleteGame(Long gameId) {
        gameRepository.deleteById(gameId);
    }

    public Game getGameByCode(String gameCode) {
        return gameRepository.findByGameCode(gameCode);
    }

    public List<Player> getPlayersByGameCode(String gameCode) {
        Game game = gameRepository.findByGameCode(gameCode);
        if (game != null) {
            return game.getPlayers();
        } else {
            // Handle the case when the game with the given code is not found
            return new ArrayList<>();
        }
    }

    public long getGameIdFromCode(String gameCode) {
//        return gameRepository.findByGameCode(gameCode).getId();
        return gameRepository.findIdByGameCode(gameCode);
    }

    private static final Logger logger = LoggerFactory.getLogger(GameService.class);

    public Game startGame(Long gameId) throws ChangeSetPersister.NotFoundException {
        logger.info("Starting game with ID: {}", gameId);
        // Fetch the game from the database
        Game game = gameRepository.findById(gameId).orElseThrow(ChangeSetPersister.NotFoundException::new);
        logger.info("Game status: {}", game.getStatus());
        logger.info("Game code: {}", game.getGameCode());
        logger.info("Game players: {}", game.getPlayers());
        logger.info("Game teams: {}", game.getTeams());
        logger.info("Game: {}", game);

        List<Player> availablePlayers = playerRepository.findAllByTeamIsNull();

        // Shuffle the players for random pairing
        Collections.shuffle(availablePlayers);
        logger.info("Shuffled players: {}", availablePlayers);

        // Calculate the team size based on the number of available players
        int teamSize = 2;
        int remainingPlayers = availablePlayers.size() % 2;

        // Create teams and assign players to teams
        List<Team> teams = new ArrayList<>();
        int currentPlayerIdx = 0;

        while (currentPlayerIdx < availablePlayers.size()) {
            int currentPlayerCount = teamSize;
            if (remainingPlayers > 0) {
                currentPlayerCount++; // Add one player to form a team of 3
                remainingPlayers--;
            }

            List<Player> teamMembers = availablePlayers.subList(currentPlayerIdx, currentPlayerIdx + currentPlayerCount);
            currentPlayerIdx += currentPlayerCount;

            Team team = new Team();

            // Use the nextTeamId variable to assign the team ID and increment it for the next team
            team.setId(new TeamId(gameId, nextTeamId++));
            team.setMembers(teamMembers);

            // Set the game field in the Team entity
            team.setGame(game);

            teams.add(team);

            // Update player entities to associate them with the team
            for (Player player : teamMembers) {
                player.setTeam(team);
                logger.info("Player {} assigned to team {}", player.getName(), team.getId());
            }
        }

        game.setStatus(GameStatus.ACTIVE);
        logger.info("Game started successfully. Status: {}", game.getStatus());

        // Save the teams and update players (including the game status)
        teamRepository.saveAll(teams);

        return game;
    }

    public void finishGame(Game game) {
        game.setStatus(GameStatus.FINISHED);
        game.setEndTime(LocalDate.now().atStartOfDay());
        submitPoints(game);
    }

    public void submitPoints(Game game) {
        List<Team> teams = game.getTeams();
        for (Team team : teams) {
            int totalPoints = team.calculateTotalPoints();
            // Save the updated points to the team
            team.setPoints(totalPoints);
            teamRepository.save(team);
        }
    }


}