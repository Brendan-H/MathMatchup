/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerControllerTest.java) Last Modified on 2/11/25, 3:39 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players;


import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.games.GameRepository;
import com.brendanharan.mathmatchupbackend.games.GameStatus;
import com.brendanharan.mathmatchupbackend.players.analytics.PointsAndAnalytics;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Testcontainers
public class PlayerControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private GameRepository gameRepository;

    @Autowired
    private PlayerRepository playerRepository;

    @Container
    public static PostgreSQLContainer<?> postgreSQLContainer = new PostgreSQLContainer<>("postgres:15")
            .withDatabaseName("mathmatchuptest")
            .withUsername("test")
            .withPassword("test");

    @BeforeEach
    void setUp() {
        gameRepository.deleteAll();
        playerRepository.deleteAll();
    }

    @Test
    void testCreatePlayer() throws Exception {
        Game game = new Game();
        game.setGameCode("124321");
        game.setStatus(GameStatus.WAITING_FOR_PLAYERS);
        game.setDifficulty("easy");
        game.setGameType("addition");
        game.setTimer(51);
        gameRepository.save(game);

        Player player = new Player();
        player.setName("TestPlayer");

        mockMvc.perform(post("/players/create")
                        .contentType(MediaType.APPLICATION_JSON)
                        .param("gameCode", "124321")
                        .content(objectMapper.writeValueAsString(player))
                )
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.player.name").value("TestPlayer"))
                .andExpect(jsonPath("$.gameDifficulty").value("easy"))
                .andExpect(jsonPath("$.gameType").value("addition"))
                .andExpect(jsonPath("$.timer").value(51));


    }

    /*

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

        // Update the PlayerAnalytics object
        playerAnalytics.setTotalCorrect(pointsAndAnalytics.getCorrectAnswers());
        playerAnalytics.setTotalIncorrect(pointsAndAnalytics.getIncorrectAnswers());
        playerAnalytics.setTotalQuestions(pointsAndAnalytics.getTotalQuestions());
        playerAnalytics.setAverageTime(pointsAndAnalytics.getAverageTime());
        playerAnalytics.setAccuracy(pointsAndAnalytics.getAccuracy());
        playerAnalytics.setPoints(pointsAndAnalytics.getPoints());

        playerAnalyticsRepository.save(playerAnalytics);

        // Associate the PlayerAnalytics with the Player
        player.setPlayerAnalytics(playerAnalytics);
        playerService.updatePlayer(player);

        return ResponseEntity.ok(player);
    }

     */

    @Test
    void testSubmitPoints() throws Exception {
        Game game = new Game();
        game.setGameCode("125321");
        game.setStatus(GameStatus.WAITING_FOR_PLAYERS);
        game.setDifficulty("hard");
        game.setGameType("subtraction");
        game.setTimer(52);
        gameRepository.save(game);

        Player player = new Player();
        player.setName("Player1");
        player.setGame(game);
        playerRepository.save(player);

        PointsAndAnalytics pointsAndAnalytics = new PointsAndAnalytics(340,
                10, 2,12,
                3.5,83.33);


        mockMvc.perform(post("/players/submit-points")
                .param("playerID", player.getId().toString())
                .param("gameCode", "125321")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(pointsAndAnalytics))
        ).andExpect(status().isOk()).andExpect(jsonPath("$.points").value(340));
    }
}
