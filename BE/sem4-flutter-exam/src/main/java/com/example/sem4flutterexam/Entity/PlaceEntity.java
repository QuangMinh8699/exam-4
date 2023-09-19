package com.example.sem4flutterexam.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlaceEntity {
    private String placeName;
    private String imageUrl;
    private double rating;
}
