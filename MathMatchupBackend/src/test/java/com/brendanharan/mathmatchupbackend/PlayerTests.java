/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerTests.java) Last Modified on 8/21/23, 6:08 PM
 *
 */

package com.brendanharan.mathmatchupbackend;

import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.games.GameService;
import com.brendanharan.mathmatchupbackend.players.Player;
import com.brendanharan.mathmatchupbackend.players.PlayerController;
import com.brendanharan.mathmatchupbackend.players.PlayerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class PlayerTests {

    @InjectMocks
    private PlayerController playerController;

    @Mock
    private PlayerService playerService;

    @Mock
    private GameService gameService;

    @Test
    public void testCreatePlayer() {
        // Setup
        Player player = new Player();
        String gameCode = "123456";
        Game game = new Game();
        when(gameService.getGameByCode(gameCode)).thenReturn(game);
        when(playerService.createPlayer(any(Player.class))).thenReturn(player);

        // Test
        ResponseEntity<Player> response = playerController.createPlayer(player, gameCode);

        // Verify
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(player, response.getBody());
    }


}
