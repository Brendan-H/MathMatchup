/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (LeaderboardService.java) Last Modified on 8/24/23, 2:20 PM
 *
 */

package com.brendanharan.mathmatchupbackend.leaderboard;

import com.brendanharan.mathmatchupbackend.teams.Team;
import com.brendanharan.mathmatchupbackend.teams.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

@Service
public class LeaderboardService {
    @Autowired
    private TeamRepository teamRepository;

    public List<Team> getLeaderboardByGameId(Long gameId) {
        List<Team> teams = teamRepository.findTeamsByGame_IdOrderByPointsDesc(gameId);

//        teams.sort(Comparator.comparingInt(Team::calculateTotalPoints).reversed());

        return teams;
    }
}