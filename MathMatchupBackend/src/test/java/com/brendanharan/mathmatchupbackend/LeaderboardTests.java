/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (LeaderboardTests.java) Last Modified on 8/21/23, 6:03 PM
 *
 */

package com.brendanharan.mathmatchupbackend;

import com.brendanharan.mathmatchupbackend.games.GameService;
import com.brendanharan.mathmatchupbackend.leaderboard.LeaderboardController;
import com.brendanharan.mathmatchupbackend.leaderboard.LeaderboardService;
import com.brendanharan.mathmatchupbackend.teams.Team;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class LeaderboardTests {

    @InjectMocks
    private LeaderboardController leaderboardController;

    @Mock
    private LeaderboardService leaderboardService;

    @Mock
    private GameService gameService;

    @Test
    public void testGetLeaderboardForGame() {
        // Setup
        String gameCode = "abc";
        Long gameId = 1L;
        List<Team> leaderboard = new ArrayList<>(); // Add some teams

        when(gameService.getGameIdFromCode(gameCode)).thenReturn(gameId);
        when(leaderboardService.getLeaderboardByGameId(gameId)).thenReturn(leaderboard);

        // Test
        ResponseEntity<List<Team>> response = leaderboardController.getLeaderboardForGame(gameCode);

        // Verify
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(leaderboard, response.getBody());
    }
}
