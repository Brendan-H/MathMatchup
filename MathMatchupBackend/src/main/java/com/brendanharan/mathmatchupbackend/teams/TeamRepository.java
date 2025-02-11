/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (TeamRepository.java) Last Modified on 9/5/24, 5:33 PM
 *
 */

package com.brendanharan.mathmatchupbackend.teams;

import com.brendanharan.mathmatchupbackend.teams.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TeamRepository extends JpaRepository<Team, Long>{
    @Query("SELECT DISTINCT t FROM Team t JOIN FETCH t.members m WHERE t.id.gameId = :gameId")
    List<Team> findTeamsWithMembersByGameId(@Param("gameId") Long gameId);

    List<Team> findTeamsByGame_IdOrderByPointsDesc(Long gameId);

}
