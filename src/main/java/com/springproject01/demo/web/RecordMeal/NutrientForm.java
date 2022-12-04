package com.springproject01.demo.web.RecordMeal;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class NutrientForm {

    @Pattern(regexp = "朝食|昼食|夕食|間食", message = "朝食、昼食、夕食、間食のいずれかを選択してください。")
    private String day;

    private String meal_time_zone;

    @Range(min = 0, max = 5)
    @NotNull
    private int protein;

    @Range(min = 0, max = 5)
    @NotNull
    private int sugar_content;

    @Range(min = 0, max = 5)
    @NotNull
    private int lipid;

    @Range(min = 0, max = 5)
    @NotNull
    private int vitamin;

    @Range(min = 0, max = 5)
    @NotNull
    private int mineral;
}
