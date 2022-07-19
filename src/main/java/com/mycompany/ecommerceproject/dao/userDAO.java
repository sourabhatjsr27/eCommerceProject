
package com.mycompany.ecommerceproject.dao;
import com.mycompany.ecommerceproject.entities.User;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;




public class userDAO {
     
    private SessionFactory  factory;

    public userDAO(SessionFactory factory) {
        this.factory = factory;
    }
    
    // method get user by email and password 
    
    public User getUserByEmailAndPassword(String email , String password)
    {
         
        User user = null;
        
        try{
            
            String query = "from User where userEmail =: e and userPassword =: p";
            
            Session session = this.factory.openSession();
            
           Query q =  session.createQuery(query);
           
           q.setParameter("e",email);
           q.setParameter("p",password);
           
           user = (User)q.getSingleResult();
           
           
            session.close();
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
}
