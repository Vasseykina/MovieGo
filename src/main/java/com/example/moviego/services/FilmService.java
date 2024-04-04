package com.example.moviego.services;

import com.example.moviego.models.Film;
import com.example.moviego.models.Image;
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
    public void saveFilm( Film film, MultipartFile file) throws IOException {
        Image image;
        if(file.getSize()!=0){
            image = toImageEntity(file);
            image.setPreviewImage(true);
            film.addImageToFilm(image);
        }
        Film filmFromDb = filmRepository.save(film);
        filmFromDb.setPreviewImageId(filmFromDb.getImages().get(0).getId());
        filmRepository.save(film);
    }
    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteFilm(Long id) {
        filmRepository.deleteById(id);
    }

    public Film getFilmById(Long id) {
        return filmRepository.findById(id).orElse(null);
    }
}