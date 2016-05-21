package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.Slider;

import java.util.List;

/**
 * Created by lewis on 5/5/2016.
 */
public interface SliderDao {
    void addSlider(Slider slider);

    void editSlider(Slider slider);

    List<Slider> getAllSlider();

    Slider getSliderById(int sliderId);
}
