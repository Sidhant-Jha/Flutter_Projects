import 'package:flutter/material.dart';
import 'package:hotel_ui/model/hotel.dart';

class HotelCard extends StatelessWidget{
  const HotelCard({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(17.0),
              child: Container(
                // height: 400, to make it scalable wrt to display we remove it 
                // width: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                padding: EdgeInsets.all(16), //Giving padding to container gives padding to its child 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ClipRRect(
                      child: Image(
                        height: 200,
                        width: double.maxFinite,
                        fit:BoxFit.cover,
                        image: NetworkImage(hotel.imageUrl)
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      
                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(hotel.name, style: const TextStyle(fontSize: 20)),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text(hotel.address, style: const TextStyle(fontSize: 20)),
                              ],
                            )

                          ],
                        ),
                        // Spacer(), it is used to add max space in between this can be used in place of MainAxisAlignment.spaceBetween 
                      
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange),
                            Text(hotel.rating.toStringAsFixed(1) , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        )
                    ],
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Text('\$ ${hotel.price.round()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                        Text('/day', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.6))),

                        Spacer(),

                        Icon(Icons.bed),
                        SizedBox(width: 5),
                        Text(hotel.totalBedroom.toString(), style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),

                        SizedBox(width: 10),

                        Icon(Icons.bathtub),
                        SizedBox(width: 5),
                        Text(hotel.totalBathroom.toString(), style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),

                      ],
                      )
                  ],
                ),
              ),
            );
  }
  
  
} 