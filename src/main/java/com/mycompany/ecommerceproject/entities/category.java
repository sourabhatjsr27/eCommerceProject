/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerceproject.entities;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import java.util.*;


@Entity
public class category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int category_id;
    private String category_title;
    private String category_desc;
    @OneToMany(mappedBy = "category_id")
    private List<product> product_list = new ArrayList<>();
    public category() {
    }

    public category(int category_id, String category_title, String category_desc) {
        this.category_id = category_id;
        this.category_title = category_title;
        this.category_desc = category_desc;
    }

    public category(String category_title, String category_desc,List<product> p_list) {
        this.category_title = category_title;
        this.category_desc = category_desc;
        this.product_list = p_list;
    }
    
    
    @Override
    public String toString() {
        return "category{" + "category_id=" + category_id + ", category_title=" + category_title + ", category_desc=" + category_desc + '}';
    }
    
    

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_title() {
        return category_title;
    }

    public void setCategory_title(String category_title) {
        this.category_title = category_title;
    }

    public String getCategory_desc() {
        return category_desc;
    }

    public void setCategory_desc(String category_desc) {
        this.category_desc = category_desc;
    }

    public List<product> getProduct_list() {
        return product_list;
    }

    public void setProduct_list(List<product> product_list) {
        this.product_list = product_list;
    }
    
    
    
    
}
