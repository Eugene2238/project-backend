package com.example.project.repositories;

import com.example.project.models.Idea;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IdeaRepository extends PagingAndSortingRepository<Idea, Long> {

    List<Idea> findAll();

    List<Idea> findTop12ByOrderByCountLikesDesc();

    List<Idea> findAllByUserId(Long id);

    Idea findFirstById(Long id);

    @Query("SELECT i.user, count (l) as cnt, i FROM Idea i LEFT JOIN i.likes l " +
            "GROUP BY i " +
            "ORDER BY cnt DESC ")
    List<Object[]> findAllHigh();

    @Query("SELECT i.user, count (l) as cnt, i FROM Idea i LEFT JOIN i.likes l " +
            "GROUP BY i " +
            "ORDER BY cnt ")
    List<Object[]> findAllLow();

}
