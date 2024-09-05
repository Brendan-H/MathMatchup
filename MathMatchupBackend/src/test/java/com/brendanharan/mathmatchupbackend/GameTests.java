/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (GameTests.java) Last Modified on 7/21/24, 11:32 AM
 *
 */

package com.brendanharan.mathmatchupbackend;

import com.brendanharan.mathmatchupbackend.games.*;
import com.brendanharan.mathmatchupbackend.players.Player;
import com.brendanharan.mathmatchupbackend.players.PlayerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
public class GameTests {

    @InjectMocks
    private GameController gameController;

    @Mock
    private GameService gameService;

    @Mock
    private PlayerService playerService;

    @Mock
    private GameRepository gameRepository;
//setup, test, verify (assert)

    @Test
    public void testCreateGame() {
        Game testGame = new Game();
        testGame.setGameCode("111111");
        testGame.setGameType("addition");
        testGame.setDifficulty("easy");
        testGame.setStartTime(LocalDateTime.now());

        when(gameService.createGame(any(Game.class))).thenReturn(testGame);
        ResponseEntity<Game> response = gameController.createGame(testGame);

        assertEquals(response.getStatusCode(), HttpStatus.OK);
        assertEquals(response.getBody().getGameCode(), testGame.getGameCode());
        assertEquals(response.getBody().getGameType(), testGame.getGameType());
        assertEquals(response.getBody().getDifficulty(), testGame.getDifficulty());
        assertEquals(response.getBody().getStartTime(), testGame.getStartTime());
    }

}
