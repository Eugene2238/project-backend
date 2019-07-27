package com.example.project.controllers;


import com.example.project.models.Idea;
import com.example.project.models.Review;
import com.example.project.models.User;
import com.example.project.payload.UploadFileResponse;
import com.example.project.services.FileStorageService;
import com.example.project.services.IdeaService;
import com.example.project.services.ReviewService;
import com.example.project.services.UserService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class IdeaController {
    private final IdeaService ideaService;
    private final UserService userService;
    private final ReviewService reviewService;
    private final FileStorageService fileStorageService;

    public IdeaController(IdeaService ideaService, UserService userService, FileStorageService fileStorageService,
                          ReviewService reviewService) {
        this.ideaService = ideaService;
        this.userService = userService;
        this.reviewService = reviewService;
        this.fileStorageService = fileStorageService;
    }

    @RequestMapping(value = "/")
    public String listEntriesMainPage(Model model, Principal principal) {
        if (principal != null) model.addAttribute("user", userService.findByUsername(principal.getName()));
        model.addAttribute("ideas", ideaService.mainEntries());
        model.addAttribute("homeMenu", "active");
        return "index.jsp";
    }


    @RequestMapping(value = {"/ideas", "/ideas/pages/{pageNumber}"})
    public String listEntries(Model model, Principal principal, @PathVariable(value = "pageNumber", required = false) Integer pageNumber) {
        if (principal != null) model.addAttribute("user", userService.findByUsername(principal.getName()));
        if (pageNumber == null) pageNumber = 1;
        Page<Idea> ideas = ideaService.entriesPerPage(pageNumber - 1);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("totalPages", ideas.getTotalPages());
        model.addAttribute("ideas", ideas.getContent());
        model.addAttribute("ideasMenu", "active");
        return "/ideas/list.jsp";
    }

    @RequestMapping(value = "/my_ideas")
    public String MyEntries(Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        User user = userService.findByUsername(principal.getName());
        model.addAttribute("user", user);
        model.addAttribute("ideas", ideaService.myEntries(user));
//        model.addAttribute("ideas", ideaService.allEntries());
        model.addAttribute("myIdeasMenu", "active");
        return "/ideas/list.jsp";
    }

    @RequestMapping(value = "/ideas/new")
    public String showAddForm(@ModelAttribute("idea") Idea idea, Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        model.addAttribute("user", userService.findByUsername(principal.getName()));
        model.addAttribute("addIdea", "active");
        return "/ideas/add.jsp";
    }

    @RequestMapping(value = "/ideas/new", method = RequestMethod.POST)
    public String createEntry(@Valid @ModelAttribute("idea") Idea idea, BindingResult result,
                              @RequestParam("files") MultipartFile files,
                              Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        User user = userService.findByUsername(principal.getName());
        model.addAttribute("user", user);

        if (result.hasErrors()) {
            model.addAttribute("ideas", ideaService.allEntries());
            model.addAttribute("ideasMenu", "active");
            return "/ideas/add.jsp";
        } else {
            idea.setUser(user);
            Idea ideaNew = ideaService.createEntry(idea); // TODO do it manually
            if (!files.isEmpty()) {
                ideaNew.setFileName(fileStorageService.saveFile(files, ideaNew.getId()));
                ideaService.updateEntity(ideaNew);
            }
            return "redirect:/ideas";
        }
    }

    @RequestMapping(value = "/ideas/edit/{id}", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        User user = userService.findByUsername(principal.getName());
        if (!ideaService.checkPermission(id, user)) return "redirect:/login";
        model.addAttribute("user", user);
        model.addAttribute("idea", ideaService.findEntry(id));
        model.addAttribute("ideasMenu", "active");
        return "/ideas/edit.jsp";
    }

    @RequestMapping(value = "/ideas/edit/{id}", method = RequestMethod.POST)
    public String updateEntry(@Valid @ModelAttribute("idea") Idea idea, BindingResult result,
                              @PathVariable("id") Long id, Model model, Principal principal,
                              @RequestParam("files") MultipartFile files) {
        if (principal == null) return "redirect:/login";
        User user = userService.findByUsername(principal.getName());
        if (!ideaService.checkPermission(id, user)) return "redirect:/login";

        if (result.hasErrors()) {
            model.addAttribute("ideasMenu", "active");
            model.addAttribute("user", user);
            return "/ideas/edit.jsp";
        } else {
            ideaService.updateEntity(idea);
            if (!files.isEmpty()) {
                idea.setFileName(fileStorageService.saveFile(files, idea.getId()));
                ideaService.updateEntity(idea);
            }
            return "redirect:/ideas";
        }
    }

    @RequestMapping(value = "/ideas/delete/{id}", method = RequestMethod.GET)
    public String destroyEntry(@PathVariable("id") Long id, Principal principal) {
        if (principal == null) return "redirect:/login";
        User user = userService.findByUsername(principal.getName());
        ideaService.deleteEntryProtected(id, user.getId());
        return "redirect:/ideas";
    }

    @RequestMapping("/ideas/{id}")
    public String showEntry(
            @ModelAttribute("review") Review review, BindingResult result,
            @PathVariable("id") Long id, Model model, Principal principal
    ) {

        if (principal != null) {
            User user = userService.findByUsername(principal.getName());
            model.addAttribute("user", user);
        }

        model.addAttribute("idea", ideaService.findEntry(id));
        model.addAttribute("ideasMenu", "active");
        return "/ideas/show.jsp";
    }


    @RequestMapping(value = "/ideas/{id}/add_review", method = RequestMethod.POST)
    public String updateEntry(@Valid @ModelAttribute("review") Review review, BindingResult result,
                              @PathVariable("id") Long id, Model model, Principal principal) {
        if (principal == null) return "redirect:/login";
        User user = userService.findByUsername(principal.getName());
        Idea idea = ideaService.findEntry(id);
        if (result.hasErrors()) {
            model.addAttribute("idea", idea);
            model.addAttribute("ideasMenu", "active");
            model.addAttribute("user", user);
            return "/ideas/show.jsp";
        } else {
            review.setUser(user);
            review.setIdea(idea);
            reviewService.createEntry(review);
            return "redirect:/ideas/" + id;
        }
    }

}
