package com.brendanharan.mathmatchupbackend.leaderboard;

import com.brendanharan.mathmatchupbackend.games.GameService;
import com.brendanharan.mathmatchupbackend.teams.Team;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/leaderboard")
public class LeaderboardController {

    private final LeaderboardService leaderboardService;

    private final GameService gameService;

    public LeaderboardController(LeaderboardService leaderboardService, GameService gameService) {
        this.leaderboardService = leaderboardService;
        this.gameService = gameService;
    }

    @GetMapping("/game/{gameCode}")
    public ResponseEntity<List<Team>> getLeaderboardForGame(@PathVariable String gameCode) {
        Long gameId = gameService.getGameIdFromCode(gameCode);
        List<Team> leaderboard = leaderboardService.getLeaderboardByGameId(gameId);
        return ResponseEntity.ok(leaderboard);
    }
}
