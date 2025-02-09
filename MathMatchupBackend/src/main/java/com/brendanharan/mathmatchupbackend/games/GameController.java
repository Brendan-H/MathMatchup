/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (GameController.java) Last Modified on 6/24/24, 2:38 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games;

import com.brendanharan.mathmatchupbackend.players.Player;
import com.brendanharan.mathmatchupbackend.players.PlayerService;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

import static com.brendanharan.mathmatchupbackend.games.GameCodeGenerator.generateGameCode;

@RestController
@RequestMapping("/games")
public class GameController {

    @Autowired
    private GameService gameService;

    @Autowired
    private PlayerService playerService;

    @Autowired
    private GameRepository gameRepository;

    private static final Logger logger = LoggerFactory.getLogger(GameService.class);
    @Autowired
    private AnalyticsService analyticsService;
    @Autowired
    private GameAnalyticsRepository gameAnalyticsRepository;

    @PostMapping()
    public ResponseEntity<Game> createGame(@Valid @RequestBody Game game) {

        String gameCode = generateGameCode();
        game.setGameCode(gameCode);
        game.setStatus(GameStatus.WAITING_FOR_PLAYERS);


        Game createdGame = gameService.createGame(game);
        return ResponseEntity.ok(createdGame);
    }


    @GetMapping("/{gameCode}/players")
    public ResponseEntity<List<Player>> getPlayersByGameCode(@PathVariable String gameCode) {
        List<Player> players = gameService.getPlayersByGameCode(gameCode);
        return ResponseEntity.ok(players);
    }

    @PostMapping("/start")
    public ResponseEntity<String> startGameByCode(@RequestParam String gameCode) {
        try {
           Long gameId = gameService.getGameIdFromCode(gameCode);

            logger.info("The game ID is ... Game ID: " + gameId);


            Game game = gameService.startGame(gameId);
            return ResponseEntity.ok("Game started.");
        } catch (ChangeSetPersister.NotFoundException e) {
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to start the game: error: " + e.getMessage());
        }
    }

    @GetMapping("/{gameCode}/status")
    public ResponseEntity<GameStatus> getGameStatusByCode(@PathVariable String gameCode) {
        Game game = gameService.getGameByCode(gameCode);
        return ResponseEntity.ok(game.getStatus());
    }

    @PostMapping("/finish")
    public ResponseEntity<String> finishGameByCode(@RequestParam String gameCode) {
        long gameId = gameService.getGameIdFromCode(gameCode);
        Game game = gameService.getGameByCode(gameCode);
        gameService.finishGame(game);
        logger.info("The game ID is ... Game ID: " + gameId);
        return ResponseEntity.ok("Game finished.");

    }

    @GetMapping("/analytics/{gameCode}")
    public ResponseEntity<String> getGameAnalytics(@PathVariable String gameCode) {
        try {
            analyticsService.processGameAnalytics(gameCode);
            //TODO actually return analytics
            return ResponseEntity.ok("Game analytics processed.");

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to process game analytics: error: " + e.getMessage());
        }
    }
}
