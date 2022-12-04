package com.springproject01.demo.meal;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RecordMealService {

    private final RecordMealRepository recordMealRepository;

    public List<RecordMealEntity> findAll() {
        // return List.of(new RecordMealEntity(1, "2022/12/21", "朝食", 2, 3, 5, 1, 5),
        // new RecordMealEntity(2, "2022/12/21", "昼食", 4, 5, 5, 3, 2),
        // new RecordMealEntity(3, "2022/12/21", "夕食", 2, 5, 5, 2, 3));
        return recordMealRepository.findAll();
    }

    public void create(String day, String Meal_time_zone, int Protein, int Sugar_content, int Lipid, int Vitamin,
            int Mineral) {
        recordMealRepository.insert(day, Meal_time_zone, Protein, Sugar_content, Lipid, Vitamin, Mineral);
    }
}
