package com.example.moviego.models;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "films")
@Data
public class Film {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private Long id;
    @Column(name="title")
    private String title;
    @Column(name="releaseYear")
    private String releaseYear;
    @Column(name = "description", columnDefinition = "text")
    private String description;
    @Column(name = "genre")
    private String genre;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,
    mappedBy = "film")
    private List<Image> images = new ArrayList<>();
    private Long previewImageId;


    public void addImageToFilm(Image image) {
        image.setFilm(this);
        images.add(image);
    }

}