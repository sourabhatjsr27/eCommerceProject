/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerceproject.helper;

import static java.lang.System.out;





/**
 *
 * @author Lenovo
 */
public class Helper {
    
    public static String get10words(String desc){
        
        
        desc = desc.trim();
        
        String[] pDesc = desc.split("\\s+");
        
        if(pDesc.length > 10)
        {
             String res = "";
             
             for(int i = 0; i < 10; i++)
             {
                res  = res + pDesc[i] + " "; 
                
             }
             
             out.println(res);
             return (res+"...");
        }else{
            
            return (desc+"...");   
        }
             
        
            
    }
    
}
