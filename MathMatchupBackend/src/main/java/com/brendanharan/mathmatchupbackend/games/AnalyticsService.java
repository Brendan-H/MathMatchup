/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (AnalyticsService.java) Last Modified on 2/9/25, 2:06 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games;

import com.brendanharan.mathmatchupbackend.players.Player;
import com.brendanharan.mathmatchupbackend.players.PlayerAnalytics;
import com.brendanharan.mathmatchupbackend.players.PlayerRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnalyticsService {
    private final GameRepository gameRepository;
    private final GameAnalyticsRepository gameAnalyticsRepository;

    public AnalyticsService(GameRepository gameRepository, PlayerRepository playerRepository, GameAnalyticsRepository gameAnalyticsRepository) {
        this.gameRepository = gameRepository;
        this.gameAnalyticsRepository = gameAnalyticsRepository;
    }

    @Transactional
    public void processGameAnalytics(String gamecode) {

        Game game = gameRepository.findByGameCode(gamecode);
        if (game == null) {
            return;
        }

        List<Player> players = game.getPlayers();
        int totalCorrect = 0;
        int totalIncorrect = 0;
        int totalQuestions = 0;
        double totalAverageTime = 0;
        double totalAccuracy = 0;
        int totalPoints = 0;

        for (Player player : players) {
            PlayerAnalytics playerAnalytics = player.getPlayerAnalytics();
            totalCorrect += playerAnalytics.getTotalCorrect();
            totalIncorrect += playerAnalytics.getTotalIncorrect();
            totalQuestions += playerAnalytics.getTotalQuestions();
            totalAverageTime += playerAnalytics.getAverageTime();
            totalAccuracy += playerAnalytics.getAccuracy();
            totalPoints += player.getPoints();
        }

        int playerCount = players.size();
        totalAccuracy /= playerCount;
        totalAverageTime /= playerCount;
        GameAnalytics gameAnalytics = new GameAnalytics();
        gameAnalytics.setGame(game);
        gameAnalytics.setTotalCorrect(totalCorrect);
        gameAnalytics.setTotalIncorrect(totalIncorrect);
        gameAnalytics.setTotalQuestions(totalQuestions);
        gameAnalytics.setAverageTime(totalAverageTime);
        gameAnalytics.setTotalAccuracy(totalAccuracy);
        gameAnalytics.setTotalPoints(totalPoints);

        gameAnalyticsRepository.save(gameAnalytics);


    }
}
