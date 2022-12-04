package com.springproject01.demo.web.RecordMeal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.springproject01.demo.meal.RecordMealService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/record-meal")
@RequiredArgsConstructor
public class RecordMealController {

    private final RecordMealService recordMealService;

    @GetMapping
    public String RecordMeal() {
        return "/record-meal/record-meal";
    }

    @GetMapping("/new")
    public String NewRecordMeal(Model model) {
        Map<String, String> NutrientMap = new HashMap<>() {
            {
                put("タンパク質", "protein");
                put("糖質", "sugar_content");
                put("脂質", "lipid");
                put("ビタミン", "vitamin");
                put("ミネラル", "mineral");
            }
        };
        List<Integer> RadioValues = new ArrayList(Arrays.asList(0, 1, 2, 3, 4, 5));

        model.addAttribute("RadioValues", RadioValues);
        model.addAttribute("NutrientMap", NutrientMap);
        return "/record-meal/new";
    }

    @GetMapping("/show")
    public String ShowRecordMeal(Model model) {
        model.addAttribute("RecordMealList", recordMealService.findAll());
        return "record-meal/show";
    }

    @GetMapping("/show-all")
    public String ShowRecordMealAll(Model model) {
        model.addAttribute("RecordMealList", recordMealService.findAll());
        return "record-meal/show-all";
    }

    @GetMapping("/sample")
    public String SampleRecordMeal() {
        return "/record-meal/sample";
    }

    @PostMapping
    public String create(@Validated NutrientForm form, BindingResult bindingResult) {
        recordMealService.create(form.getDay(), form.getMeal_time_zone(), form.getProtein(), form.getSugar_content(),
                form.getLipid(), form.getVitamin(), form.getMineral());
        return "redirect:/";
    }
}
