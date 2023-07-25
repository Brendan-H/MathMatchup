package com.brendanharan.mathmatchupbackend.teams;

import com.brendanharan.mathmatchupbackend.games.Game;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
public class TeamId implements Serializable {

    @Column(name = "game_id")
    private Long gameId;

    @Column(name = "team_id")
    private Long teamId;


    // Default constructor to initialize gameId and teamId to 0
    public TeamId() {
        this.gameId = 0L;
        this.teamId = 0L;
    }

    // Constructor to initialize gameId and teamId with specific values
    public TeamId(Long gameId, Long teamId) {
        this.gameId = gameId;
        this.teamId = teamId;
    }
}