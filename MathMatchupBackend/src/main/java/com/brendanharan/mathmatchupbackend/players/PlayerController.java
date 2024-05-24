/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerController.java) Last Modified on 7/25/23, 12:50 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players;


import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.games.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/players")
public class PlayerController {

    @Autowired
    private PlayerService playerService;

    @Autowired
    private GameService gameService;

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

        return ResponseEntity.ok(playerResponse);
    }

    @PostMapping("/{playerId}/submit-points")
    public ResponseEntity<Player> submitPoints(
            @PathVariable Long playerId,
            @RequestParam("gameCode") String gameCode,
            @RequestParam("points") int points
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
        player.setPoints(points);
        playerService.updatePlayer(player);

        return ResponseEntity.ok(player);
    }
}


