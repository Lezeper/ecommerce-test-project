package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.Slider;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class SliderDaoImp implements SliderDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addSlider(Slider slider){
        Session session = sessionFactory.getCurrentSession();
        session.save(slider);
        session.flush();
    }

    public void editSlider(Slider slider){
        Session session = sessionFactory.getCurrentSession();
        session.update(slider);
        session.flush();
    }

    public List<Slider> getAllSlider(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Slider");
        List<Slider> sliderList = query.list();
        session.flush();

        return sliderList;
    }

    public Slider getSliderById(int sliderId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Slider WHERE sliderId=?");
        query.setInteger(0, sliderId);

        return (Slider) query.uniqueResult();
    }
}
