package com.brendanharan.mathmatchupbackend.games;

import java.util.Random;

public class GameCodeGenerator {

    private static final String NUMERIC_CHARS = "0123456789";
    private static final int CODE_LENGTH = 6;

    public static String generateGameCode() {
        Random random = new Random();
        StringBuilder codeBuilder = new StringBuilder(CODE_LENGTH);

        for (int i = 0; i < CODE_LENGTH; i++) {
            int randomIndex = random.nextInt(NUMERIC_CHARS.length());
            char randomChar = NUMERIC_CHARS.charAt(randomIndex);
            codeBuilder.append(randomChar);
        }

        return codeBuilder.toString();
    }

    public static void main(String[] args) {
        String gameCode = generateGameCode();
        System.out.println("Generated Game Code: " + gameCode);
    }
}