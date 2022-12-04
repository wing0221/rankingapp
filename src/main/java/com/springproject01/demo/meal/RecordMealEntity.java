package com.springproject01.demo.meal;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RecordMealEntity {
    private int id;
    private String day;
    private String meal_time_zone;
    private int protein;
    private int sugar_content;
    private int lipid;
    private int vitamin;
    private int mineral;
}
