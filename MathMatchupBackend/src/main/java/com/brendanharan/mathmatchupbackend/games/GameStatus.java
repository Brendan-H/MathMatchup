/*
 * Copyright (c) 2023 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (GameStatus.java) Last Modified on 7/25/23, 12:50 PM
 *
 */

package com.brendanharan.mathmatchupbackend.games;

public enum GameStatus {
    ACTIVE("Active"),
    DEACTIVATED("Deactivated"),
    WAITING_FOR_PLAYERS("Waiting for Players"),
    FINISHED("Finished");

    private final String status;

    GameStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}