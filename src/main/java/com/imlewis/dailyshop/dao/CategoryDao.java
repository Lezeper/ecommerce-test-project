package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.Category;

import java.util.List;

public interface CategoryDao {

    Category getCategoryById(int id);

    List<String> getSubCategoryByMainCategoryName(String mainCategory);

    List<Category> getAllCategory();

    List<String> getAllMainCategory();

    List<String> getAllSubCategory();

    void addCategory(Category category);

    void deleteCategory(Category category);

    void editCategory(Category category);
}
