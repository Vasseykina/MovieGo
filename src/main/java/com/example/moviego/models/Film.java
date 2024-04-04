package com.example.moviego.models;

import lombok.Data;

import javax.persistence.*;


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
    @Column (name = "description")
    private String description;
    @Column(name = "genre")
    private String genre;

}