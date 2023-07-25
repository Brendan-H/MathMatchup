package com.brendanharan.mathmatchupbackend.games;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface GameRepository extends JpaRepository<Game, Long> {

    Game findByGameCode(String gameCode);
    default Long findIdByGameCode(String gameCode) {
        Game game = findByGameCode(gameCode);
        return game.getId();
    }

    List<Game> findByEndTimeBefore(LocalDate endTime);

}