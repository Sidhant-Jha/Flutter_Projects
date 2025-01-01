import 'package:cart_application/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.product, required this.onTapAdd, required this.onTapRemove, required this.quantity});

  final Product product;
  final void Function() onTapAdd;
  final void Function() onTapRemove;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                      image: AssetImage(product.productImage),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.productname, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5,),
                    Text(product.productCurrency + "" + product.productPrice.toString(), style: TextStyle(fontSize: 17),)
                  ],
                ),
                Spacer(),
                IconButton.filled(
                  onPressed: onTapRemove,
                  icon: Icon(Icons.remove),
                ),

                Text(quantity.toString(), style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),


                IconButton.filled(
                  onPressed: onTapAdd,
                  icon: Icon(Icons.add),
                )
              ]
            )
          );
  }
}