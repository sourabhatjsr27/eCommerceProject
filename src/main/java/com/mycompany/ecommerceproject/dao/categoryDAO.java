/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerceproject.dao;

import org.hibernate.SessionFactory;
import com.mycompany.ecommerceproject.dao.categoryDAO;
import com.mycompany.ecommerceproject.entities.category;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Lenovo
 */
public class categoryDAO {
    
    private SessionFactory factory;
    
    public categoryDAO(SessionFactory factory){
        
        this.factory = factory; 
    }
    
    public int saveCategory(category cat){
          
        Session session = this.factory.openSession();
        
        Transaction tx = session.beginTransaction();
        
        int catId = (int)session.save(cat);
        
        tx.commit();
        
        session.close();
         
        return catId;
         
        
    }
    
    public List<category> getCategories() {
        
        Session s = this.factory.openSession();
        
        return s.createQuery("FROM category", category.class).getResultList();
    }
    
    public category getCategoryById(int cid){
         
        category cate = null;
        try{
            
            Session se = this.factory.openSession();
            
             cate = se.get(category.class, cid);
             
             se.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return cate;
    }
}
