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