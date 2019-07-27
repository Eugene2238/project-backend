package com.example.project.services;

import com.example.project.models.Idea;
import com.example.project.models.User;
import com.example.project.repositories.IdeaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class IdeaService {

    private final IdeaRepository ideaRepository;

    private static final int PAGE_SIZE = 8;

    public IdeaService(IdeaRepository ideaRepository) {
        this.ideaRepository = ideaRepository;
    }

    // creates an entry
    public Idea createEntry(Idea entity) {
        return ideaRepository.save(entity);
    }

    public List<Idea> allEntries() {
        return ideaRepository.findAll();
    }

    public List<Idea> mainEntries() {
        return ideaRepository.findTop12ByOrderByCountLikesDesc();
    }


    // retrieve an entry
    public Idea findEntry(Long id) {
        Optional<Idea> optionalEntity = ideaRepository.findById(id);
        if (optionalEntity.isPresent()) {
            return optionalEntity.get();
        } else {
            return null;
        }
    }

    // retrieve an entry
    public Idea retrieveEntry(Long id) {
        return ideaRepository.findFirstById(id);
    }

    // delete an entry
    public void deleteEntry(Long id) {
        Optional<Idea> optionalEntry = ideaRepository.findById(id);
        if (optionalEntry.isPresent()) {
            ideaRepository.deleteById(id);
        }
    }

    // delete an entry (PROTECTED)
    public void deleteEntryProtected(Long id, Long userId) {
        Idea optionalEntry = ideaRepository.findFirstById(id);
        if (optionalEntry != null) {
            if (optionalEntry.getUser().getId().equals(userId)) ideaRepository.deleteById(id);
        }
    }

    public Boolean checkPermission(Long id, User user) {
        if (user == null) return false;
        Idea oldIdea = ideaRepository.findFirstById(id);
        if (oldIdea == null) return false;
        return (oldIdea.getUser().getId().equals(user.getId()));
    }

    public void updateEntity(Idea idea) {
        Idea entry = ideaRepository.findFirstById(idea.getId());
        entry.setName(idea.getName());
        entry.setDescription(idea.getDescription());
        if (idea.getFileName() != null) entry.setFileName(idea.getFileName());
//        entry.setDate(idea.getDate());
        ideaRepository.save(entry);
    }


    // like
    public void like(Long id, User u) {
        Idea optionalEntry = ideaRepository.findFirstById(id);
        if (optionalEntry != null) {
            String key = Long.toString(u.getId()) + Long.toString(optionalEntry.getId());
            optionalEntry.getLikes().put(key, u);
            if (optionalEntry.getCountLikes() == null) optionalEntry.setCountLikes(0);
            optionalEntry.setCountLikes(optionalEntry.getCountLikes() + 1);
            ideaRepository.save(optionalEntry);
        }
    }

    // unlike
    public void unlike(Long id, User u) {
        Idea optionalEntry = ideaRepository.findFirstById(id);
        if (optionalEntry != null) {
            String key = Long.toString(u.getId()) + Long.toString(optionalEntry.getId());
            optionalEntry.getLikes().remove(key);
            if (optionalEntry.getCountLikes() == null) optionalEntry.setCountLikes(0);
            optionalEntry.setCountLikes(optionalEntry.getCountLikes() - 1);
            ideaRepository.save(optionalEntry);
        }
    }

    public List<Object[]> allEntriesLow() {
        return ideaRepository.findAllLow();
    }

    public List<Object[]> allEntriesHigh() {
        return ideaRepository.findAllHigh();
    }

    public List<Idea> myEntries(User user) {
        return ideaRepository.findAllByUserId(user.getId());
    }


    public Page<Idea> entriesPerPage(int pageNumber) {
        PageRequest pageRequest = new PageRequest(pageNumber, PAGE_SIZE, Sort.Direction.DESC, "countLikes");
        return ideaRepository.findAll(pageRequest);
    }


}
