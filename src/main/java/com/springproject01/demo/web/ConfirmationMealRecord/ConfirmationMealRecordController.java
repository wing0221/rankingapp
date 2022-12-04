package com.springproject01.demo.web.ConfirmationMealRecord;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConfirmationMealRecordController {

    @GetMapping("/confirmation-meal-record")
    public String ConfirmationMealRecord() {
        return "/confirmation-meal-record/confirmation-meal-record";
    }

}
