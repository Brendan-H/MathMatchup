/*
 * Copyright (c) 2025 by Brendan Haran, All Rights Reserved.
 * Use of this file or any of its contents is strictly prohibited without prior written permission from Brendan Haran.
 * Current File (UserControllerTest.java) Last Modified on 2/11/25, 4:48 PM
 *
 */

package com.brendanharan.mathmatchupbackend.users;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.UserImportResult;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Testcontainers
public class UserControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private FirebaseAuth firebaseAuth;  // Mock Firebase

    @Autowired
    private UserRepository userRepository;

    @Container
    public static PostgreSQLContainer<?> postgreSQLContainer = new PostgreSQLContainer<>("postgres:15")
            .withDatabaseName("mathmatchuptest")
            .withUsername("test")
            .withPassword("test");

    @BeforeAll
    static void setup() {
        postgreSQLContainer.start();
    }

    @Test
    void testCreateUser() throws Exception {
        User user = new User();
        user.setUid("11223344");
        user.setEmail("test@example.com");
        user.setDisplayName("Test User");
        user.setSchoolId(123L);
        user.setRole("Teacher");

        mockMvc.perform(post("/users/create")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(user)))
                .andExpect(status().isOk());

        Assertions.assertNotNull(userRepository.findByUid("11223344"));
    }

    @Test
    void testBulkCreateUsers() throws Exception {
        UserImportResult mockResult = mock(UserImportResult.class);
        when(mockResult.getSuccessCount()).thenReturn(1);
        when(mockResult.getFailureCount()).thenReturn(0);
        when(firebaseAuth.importUsers(anyList())).thenReturn(mockResult);
        String csvContent = "email,lastName,firstName\n"
                + "test1@example.com,One,Tester\n"
                + "test2@example.com,Two,Test";

        MockMultipartFile csvFile = new MockMultipartFile("usersCSV", "users.csv",
                "text/csv", csvContent.getBytes());

        mockMvc.perform(multipart("/users/bulkcreate")
                        .file(csvFile)
                        .header("schoolID", "123")
                        .header("school", "Test School"))
                .andExpect(status().isOk());

        assertEquals(2, userRepository.count());
    }
}
