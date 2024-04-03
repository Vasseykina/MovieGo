package com.example.moviego.controllers;

import com.example.moviego.models.Film;
import com.example.moviego.services.FilmService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class FilmController {
    private final FilmService filmService;

    @GetMapping("/")
    public String films(@RequestParam(name = "title", required = false) String title, Model model) {
        model.addAttribute("films", filmService.listProducts(title));
        return "films";
    }

    @GetMapping("/film/{id}")
    public String filmInfo(@PathVariable Long id, Model model) {
        model.addAttribute("films", filmService.getFilmById(id));
        return "film-info";
    }

    @PostMapping("/film/create")
    public String createFilm(Film film) {
        filmService.saveFilm(film);
        return "redirect:/";
    }

    @PostMapping("/film/delete/{id}")
    public String deleteFilm(@PathVariable Long id) {
        filmService.deleteFilm(id);
        return "redirect:/";
    }
}

