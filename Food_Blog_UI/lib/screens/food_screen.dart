import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget
{
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.location_pin, size: 45, color: Colors.red, shadows: [Shadow(
          color: Colors.black.withOpacity(0.75),
          offset: Offset(2.0, 2.0)
      )],),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Home', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('101-B, Govandi Rd, near Neelkanth Gardens, D ..', style: TextStyle(fontSize: 15),)
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.yellow.shade100,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.menu, size: 38, color: const Color.fromARGB(255, 237, 222, 95),shadows: [Shadow(
                  color: Colors.black.withOpacity(0.75),
                  offset: Offset(2.0, 2.0), 
                ),]),
          ) ,
          SizedBox(width: 10,)
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(color: Colors.black, offset: Offset(2.0, 2.0))]
                    ),                    child: Center(child: Text('DELIVERY', style: TextStyle(color: Colors.black),),)
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(child: Text('PICKUP', style: TextStyle(color: Colors.grey.shade800),),)
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 58,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)
            
                    ),
                    child: Center(child: Icon(Icons.access_time, size: 32, color: Colors.grey.shade700,),),
                  )
                ],
              ),
            ),
                
            SizedBox(height: 15),
                
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                borderRadius: BorderRadius.circular(8)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for 'Baskin Robbins'",
                  prefixIcon: Icon(Icons.search, size: 40, color: const Color.fromARGB(255, 237, 222, 95), shadows: [Shadow(color: Colors.grey.shade900, offset: Offset(2.0, 2.0))]),
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey.shade600, ),
                  contentPadding: EdgeInsets.symmetric(vertical: 15)
                ),
              )
            ),
                
            SizedBox(height: 15),
                
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BelowTextField('Sort'),
                  BelowTextField('Filters'),
                  BelowTextField('Previously Ordered'),
                  BelowTextField('Gourmet'),
                  BelowTextField('Thrive Promise'),
                  BelowTextField('Offers'),
                  BelowTextField('Pre Order Available'),
                  BelowTextField('New on Thive'),
                  BelowTextField('Open Now'),
                  BelowTextField('Pure Veg'),
                
                ],
              ),
            ),
                
            
            Expanded
            (
              child: SingleChildScrollView(
                      
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ 
                                SizedBox(height: 15),
                                Container(
                                  child: 
                                    Row(
                                      children: [
                                        BelowTabularView('Offers', 'assets/images/offers.jpeg'),
                                        Spacer(),
                                        BelowTabularView('New', 'assets/images/new.jpeg'),
                                        Spacer(),
                                        BelowTabularView('Gourmet', 'assets/images/binge.jpeg'),
                                        Spacer(),
                                        BelowTabularView('Binge', 'assets/images/gourmet.jpeg'),
                                      ],
                                    ),
                                ),
                                
                                SizedBox(height: 15),

                                Container(
                                  height: 250,
                                  child: PageView(
                                    children: [
                                        Container(
                                          child:  Image.asset('assets/images/sweet.jpeg', fit: BoxFit.fill,),
                                        ),
                                        Container(
                                          child: Image.asset('assets/images/faasos.jpeg', fit: BoxFit.fill,),
                                        ),
                                        Container(
                                          child: Image.asset('assets/images/coke.jpeg', fit: BoxFit.fill,),
                                        ),
                                        Container(
                                          child: Image.asset('assets/images/freshmenu.jpeg', fit: BoxFit.fill,),
                                        ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 15,),
                            
                                Text('All restaurants', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  height: 200,
                                  color: Colors.grey,
                                  child: Center(child: Text('Restaurant 1')),
                                ),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  height: 200,
                                  color: Colors.grey,
                                  child: Center(child: Text('Restaurant 2')),
                                )
                                    
                            ]
                                                     ),
                      ),
            ),
                
          ],
        ),
      ),
    );
  }
  
}
Container BelowTextField(String text)
{
  return  Container(
          height: 35,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)
            ),
              child: Center(
                child: Text(text, style: TextStyle(color: Colors.grey.shade700, fontSize: 16),),
                ),
          );           
}

Container BelowTabularView(String text, String image)
{
  return Container(
            // padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)
            ),
            height: 105,
            width: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.0, top: 5.0),
                  child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          );
  }