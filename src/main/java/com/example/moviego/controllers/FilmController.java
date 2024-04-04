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
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class FilmController {
    private final FilmService filmService;

    @GetMapping("/")
    public String films(@RequestParam(name = "title", required = false) String title, Model model) {
        model.addAttribute("films", filmService.listFilm(title));
        return "films";
    }
    @GetMapping("/genre")
    public String filmsByGenre(@RequestParam(name = "genre", required = false) String genre, Model model) {
        model.addAttribute("films", filmService.listFilmByGenre(genre));
        return "films";
    }

    @GetMapping("/film/{id}")
    public String filmInfo(@PathVariable Long id, Model model) {
        Film film = filmService.getFilmById(id);
        model.addAttribute("films", film);
        model.addAttribute("images", film.getImages());
        return "film-info";
    }

    @PostMapping("/film/create")
    public String createFilm(@RequestParam("file") MultipartFile file,Film film) throws IOException {
        filmService.saveFilm(film, file);
        return "redirect:/";
    }

    @PostMapping("/film/delete/{id}")
    public String deleteFilm(@PathVariable Long id) {
        filmService.deleteFilm(id);
        return "redirect:/";
    }
}

