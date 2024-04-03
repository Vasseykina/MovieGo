package com.example.moviego.services;

import com.example.moviego.models.Film;
import com.example.moviego.repositories.FilmRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class FilmService {
    private final FilmRepository FilmRepository;

    public List<Film> listProducts(String title) {
        if (title != null) return FilmRepository.findByTitle(title);
        return FilmRepository.findAll();
    }

    public void saveFilm(Film film) {
        log.info("Saving new {}", film);
        FilmRepository.save(film);
    }
    public void deleteFilm(Long id) {
        FilmRepository.deleteById(id);
    }

    public Film getFilmById(Long id) {
        return FilmRepository.findById(id).orElse(null);
    }
}