

import 'package:flutter/material.dart';

class BurgerScreen extends StatelessWidget
{
  const BurgerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 81, 76, 76),
      appBar: AppBar(title: const Text('Burger')),
      body: Padding(
        padding: EdgeInsets.all(16) ,
        child: Column(
          children: [
            // Container(
            //   height: 400,
            //   // width: 200,
            //   decoration: BoxDecoration(
            //     color: Colors.red.shade300,
                
            //   ),
            //   child: Column(
            //     children: [
            //       Image.asset('assets/images/burger.png'),
            //       Text('Burger', style: Theme.of(context).textTheme.displayMedium),
            //       Text('Since 1985', style: Theme.of(context).textTheme.titleSmall)
            //     ],
            //   ),

            // ),

            Stack(
              children: [
                Center(
                  child:
                    Container(
                      height: 400,
                      width: 250,
                      decoration: BoxDecoration(
                         color: Colors.red.shade300,
                         borderRadius: BorderRadius.circular(20)
                       ),
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Burger', style: Theme.of(context).textTheme.displayMedium),
                          Text('Since 1985', style: Theme.of(context).textTheme.titleSmall),
                        ],
                       ),
                    ),
                ),

                Column(
                  children: [
                    SizedBox(height: 50),
                    Image.asset('assets/images/burger.png'),
                  ],
                ),

                // Positioned(
                //   top: 2,
                //   right: 0,
                //   left: 0,
                //   // width: 0,
                //   // height: 0,
                  
                //   child:  Image.asset('assets/images/burger.png'),
                //   )



              ],
            )
          ],
        ),
        ),
    );
  }

}