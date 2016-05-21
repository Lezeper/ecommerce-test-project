package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.model.Slider;

import java.util.List;

public interface SliderService {
    void addSlider(Slider slider);

    void editSlider(Slider slider);

    List<Slider> getAllSlider();

    Slider getSliderById(int sliderId);
}
