/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */




function addToCart(pId,pName,pPrice,pAvailabelQuantity){
    
    
    let cart = localStorage.getItem("cart");
    
    if(pAvailabelQuantity === 0)
        {
            alert("Product is out of stock !!!!");
            return;
        }
    
    if(cart == null)
    {
        let products=[];
            
        let product = {productId:pId,productName:pName,productQuantity:1,productPrice:pPrice,productAvailabelQuantity:pAvailabelQuantity};
        
        products.push(product);
        
        localStorage.setItem("cart",JSON.stringify(products));
        
        console.log("first product added  !");
        
        showToast();
        
    }else{
         
         let pcart = JSON.parse(cart);
         
         let oldProduct = pcart.find((item) => item.productId === pId);
          console.log(oldProduct);
          
         if(oldProduct){
             
              let pQuantity = parseInt(oldProduct.productQuantity);
             
              if(pQuantity < pAvailabelQuantity)
              {
//             we have to increase the quantitiy
                oldProduct.productQuantity = oldProduct.productQuantity + 1;
                
                pcart.map((item)=> {
                     
                     if(item.productId === oldProduct.productId){
                         
                         item.productQuantity = oldProduct.productQuantity;
                     }
                });
                
                localStorage.setItem("cart",JSON.stringify(pcart));
                console.log("product quantity is increased .....");
                
                 showToast();   
                    
                   
                
            }else{
                 alert("Product quantity is exhausted !!!");  
            }
             
         }else{
                
//             we have to add the product 
                let product = {productId:pId,productName:pName,productQuantity:1,productPrice:pPrice,productAvailabelQuantity:pAvailabelQuantity};
                pcart.push(product);
                localStorage.setItem("cart",JSON.stringify(pcart));
                console.log("product added !!");
                
                showToast();
         }
    }
    
    updateCart();
     
}

//update cart

function updateCart(){
     
    let cartString =  localStorage.getItem("cart");
    
    let cart = JSON.parse(cartString);
    
    if(cart === null || cart.length === 0)
    {
       console.log("cart is empty !!");
       $(".cart-products").html("(0)");
       $(".cart-body").html("<h3> Cart is empty </h3>");
       $("checkout-btn").addClass('disabled');
    }else{
        
        console.log(cart);
        $(".cart-products").html(`(${cart.length})`);
        
        let table = `
        
        <table class='table'>
        
        <thead class = 'thread-light'>
        
           <tr>
               <th>Item Name </th>
               <th>Price </th>
               <th>Quantity</th>
               <th>Total Price</th>
               <th>Action   </th>
           </tr>
        
        </thead> `;
        
        let totalPrice = 0;
        
        cart.map((item) => {
        
        table += `
                <tr>
        
        <td> ${item.productName}</td>
        <td> ${item.productPrice}</td>
        <td>
            <button onclick='decreseQuantity(${item.productId})' class="btn btn-danger btn-sm"> - </button>
            ${item.productQuantity}<button onclick='increaseQuantity(${item.productId},${item.productAvailabelQuantity})' class="btn btn-success btn-sm"> + </button>

        </td>
        <td> ${item.productQuantity*item.productPrice}</td>
        <td><button onclick='deleteItemsFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button></td>
         
         
          
                </tr>
            `
                                         
            totalPrice += item.productPrice*item.productQuantity;                
            })

     table = table + `
               <tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ${totalPrice} </td></tr>
               </table>`
     
      $(".cart-body").html(table);

    } 
    
       
}

function deleteItemsFromCart(pid){
    
    let cart = JSON.parse(localStorage.getItem('cart'));
    
    let newcart = cart.filter((item) => item.productId != pid)
    
    localStorage.setItem('cart',JSON.stringify(newcart));
    
    updateCart();
}

function increaseQuantity(pId,pAvailabelQuantity){
     
      let cart = localStorage.getItem('cart');
      
      let pcart = JSON.parse(cart);
         
       let oldProduct = pcart.find((item) => item.productId === pId);
       console.log(oldProduct);
       
        
       if(oldProduct.productQuantity === pAvailabelQuantity)
       {
           alert("product quantity is exhausted");
       }
       else{       
                pcart.map((item)=> {
                     
                     if(item.productId === oldProduct.productId){
                         
                         item.productQuantity = oldProduct.productQuantity+1;
                     }
                });
                
                localStorage.setItem("cart",JSON.stringify(pcart));
                console.log("product quantity is decreased .....");
                
                updateCart();
       
        
    }
}


function decreseQuantity(pId){
      
      let cart = localStorage.getItem('cart');
      
      let pcart = JSON.parse(cart);
         
       let oldProduct = pcart.find((item) => item.productId === pId);
       console.log(oldProduct);
       
        oldProduct.productQuantity = oldProduct.productQuantity  - 1;
        
        if(oldProduct.productQuantity === 0)
        {
            deleteItemsFromCart(oldProduct.productId);
        }
        else{    
                
                pcart.map((item)=> {
                     
                     if(item.productId === oldProduct.productId){
                         
                         item.productQuantity = oldProduct.productQuantity;
                     }
                });
                
                localStorage.setItem("cart",JSON.stringify(pcart));
                console.log("product quantity is decreased .....");
                
                updateCart();
       
        }
}

function showToast(){
         
         console.log("inside showToast");
        $('#toast-id').addClass('show');
}

function removeToast(){
    
      $('#toast-id').removeClass('show');
    
}




$(document).ready(function(){
    updateCart();
});

