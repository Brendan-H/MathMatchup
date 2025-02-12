/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (AnalyticsService.java) Last Modified on 2/9/25, 2:50 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games.analytics;

import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.games.GameRepository;
import com.brendanharan.mathmatchupbackend.players.Player;
import com.brendanharan.mathmatchupbackend.players.PlayerRepository;
import com.brendanharan.mathmatchupbackend.players.analytics.PlayerAnalytics;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
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

        GameAnalytics gameAnalytics = gameAnalyticsRepository.findByGame_GameCode(game.getGameCode());

        if (gameAnalytics == null) {
            gameAnalytics = new GameAnalytics();
            gameAnalytics.setGame(game);
        }

        List<Player> players = game.getPlayers();
        int totalCorrect = 0;
        int totalIncorrect = 0;
        int totalQuestions = 0;
        double totalAverageTime = 0;
        double totalAccuracy = 0;
        int totalPoints = 0;
        double averageCorrect = 0;
        double averageIncorrect = 0;
        double averageScore = 0;

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
        averageCorrect = (double) totalCorrect / playerCount;
        averageIncorrect = (double) totalIncorrect / playerCount;
        averageScore = (double) totalPoints / playerCount;
        BigDecimal avgAccuracy = new BigDecimal(totalAccuracy).setScale(2, RoundingMode.HALF_UP);
        totalAccuracy = avgAccuracy.doubleValue();
        BigDecimal avgTime = new BigDecimal(totalAverageTime).setScale(2, RoundingMode.HALF_UP);
        totalAverageTime = avgTime.doubleValue();
        BigDecimal avgCorrect = new BigDecimal(averageCorrect).setScale(2, RoundingMode.HALF_UP);
        averageCorrect = avgCorrect.doubleValue();
        BigDecimal avgIncorrect = new BigDecimal(averageIncorrect).setScale(2, RoundingMode.HALF_UP);
        averageIncorrect = avgIncorrect.doubleValue();

        gameAnalytics.setTotalCorrect(totalCorrect);
        gameAnalytics.setTotalIncorrect(totalIncorrect);
        gameAnalytics.setTotalQuestions(totalQuestions);
        gameAnalytics.setAverageTime(totalAverageTime);
        gameAnalytics.setTotalAccuracy(totalAccuracy);
        gameAnalytics.setTotalPoints(totalPoints);
        gameAnalytics.setAverageCorrect(averageCorrect);
        gameAnalytics.setAverageIncorrect(averageIncorrect);
        gameAnalytics.setAverageScore(averageScore);


        gameAnalyticsRepository.save(gameAnalytics);


    }
}
