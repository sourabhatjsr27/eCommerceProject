
package com.mycompany.ecommerceproject.dao;

import com.mycompany.ecommerceproject.entities.product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import java.util.*;
import javax.persistence.Query;


public class productDAO {
     
    private SessionFactory factory;
    
    public productDAO(SessionFactory factory ){
         
        this.factory = factory;
    }
    
    public boolean saveProduct(product p){
        
        boolean flag = false;
        
        try{
            
            Session session = this.factory.openSession();
            
            Transaction tx = session.beginTransaction();
            
            session.save(p);
            
            tx.commit();
            session.close();
            
            flag = true;
            
        }catch(Exception e){
             
            e.printStackTrace();
            flag = false;
        }
        
        return flag ;
    }
    
//      fetching all products 
      public List<product> getAllProducts(){
           
           Session productSession = this.factory.openSession();
           
           return productSession.createQuery("FROM product", product.class).getResultList();
            
      } 
      
      
//      fetching products by category
      public List<product> getAllProductsbyId(int cid){
           
           Session productofCategorySession = this.factory.openSession();
           
           Query query = productofCategorySession.createQuery("from product as p where p.category_id.category_id =: id");
           
           query.setParameter("id",cid);
           
           
           return query.getResultList();
            
      }
      
//      fetching discounted price
      
     
}
