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