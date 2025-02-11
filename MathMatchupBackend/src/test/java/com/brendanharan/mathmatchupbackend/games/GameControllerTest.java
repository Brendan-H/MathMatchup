/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (GameControllerTest.java) Last Modified on 2/10/25, 8:41 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games;


import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Assertions;
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

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Testcontainers
public class GameControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private GameRepository gameRepository;

    @Container
    public static PostgreSQLContainer<?> postgreSQLContainer = new PostgreSQLContainer<>("postgres:15")
            .withDatabaseName("mathmatchuptest")
            .withUsername("test")
            .withPassword("test");

    @BeforeEach
    void setUp() {
        gameRepository.deleteAll();
    }

    @Test
    void testCreateGame() throws Exception {
        Game game = new Game();
        game.setStatus(GameStatus.WAITING_FOR_PLAYERS);
        game.setDifficulty("easy");
        game.setGameType("addition");
        game.setTimer(60);

        mockMvc.perform(post("/games")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(game)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.gameCode").isNotEmpty())
                .andExpect(jsonPath("$.status").value("WAITING_FOR_PLAYERS"));

        List<Game> games = gameRepository.findAll();
        assertFalse(games.isEmpty());
    }

    @Test
    void testStartGame() throws Exception {
        // Create and save the game to the database
        Game game = new Game();
        game.setGameCode("123321");
        game.setStatus(GameStatus.WAITING_FOR_PLAYERS);
        game.setDifficulty("easy");
        game.setGameType("addition");
        game.setTimer(61);
        gameRepository.save(game);


        mockMvc.perform(post("/games/start")
                        .param("gameCode", "123321"))
                .andExpect(status().isOk())
                .andExpect(content().string("Game started."));


        Game updatedGame = gameRepository.findByGameCode("123321");
        Assertions.assertNotNull(updatedGame);
        Assertions.assertEquals(GameStatus.ACTIVE, updatedGame.getStatus());
        Assertions.assertEquals(61, updatedGame.getTimer());
    }

    @Test
    void testGetGameStatus() throws Exception {
        Game game = new Game();
        game.setGameCode("111111");
        game.setStatus(GameStatus.WAITING_FOR_PLAYERS);
        game.setDifficulty("easy");
        game.setGameType("addition");
        game.setTimer(62);
        gameRepository.save(game);

        mockMvc.perform(get("/games/111111/status"))
                .andExpect(status().isOk());

        Game existingGame = gameRepository.findByGameCode("111111");
        Assertions.assertNotNull(existingGame);
        Assertions.assertEquals(GameStatus.WAITING_FOR_PLAYERS, existingGame.getStatus());
    }
}
