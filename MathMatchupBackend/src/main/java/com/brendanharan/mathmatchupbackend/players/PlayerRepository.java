/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerRepository.java) Last Modified on 7/25/23, 12:50 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlayerRepository extends JpaRepository<Player, Long> {

    List<Player> findAllByTeamIsNull();


}
