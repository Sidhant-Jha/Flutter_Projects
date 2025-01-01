import 'package:cart_application/models/product.dart';
import 'package:cart_application/screens/home_screen.dart';
import 'package:cart_application/widgets/product_list.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.cart});

  final Map<int, int> cart;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  Map<int, int> cart = {};


  @override
  void initState()
  {
    super.initState();
    cart = widget.cart;
  }

  Product getProductById(int productId)
  {
    for (Product product in productList)
    {
      if (product.productId == productId)
      {
        return product;
      }
    }
    throw Exception('Product with ID $productId not found');
  }

 // the below will give stateError on empty cart 

  // int amount() {
  // return cart.entries
  //     .map((entry) {
  //       final productPrice = getProductById(entry.key).productPrice;
  //       return productPrice * entry.value; // Calculate the total for each product
  //     })
  //     .reduce((total, element) => total + element); // Sum all individual totals
  // }

  int amount() {
  return cart.entries.fold(0, (total, entry) {
    final productPrice = getProductById(entry.key).productPrice;
    return total + (productPrice * entry.value);
  });
}



  double discount() {
    return 0.05 * amount();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(cart),
        ),
      ),
      
      body: ListView(
        children: [ 
            ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cart.entries.length,
            itemBuilder: (context, index) {
              final entry = cart.entries.elementAt(index);
              Product product = getProductById(entry.key);
              return ProductList(product: product, onTapAdd: () =>  addItemToCart(product), onTapRemove: () =>  removeItemToCart(product), quantity: getQuantity(product));
            },
            separatorBuilder: (context, index)
            {
              return Divider();
            }, 
          ),

          Divider(thickness: 5,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Price (${cart.length} itmes) : ', style: TextStyle(fontSize: 17, )),
                        Spacer(),
                        Text('\$ ${amount()}', style: TextStyle(fontSize: 17, ))
                      ],
                    ),

                    Row(
                      children: [
                        Text('Discount (5%) : ', style: TextStyle(fontSize: 17, )),
                        Spacer(),
                        Text('-\$ ${discount()}', style: TextStyle(color: Colors.green, fontSize: 17,),)
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey), bottom: BorderSide(color: Colors.grey))),
                      child: Row(
                        children: [
                          Text('Total Amount', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text('\$ ${amount() - discount()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                      ),

                  ],
                )
            
              ],
            ),
          )

        ]
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
        else
        {
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