/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerAnalyticsRepository.java) Last Modified on 2/9/25, 2:23 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players.analytics;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PlayerAnalyticsRepository extends JpaRepository<PlayerAnalytics, Long> {
}
