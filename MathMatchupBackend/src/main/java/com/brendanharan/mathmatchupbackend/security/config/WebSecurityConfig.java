///*
// * Copyright (c) 2024 by Brendan Haran, All Rights Reserved.
// * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
// * Current File (WebSecurityConfig.java) Last Modified on 3/29/23, 3:24 PM
// *
// */
//
//package com.brendanharan.mathmatchupbackend.security.config;
//
//import lombok.AllArgsConstructor;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.web.filter.CommonsRequestLoggingFilter;
//
//
//@Configuration
//@AllArgsConstructor
//@EnableWebSecurity
//public class WebSecurityConfig {
//
//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//
//
//
//        http.authorizeHttpRequests().requestMatchers("/api/v*/instructions/**").authenticated()
//                .anyRequest().permitAll()
//                .and()
//                .oauth2ResourceServer().jwt();
//        //http.authorizeHttpRequests().requestMatchers("/api/v*/instructions/**").permitAll();
//
//        return http.build();
//    }
//
//    @Configuration
//    public class RequestLoggingFilterConfig {
//
//        @Bean
//        public CommonsRequestLoggingFilter logFilter() {
//            CommonsRequestLoggingFilter filter
//                    = new CommonsRequestLoggingFilter();
//            filter.setIncludeQueryString(true);
//            filter.setIncludePayload(true);
//            filter.setMaxPayloadLength(10000);
//            filter.setIncludeHeaders(false);
//            filter.setAfterMessagePrefix("REQUEST DATA : ");
//            return filter;
//        }
//    }
//
//
//}
