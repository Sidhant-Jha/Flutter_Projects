import 'dart:developer';
import 'dart:math' as mith;

import 'package:cart_application/models/product.dart';
import 'package:cart_application/screens/cart_screen.dart';
import 'package:cart_application/widgets/floating_button.dart';
import 'package:cart_application/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


List<Product> productList = [
  Product(productPrice: 950, productname: "IPhone 16", productCurrency: "\$", productImage: "assets/images/iphone16.jpg", productId: 1),

  Product(productPrice: 980, productname: "Motorola Razr", productCurrency: "\$", productImage: "assets/images/motorolarazr.webp", productId: 2),

  Product(productPrice: 500, productname: "Oppo Reno 12", productCurrency: "\$", productImage: "assets/images/opporeno12.webp", productId: 3),

  Product(productPrice: 450, productname: "Vivo V25", productCurrency: "\$", productImage: "assets/images/vivov25.jpg", productId: 4),

];

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen>
{
  Map<int, int> cart = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      
      floatingActionButton: FloatingButton(
        onTap: () {
          //Navigator.pushreplacement for back button on cart page 
          Navigator.push<Map<int, int>>(
            context,
            MaterialPageRoute(builder: (context) {
              return CartScreen(cart: cart,); // Replace with the widget you want to navigate to
            }),
          ).then((value) {
            setState(() {
              if (value != null)
              {
                cart = value;
              }
            });
          });
        },
        icon: Icon(Icons.shopping_bag, color: Colors.white,),
      ),
      body: ListView.separated(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          Product product = productList[index];
          return ProductList(product: product, onTapAdd: () =>  addItemToCart(product), onTapRemove: () =>  removeItemToCart(product), quantity: getQuantity(product));
        },
        separatorBuilder: (context, index)
        {
          return Divider();
        }, 
      )
    );
  }
  
  void addItemToCart(Product product)
  {
    setState(() {
      if(cart.containsKey(product.productId))
      {
        final quantity = cart[product.productId] as int;
        cart[product.productId] = quantity + 1;
      }
      else
      {
        cart[product.productId] = 1;
      }
    });
  }

  void removeItemToCart(Product product)
  {
    setState(() {
      if(cart.containsKey(product.productId))
      {
        final quantity = cart[product.productId] as int;
        if(quantity > 1)
        {
        cart[product.productId] = quantity - 1;
        }
        else{
          cart.remove(product.productId);
        }
      }
    });
  }


  int getQuantity(Product product)
  {
    if(cart.containsKey(product.productId))
    {
      return cart[product.productId] as int;
    }
    else 
    {
      return 0;
    }
  }
}