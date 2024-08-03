/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UIDGenerator.java) Last Modified on 8/2/24, 8:35 PM
 *
 */

package com.brendanharan.mathmatchupbackend.users;

import java.util.Random;

//original code from https://gist.github.com/mikelehen/3596a30bd69384624c11 and translated to java (original comments included)
public class UIDGenerator {

    // Modeled after base64 web-safe chars, but ordered by ASCII.
    private static final String PUSH_CHARS = "-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz";

    // Timestamp of last push, used to prevent local collisions if you push twice in one ms.
    private static long lastPushTime = 0;

    // We generate 72-bits of randomness which get turned into 12 characters and appended to the
    // timestamp to prevent collisions with other clients.  We store the last characters we
    // generated because in the event of a collision, we'll use those same characters except
    // "incremented" by one.
    private static int[] lastRandChars = new int[12];

    public static String generatePushId() {
        long now = System.currentTimeMillis();
        boolean duplicateTime = (now == lastPushTime);
        lastPushTime = now;

        char[] timeStampChars = new char[8];
        for (int i = 7; i >= 0; i--) {
            timeStampChars[i] = PUSH_CHARS.charAt((int) (now % 64));
            now = (long) Math.floor(now / 64);
        }
        if (now != 0) throw new Error("We should have converted the entire timestamp.");

        String id = new String(timeStampChars);

        if (!duplicateTime) {
            for (int i = 0; i < 12; i++) {
                lastRandChars[i] = new Random().nextInt(64);
            }
        } else {
            // If the timestamp hasn't changed since last push, use the same random number, except incremented by 1.
            int i;
            for (i = 11; i >= 0 && lastRandChars[i] == 63; i--) {
                lastRandChars[i] = 0;
            }
            lastRandChars[i]++;
        }
        for (int i = 0; i < 12; i++) {
            id += PUSH_CHARS.charAt(lastRandChars[i]);
        }
        if(id.length() != 20) throw new Error("Length should be 20.");

        return id;
    }
}
