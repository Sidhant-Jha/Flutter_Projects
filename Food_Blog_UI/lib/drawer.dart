import 'package:flutter/material.dart';
// import 'package:food_blog/main.dart';
import 'package:food_blog/navigator.dart';
import 'diet.dart';
import 'about.dart';
import 'receipe.dart';
class Drawing extends StatelessWidget
{
  const Drawing({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
          height: 67,
          child: DrawerHeader(
            child: const Text('Options'),
            
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 237, 222, 95),
            ),
            ),
          ),
          ListTile(
            title: const Text("Home", style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => NavigationMenu()
                ));
            },
          ),
          ListTile(
            title: const Text("Diet Types", style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.dinner_dining),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DietScreen()
              ));
            }
          ),
          ListTile(
            title: const Text("Receipe", style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.restaurant),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ReceipeScreen()
                ));
            }
          ),

          ListTile(
            title: const Text("About Us", style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.info),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => AboutScreen()
              ));
            }
          )
        ],
      ),
    );
  }
  
}