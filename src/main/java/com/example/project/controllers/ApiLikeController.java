package com.example.project.controllers;


import com.example.project.models.User;
import com.example.project.services.IdeaService;
import com.example.project.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
public class ApiLikeController {

    private final IdeaService ideaService;
    private final UserService userService;

    public ApiLikeController(IdeaService ideaService, UserService userService) {
        this.ideaService = ideaService;
        this.userService = userService;
    }

//    @RequestMapping(value = "/api/books", method = RequestMethod.POST)
//    public Book create(@RequestParam(value = "title") String title,
//                       @RequestParam(value = "description") String desc,
//                       @RequestParam(value = "language") String lang,
//                       @RequestParam(value = "pages") Integer numOfPages) {
//        Book book = new Book(title, desc, lang, numOfPages);
//        return bookService.createBook(book);
//    }

    // TODO TRY @PostMapping
    @RequestMapping(value = "/ideas/{id}/like", method = RequestMethod.GET)
    public boolean like(@PathVariable("id") Long id, Principal principal) {
        User user = userService.findByUsername(principal.getName());
        if (user == null) return false;
        ideaService.like(id, user);
        return true;
    }

    @RequestMapping(value = "/ideas/{id}/unlike", method = RequestMethod.GET)
    public boolean unlike(@PathVariable("id") Long id, Principal principal) {
        User user = userService.findByUsername(principal.getName());
        if (user == null) return false;
        ideaService.unlike(id, user);
        return true;
    }



}
