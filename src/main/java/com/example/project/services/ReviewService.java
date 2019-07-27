package com.example.project.services;

import com.example.project.models.Idea;
import com.example.project.models.Review;
import com.example.project.models.User;
import com.example.project.repositories.IdeaRepository;
import com.example.project.repositories.ReviewRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final IdeaRepository ideaRepository;

    public ReviewService(IdeaRepository ideaRepository, ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
        this.ideaRepository = ideaRepository;
    }

    // creates an entry
    public Review createEntry(Review r) {
        Review newEntity = new Review(r.getTitle(), r.getDescription(), r.getUser(), r.getIdea());
        return reviewRepository.save(newEntity);
    }

    public List<Review> allEntries() {
        return reviewRepository.findAll();
    }

    // retrieve an entry
    public Review findEntry(Long id) {
        Optional<Review> optionalEntity = reviewRepository.findById(id);
        if (optionalEntity.isPresent()) {
            return optionalEntity.get();
        } else {
            return null;
        }
    }

    // retrieve an entry
    public Review retrieveEntry(Long id) {
        return reviewRepository.findFirstById(id);
    }

    // delete an entry
    public void deleteEntry(Long id) {
        Optional<Review> optionalEntry = reviewRepository.findById(id);
        if (optionalEntry.isPresent()) {
            reviewRepository.deleteById(id);
        }
    }

}