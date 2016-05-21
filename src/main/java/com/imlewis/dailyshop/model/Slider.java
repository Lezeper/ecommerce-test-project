package com.imlewis.dailyshop.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.io.Serializable;

@Entity
public class Slider implements Serializable{

    private static final long serialVersionUID = -1345626380557589113L;

    @Id
    @GeneratedValue
    private int sliderId;

    private String sliderUpperData;
    @NotEmpty(message = "Please fill in slider title")
    private String sliderTitle;
    private String sliderDescription;
    @NotEmpty(message = "Please fill in slider link")
    private String sliderLink;

    @Transient
    private MultipartFile sliderImage;

    public int getSliderId() {
        return sliderId;
    }

    public void setSliderId(int sliderId) {
        this.sliderId = sliderId;
    }

    public String getSliderUpperData() {
        return sliderUpperData;
    }

    public void setSliderUpperData(String sliderUpperData) {
        this.sliderUpperData = sliderUpperData;
    }

    public String getSliderTitle() {
        return sliderTitle;
    }

    public void setSliderTitle(String sliderTitle) {
        this.sliderTitle = sliderTitle;
    }

    public String getSliderDescription() {
        return sliderDescription;
    }

    public void setSliderDescription(String sliderDescription) {
        this.sliderDescription = sliderDescription;
    }

    public String getSliderLink() {
        return sliderLink;
    }

    public void setSliderLink(String sliderLink) {
        this.sliderLink = sliderLink;
    }

    public MultipartFile getSliderImage() {
        return sliderImage;
    }

    public void setSliderImage(MultipartFile sliderImage) {
        this.sliderImage = sliderImage;
    }
}
