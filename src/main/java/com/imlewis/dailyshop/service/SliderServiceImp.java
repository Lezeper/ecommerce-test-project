package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.dao.SliderDao;
import com.imlewis.dailyshop.model.Slider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SliderServiceImp implements SliderService {

    @Autowired
    private SliderDao sliderDao;

    public void addSlider(Slider slider){
        sliderDao.addSlider(slider);
    }

    public void editSlider(Slider slider){
        sliderDao.editSlider(slider);
    }

    public List<Slider> getAllSlider(){
        return sliderDao.getAllSlider();
    }

    public Slider getSliderById(int sliderId){
        return  getSliderById(sliderId);
    }
}
