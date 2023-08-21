package com.brendanharan.mathmatchupbackend;

import com.brendanharan.mathmatchupbackend.games.*;
import com.brendanharan.mathmatchupbackend.players.Player;
import com.brendanharan.mathmatchupbackend.players.PlayerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class GameTests {

    @InjectMocks
    private GameController gameController;

    @Mock
    private GameService gameService;

    @Mock
    private PlayerService playerService;

    @Mock
    private GameRepository gameRepository;

    @Test
    public void testCreateGame() {
        // Setup
        Game game = new Game();
        when(gameService.createGame(any(Game.class))).thenReturn(game);

        // Test
        ResponseEntity<Game> response = gameController.createGame(game);

        // Verify
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(game, response.getBody());
    }

    @Test
    public void testGetPlayersByGameCode() {
        // Setup
        String gameCode = "abc";
        List<Player> players = new ArrayList<>(); // Add some players
        when(gameService.getPlayersByGameCode(gameCode)).thenReturn(players);

        // Test
        ResponseEntity<List<Player>> response = gameController.getPlayersByGameCode(gameCode);

        // Verify
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals(players, response.getBody());
    }

    @Test
    public void testStartGameByCode_GameNotFound() throws ChangeSetPersister.NotFoundException {
        // Setup
        String gameCode = "abc";
        Long gameId = 1L;
        when(gameService.getGameIdFromCode(gameCode)).thenReturn(gameId);
        when(gameService.startGame(gameId)).thenThrow(ChangeSetPersister.NotFoundException.class);

        // Test
        ResponseEntity<String> response = gameController.startGameByCode(gameCode);

        // Verify
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
    }


    @Test
    public void testFinishGameByCode() {
        // Setup
        String gameCode = "abc";
        Long gameId = 1L;
        when(gameService.getGameIdFromCode(gameCode)).thenReturn(gameId);
        when(gameService.getGameByCode(gameCode)).thenReturn(new Game());

        // Test
        ResponseEntity<String> response = gameController.finishGameByCode(gameCode);

        // Verify
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertEquals("Game finished.", response.getBody());
    }
}
