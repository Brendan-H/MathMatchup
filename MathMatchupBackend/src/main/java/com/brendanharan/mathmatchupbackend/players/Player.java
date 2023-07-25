package com.brendanharan.mathmatchupbackend.players;


import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.teams.Team;
import com.brendanharan.mathmatchupbackend.teams.TeamId;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Entity
@Table(name = "players")
@Getter
@Setter
public class Player {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "game_id", nullable = false)
    @JsonIgnore
    private Game game;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
            @JoinColumn(name = "team_game_id", referencedColumnName = "game_id"),
            @JoinColumn(name = "team_team_id", referencedColumnName = "team_id")
    })
    @JsonIgnoreProperties({"game"})
    @JsonIgnore
    private Team team;

    @Column(nullable = false, name = "points")
    private int points;

    public void updatePoints(int pointsToAdd, int teamSize) {
        if (teamSize == 3) {
            this.points += (int) Math.round(pointsToAdd * 2.0 / 3.0);
        } else {
            this.points += pointsToAdd;
        }
    }


}