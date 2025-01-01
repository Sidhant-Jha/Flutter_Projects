// import 'package:food_blog/about.dart';
// import 'package:food_blog/diet.dart';
// import 'package:food_blog/main.dart';
// import 'main.dart';
// import 'receipe.dart';
// import 'diet.dart';
// import 'about.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/navigator.dart';
import 'drawer.dart';
import 'package:get/get.dart';
// void main()
// {
//   return runApp(const GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     home:NavigationMenu()
//   ));
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  // Changed from MaterialApp to GetMaterialApp
      debugShowCheckedModeBanner: false,
      home: NavigationMenu(), // Your home screen
    );
  }
}

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawing(),
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: const Color.fromARGB(255, 237, 222, 95),
          shape: const RoundedRectangleBorder(),
          elevation: 5,
          shadowColor: Colors.black,
          // leading: Builder(
          //   builder: (context)
          //   {
          //     return IconButton(
          //       onPressed: () {
          //         Scaffold.of(context).openDrawer();
          //       }, 
          //       icon: Icon(Icons.menu));
          //   }
          // )
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 169, 255),// const Color.fromARGB(255, 218, 179, 225), // const Color.fromARGB(255, 255, 227, 151),
                borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("What's on", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  const Text("your Mind ?", style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 246, 246, 246),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search for food you want",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15)
                      ),
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 15),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Today's Offer"),
                  SizedBox(height: 10),
                  Container(
                    height: 260,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        promocard('assets/images/burger.jpg'),
                        promocard('assets/images/pasta.jpg'),
                        promocard('assets/images/sandwich.jpg'),
                        promocard('assets/images/pizza.jpg'),

                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      image : DecorationImage(image: AssetImage('assets/images/blog.jpg'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text('Food Blog',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),

                        ),

                      ),
                    )

                  )
                ],
              ),

            )
        
          ],
        )
      ),
    );
  }

  Widget promocard(image)
  {
    return Container(
      // height: 250,
      width: 180,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.orange,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      // child: Image.asset(image),

    );
  }
  
}

// class DrawerCreate extends StatelessWidget
// {
//   const DrawerCreate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawing(
      
//     );
//   }
  
// }
