package com.brendanharan.mathmatchupbackend.games;

import com.brendanharan.mathmatchupbackend.players.Player;
import com.brendanharan.mathmatchupbackend.teams.Team;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "games")
@Setter
@Getter
public class Game {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String gameCode;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private GameStatus status;

    @OneToMany(mappedBy = "game", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Player> players = new ArrayList<>();

    @OneToMany(mappedBy = "game", cascade = CascadeType.ALL)
    private List<Team> teams = new ArrayList<>();

    @Column(name = "end_time")
    private LocalDateTime endTime;


}


