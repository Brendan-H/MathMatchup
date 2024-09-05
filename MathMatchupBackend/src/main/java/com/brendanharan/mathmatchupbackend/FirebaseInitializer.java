/*
 * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (FirebaseInitializer.java) Last Modified on 8/2/24, 8:00 PM
 *
 */

package com.brendanharan.mathmatchupbackend;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.io.InputStream;

//  @Value("classpath:serviceAccountKey.json")
@Configuration
public class FirebaseInitializer {

    ///TODO: THIS IS FOR RUNNING IN HEROKU

//    @Value("${GOOGLE_CREDENTIALS}")
//    private String gservicesConfig;
//
//    @Bean
//    public FirebaseApp provideFirebaseOptions() throws IOException {
//        //    JSONObject jsonObject = new JSONObject(gservicesConfig.toString());
//        InputStream is = new ByteArrayInputStream(gservicesConfig.getBytes());
//        FirebaseOptions options = new FirebaseOptions.Builder()
//                .setCredentials(GoogleCredentials.fromStream((is)))
//                .build();
//
//        return FirebaseApp.initializeApp(options);
//    }

    ///TODO: THIS IS FOR RUNNING LOCALLY
    @Bean
    void initializeFirebaseApp() throws IOException {

        if (FirebaseApp.getApps() == null || FirebaseApp.getApps().isEmpty()) {
            InputStream serviceAccount = FirebaseInitializer.class.getResourceAsStream("/ServiceAccountKey.json");
            assert serviceAccount != null;
            GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(credentials)
                    .build();

            FirebaseApp.initializeApp(options);
        }

    }
}