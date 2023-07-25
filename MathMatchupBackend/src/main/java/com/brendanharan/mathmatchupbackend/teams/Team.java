package com.brendanharan.mathmatchupbackend.teams;

import com.brendanharan.mathmatchupbackend.games.Game;
import com.brendanharan.mathmatchupbackend.players.Player;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
public class Team {

    @EmbeddedId
    private TeamId id; // Using the composite key for TeamId

    @ManyToOne
    @MapsId("gameId") // Map to the gameId field in the TeamId composite key
    @JoinColumn(name = "game_id")
    @JsonIgnore
    private Game game; // Make sure the field name is 'game'

    @OneToMany(mappedBy = "team", cascade = CascadeType.ALL)
    private List<Player> members = new ArrayList<>();

    @Column(name = "points", nullable = false)
    private int points = 0;


    public int calculateTotalPoints() {
        int teamSize = members.size();
        int totalPoints = 0;
        for (Player player : members) {
            totalPoints += player.getPoints();
        }

        if (teamSize == 3) {
            totalPoints = (int) Math.round(totalPoints * 2.0 / 3.0);
        }

        return totalPoints;
    }


}

