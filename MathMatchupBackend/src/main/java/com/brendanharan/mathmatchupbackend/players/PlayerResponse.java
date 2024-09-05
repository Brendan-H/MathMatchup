/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (PlayerResponse.java) Last Modified on 5/24/24, 5:12 PM
 *
 */

package com.brendanharan.mathmatchupbackend.players;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class PlayerResponse {
    private Player player;
    private String gameDifficulty;
    private String gameType;
    private int timer;
}