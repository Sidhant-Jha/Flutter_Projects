

import 'package:flutter/material.dart';
import 'package:hotel_ui/model/hotel.dart';
import 'package:hotel_ui/widgets/hotel_card.dart';

final List<Hotel> hotels = [
  Hotel(
  name: "Sherman Oaks",
  imageUrl: 'https://images.unsplash.com/photo-1455587734955-081b22074882?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  address: "1 Wallch St Singapore",
  rating: 4.1,
  price: 400,
  totalBedroom: 04,
  totalBathroom: 0,
  ),

  Hotel(
    name: "Taj Hotel",
    address: "Colaba Mumbai",
    imageUrl: "https://plus.unsplash.com/premium_photo-1661964071015-d97428970584?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    rating : 4.9,
    price : 500,
    totalBathroom: 02,
    totalBedroom: 05,
  ),

  Hotel(
    name: 'Oberoi Hotel',
    address: "Malabar Hills Mumbai",
    imageUrl: "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    rating: 4.7,
    price: 450,
    totalBathroom: 03,
    totalBedroom: 02,
  ),

  Hotel(
    name: 'Radisson Hotel',
    address: "Andheri East",
    imageUrl: "https://images.unsplash.com/photo-1725345653429-8b3926cc229c?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    rating: 5.0,
    price: 600,
    totalBedroom: 06,
    totalBathroom: 03,
    
  )
];


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.blue.shade50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  // [ for(final hotel in hotels) HotelCard(hotel: hotel)
            hotels
              .map(
                (hotel) => HotelCard(hotel: hotel),
                )
                .toList(),

              
            


            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Container(
            //     height: 400,
            //     width: 450,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(15)
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Container(
            //     height: 400,
            //     width: 450,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(15)
            //     ),
            //   ),
            // )
         // ],
        ),
      )
    );
  }
  
}