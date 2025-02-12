/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerController.java) Last Modified on 2/9/25, 2:43 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players;


import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.games.GameService;
import com.brendanharan.mathmatchupbackend.games.analytics.GameAnalytics;
import com.brendanharan.mathmatchupbackend.games.analytics.GameAnalyticsRepository;
import com.brendanharan.mathmatchupbackend.players.analytics.PlayerAnalytics;
import com.brendanharan.mathmatchupbackend.players.analytics.PlayerAnalyticsRepository;
import com.brendanharan.mathmatchupbackend.players.analytics.PointsAndAnalytics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.math.RoundingMode;

@RestController
@RequestMapping("/players")
public class PlayerController {

    @Autowired
    private PlayerService playerService;

    @Autowired
    private GameService gameService;
    @Autowired
    private PlayerAnalyticsRepository playerAnalyticsRepository;
    @Autowired
    private GameAnalyticsRepository gameAnalyticsRepository;

    @PostMapping("/create")
    public ResponseEntity<PlayerResponse> createPlayer(@RequestBody Player player, @RequestParam("gameCode") String gameCode) {

        Game game = gameService.getGameByCode(gameCode);
        if (game == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        player.setPoints(0);

        player.setGame(game);


        Player createdPlayer = playerService.createPlayer(player);
        PlayerResponse playerResponse = new PlayerResponse();
        playerResponse.setPlayer(createdPlayer);
        playerResponse.setGameDifficulty(game.getDifficulty());
        playerResponse.setGameType(game.getGameType());
        playerResponse.setTimer(game.getTimer());

        return ResponseEntity.ok(playerResponse);
    }

    @PostMapping("/submit-points")
    public ResponseEntity<Player> submitPoints(
            @RequestParam("playerID") Long playerId,
            @RequestParam("gameCode") String gameCode,
            @RequestBody PointsAndAnalytics pointsAndAnalytics
    ) {
        // Get the player by ID from the database
        Player player = playerService.getPlayerById(playerId);
        if (player == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        // Get the game by the game code
        Game game = gameService.getGameByCode(gameCode);
        if (game == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        // Check if the player is associated with the specified game
        if (!player.getGame().equals(game)) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }

        // Update the player's points
        player.setPoints(pointsAndAnalytics.getPoints());
        playerService.updatePlayer(player);

        // Check if PlayerAnalytics already exists for the player
        PlayerAnalytics playerAnalytics = player.getPlayerAnalytics();
        if (playerAnalytics == null) {
            playerAnalytics = new PlayerAnalytics();
            playerAnalytics.setPlayer(player);
            playerAnalytics.setGame(game);
        }
        GameAnalytics gameAnalytics = gameAnalyticsRepository.findByGame_GameCode(game.getGameCode());
        if (gameAnalytics == null) {
            gameAnalytics = new GameAnalytics();
            gameAnalytics.setGame(game);
            // Set other initial values for gameAnalytics if necessary
            gameAnalyticsRepository.save(gameAnalytics); // Save the gameAnalytics first
        }

        BigDecimal avgTime = new BigDecimal(pointsAndAnalytics.getAverageTime()).setScale(2, RoundingMode.HALF_UP);
        pointsAndAnalytics.setAverageTime(avgTime.doubleValue());
        BigDecimal accuracy = new BigDecimal(pointsAndAnalytics.getAccuracy()).setScale(2, RoundingMode.HALF_UP);
        pointsAndAnalytics.setAccuracy(accuracy.doubleValue());

        // Update the PlayerAnalytics object
        playerAnalytics.setTotalCorrect(pointsAndAnalytics.getCorrectAnswers());
        playerAnalytics.setTotalIncorrect(pointsAndAnalytics.getIncorrectAnswers());
        playerAnalytics.setTotalQuestions(pointsAndAnalytics.getTotalQuestions());
        playerAnalytics.setAverageTime(pointsAndAnalytics.getAverageTime());
        playerAnalytics.setAccuracy(pointsAndAnalytics.getAccuracy());
        playerAnalytics.setPoints(pointsAndAnalytics.getPoints());
        playerAnalytics.setGameAnalytics(gameAnalytics);

        playerAnalyticsRepository.save(playerAnalytics);

        // Associate the PlayerAnalytics with the Player
        player.setPlayerAnalytics(playerAnalytics);
        playerService.updatePlayer(player);

        return ResponseEntity.ok(player);
    }
}


