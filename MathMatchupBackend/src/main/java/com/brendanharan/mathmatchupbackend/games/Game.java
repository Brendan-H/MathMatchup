/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (Game.java) Last Modified on 8/21/23, 6:01 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games;

import com.brendanharan.mathmatchupbackend.players.Player;
import com.brendanharan.mathmatchupbackend.teams.Team;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
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

    @Column(nullable = false)
    @NotBlank(message = "Game type must be provided.")
    private String gameType;

    @Column(nullable = false)
    @NotBlank(message = "Game difficulty must be provided.")
    private String difficulty;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private GameStatus status;

    @Column
    private LocalDateTime startTime;

    @Column
    private int timer;

    @OneToMany(mappedBy = "game", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Player> players = new ArrayList<>();

    @OneToMany(mappedBy = "game", cascade = CascadeType.ALL)
    private List<Team> teams = new ArrayList<>();

    @Column(name = "end_time")
    private LocalDateTime endTime;


}


