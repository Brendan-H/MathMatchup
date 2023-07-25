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
