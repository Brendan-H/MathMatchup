/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (GameAnalyticsRepository.java) Last Modified on 2/9/25, 2:50 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games.analytics;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GameAnalyticsRepository extends JpaRepository<GameAnalytics, Long> {
    GameAnalytics findByGameId(Long gameId);

    GameAnalytics findByGame_GameCode(String gameCode);
}
