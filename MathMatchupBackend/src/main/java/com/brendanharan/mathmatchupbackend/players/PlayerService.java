/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerService.java) Last Modified on 8/24/23, 2:20 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlayerService {

    @Autowired
    private PlayerRepository playerRepository;

    public Player createPlayer(Player player) {
        return playerRepository.save(player);
    }

    public Player getPlayerById(Long playerId) {
        return playerRepository.findById(playerId).orElse(null);
    }

    public void savePlayer(Player player) {
        playerRepository.save(player);
    }

    public void updatePlayer(Player player) {

        playerRepository.save(player);
    }
}
