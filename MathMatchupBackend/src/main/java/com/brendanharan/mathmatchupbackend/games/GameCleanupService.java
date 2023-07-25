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
