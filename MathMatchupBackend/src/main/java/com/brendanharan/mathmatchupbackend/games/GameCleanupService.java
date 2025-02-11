/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (GameCleanupService.java) Last Modified on 9/5/24, 5:33 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class GameCleanupService {

    private final GameRepository gameRepository;

    public GameCleanupService(GameRepository gameRepository) {
        this.gameRepository = gameRepository;
    }

    @Scheduled(cron = "0 0 0 * * ?") // Runs daily at midnight
    public void deleteOldGames() {
        LocalDate cutoffDate = LocalDate.now().minusDays(1); // Delete games that ended yesterday
        List<Game> oldGames = gameRepository.findByEndTimeBefore(cutoffDate);
        gameRepository.deleteAll(oldGames);
    }
}
