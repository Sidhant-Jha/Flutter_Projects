import 'dart:developer' as dev; 
// import 'dart:math' hide log;
import 'dart:math';
import 'package:flutter/material.dart';

final List<int> numbers = List.generate(100, (index) => index + 1);

class ListViews extends StatelessWidget
{
  const ListViews({super.key});


  @override
  Widget build(BuildContext context) {
final scrollController = ScrollController();
double initialValue = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.white,
      ),
      body: 
      // ListView(
      //   children: 
      //     numbers.map((number) {

      //        dev.log('container $number built');
      //         return builderListItem(number);
      //       }
      //     ).toList(),
        
      // )

      //Recycler View in flutter using ListView.builder constructor
      Scrollbar(
        controller: scrollController,
        interactive: true,
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 10,
        child: ListView.builder(
        controller: scrollController,
        itemCount: numbers.length,
        itemBuilder: (context, index)
        {
          final number = numbers[index];
          print('Container $number Built');
          return builderListItem(number);
        }
        ),
      ),
      

      //calls ListView.builder constructor used for giving border after containers 
      // ListView.separated(
      //   itemCount: numbers.length,
      //   itemBuilder: (context, index) //takes index size to builder container according to displaying containers 
      //   {
      //     final number = numbers[index];
      //     print('Container $number Built');
      //     return builderListItem(number);
      //   },
      //   separatorBuilder: (context, index)
      //   {
      //     return Divider(
      //       thickness: 1,
      //       height: 1,
      //       color: Colors.black
      //     );
      //   },
      // )

// default grid is square 
      // GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 4,
      //     //deafult is 1/1
      //     childAspectRatio: 2/3,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10
      //     ),
      //   children : numbers.map((number)
      //   {
      //     dev.log('build $number');
      //     return builderListItem(number);
      //   }).toList()
      //   ),

      // GridView.builder(
      //   controller: scrollController,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2),
      //   itemCount: numbers.length,
      //   itemBuilder: (context, index) {
      //     final number = numbers[index];
      //     dev.log('build $number');
      //     return builderListItem(number);
      //   },
      //   ),
      
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => {
              initialValue = initialValue + 200,
              scrollController.animateTo(initialValue, duration: Duration(milliseconds: 400), curve: Curves.fastEaseInToSlowEaseOut),
              dev.log('upwards pressed'),
            },
            child: Icon(Icons.arrow_upward),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => {
              initialValue = initialValue - 200,
              scrollController.animateTo(initialValue, duration: Duration(microseconds: 400), curve: Curves.fastEaseInToSlowEaseOut),
              dev.log('downward pressed')
            },
            child: Icon(Icons.arrow_downward))
        ],
      )

    
      
    );
  }

}

Container builderListItem(number)
{
  return Container(
  // when using grid generally not required as it gives padding 
          // padding: EdgeInsets.all(15),
          height: 200,
          decoration: BoxDecoration(
            // color: Colors.blue.shade300
            color: getRandomColor(),
            border: Border(bottom: BorderSide(width: 1, color: Colors.black)),
          ),
          child: 
            Center(
              child: Text(number.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
              )
                
        );
}

Color getRandomColor() {
  return Color(Random().nextInt(0xFFFFFFFF)); //just like passing hex code to Color()
}