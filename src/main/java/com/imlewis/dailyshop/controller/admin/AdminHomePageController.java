package com.imlewis.dailyshop.controller.admin;

import com.imlewis.dailyshop.model.Slider;
import com.imlewis.dailyshop.service.SliderService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/admin/homePageSettings")
public class AdminHomePageController {

    private Path path;

    @Autowired
    private SliderService sliderService;

    @RequestMapping
    public String homePageSettings(){
        return "admin/homePageSettings";
    }

    @RequestMapping("/slider")
    public String sliderSettings(Model model){
        List<Slider>sliderList = sliderService.getAllSlider();
        model.addAttribute("sliders", sliderList);
        return "admin/sliderSettings";
    }

    @RequestMapping("/slider/addSlider")
    public String addSlider(Slider slider, Model model){
        model.addAttribute("sliders", slider);
        return "admin/addSlider";
    }

    @RequestMapping(value = "/slider/addSlider", method = RequestMethod.POST)
    public String addSliderPost(@Valid @ModelAttribute ("slider") Slider slider, BindingResult result,
                                HttpServletRequest request){
        if (result.hasErrors()) {
            return "admin/addSlider";
        }

        sliderService.addSlider(slider);

        MultipartFile sliderImage = slider.getSliderImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");

        File theDir = new File(rootDirectory + "\\WEB-INF\\resources\\images\\slider\\" + String.valueOf(slider.getSliderId()));
        try {
            FileUtils.forceMkdir(theDir);
        } catch (IOException e) {
            e.printStackTrace();
        }

        path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\slider\\" + String.valueOf(slider.getSliderId()) + "\\" + "0.png");

        if (sliderImage != null && !sliderImage.isEmpty()) {
            try {
                sliderImage.transferTo(new File(path.toString()));
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Slider image saving failed", e);
            }
        }

        return "redirect:/admin/homePageSettings/slider";
    }
}
