package com.example.moviego.services;

import com.example.moviego.models.Film;
import com.example.moviego.repositories.FilmRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class FilmService {
    private final FilmRepository filmRepository;

    public List<Film> listFilm(String title) {
        if (title != null) return filmRepository.findByTitle(title);
        return filmRepository.findAll();
    }

    public List<Film> listFilmByGenre(String genre) {
        if (genre != null) return filmRepository.findByGenre(genre);
        return filmRepository.findAll();
    }
    public void saveFilm( Film film) throws IOException {
        log.info("Saving new {}", film);
        filmRepository.save(film);
    }
    public void deleteFilm(Long id) {
        filmRepository.deleteById(id);
    }

    public Film getFilmById(Long id) {
        return filmRepository.findById(id).orElse(null);
    }
}