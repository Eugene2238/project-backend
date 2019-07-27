package com.example.project.repositories;

import com.example.project.models.Review;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {

    List<Review> findAll();

    List<Review> findAllByUserId(Long id);

    Review findFirstById(Long id);

}
