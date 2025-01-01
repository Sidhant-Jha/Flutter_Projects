import 'package:flutter/material.dart';
// import 'package:food_blog/feed.dart';
import 'package:food_blog/model/feed.dart';
import 'package:food_blog/widgets/feed_card.dart';


final List<FeedModel> feeds = [
  FeedModel(
    profileText: 'S',
    customerName: 'Shriya',
    customerHandle: '@Shriyaya',
    customerQuery: 'Suggest me a good restaurant at charni road',
    feedDate: '07 Oct',
    feedComments: 20,
  ),
  FeedModel(
    profileText: 'N',
    customerName: 'Nikhil',
    customerHandle: '@Nikhiliyer',
    customerQuery: 'Best Luxury Dining option in Chembur. Good range of food and drinks in a good and comfortable ambience',
    imageUrl: ['assets/images/cutlet.png', 'assets/images/food2.png', 'assets/images/food3.png'],
    feedDate: '09 Oct',
    feedComments: 50,
  ),
  FeedModel(
    profileText: 'P',
    customerName: 'Prakeet',
    customerHandle: '@foodieprateek',
    customerQuery: 'Amazing experiance at Mc Donald vashi',
    imageUrl: ['assets/images/real.jpg'],
    feedDate: '10 Oct',
    feedComments: 10,
  ),
  FeedModel(
    profileText: 'K',
    customerName: 'Kartik',
    customerHandle: '@kartik',
    customerQuery: 'Suggest some good restaurant in Ghansoli',
    feedDate: '15 Oct',
    feedComments: 30,
  )
];


class FeedScreen extends StatelessWidget
{
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // floatingActionButton: Column(
        //   children: [
        //     FloatingActionButton(
        //       onPressed: () => {},
        //       child: Icon(Icons.keyboard_arrow_right)
        //       ),

        //     FloatingActionButton(
        //       onPressed: () => {},
        //       child: Icon(Icons.keyboard_arrow_left)
        //       )
            
        //   ],
        // ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Feed', style: Theme.of(context).textTheme.displaySmall,), 
          backgroundColor: const Color.fromARGB(255, 237, 222, 95),
          actions: [Icon(Icons.notifications, size: 30,), SizedBox(width: 20), Icon(Icons.search, size: 30)],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Categories('Sort'),
                  Categories('Location'),
                  Categories('Cuisine'),
                  Categories('Type'),
                ],
              ),
            ),

            Expanded(
              child: ListView(
              children:  feeds.map((feed) => FeedCard(feed: feed)).toList()
            ))

          ],
        ),

    );
  }
}

Widget Categories(String text)
{
  return Expanded(child: 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Center(child: Text(text)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                       ),
                    ),
                  )
                );
}


              //  feeds.map((feed) => FeedCard(feed: feed)),

                  // SizedBox(height: 1),


                  //  Padding(
                  //   padding: EdgeInsets.all(8),
                  //   child: Container(
                  //     color: Colors.white,
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         SizedBox(height: 5),
                  //         Row(
                  //           children: [
                  //             Container(
                  //               height: 50,
                  //               width: 50,
                  //               child: Center(child: Text('N', style: TextStyle(fontSize: 20, color: Colors.white))),
                  //               decoration: BoxDecoration(
                  //                 color: Colors.purple,
                  //                 borderRadius: BorderRadius.circular(500)
                  //               ),
                  //             ),

                  //             SizedBox(width: 13),

                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text('Nikhat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  //                 Text('@nikhat', style: TextStyle(fontSize: 14),)
                  //               ],
                  //             ),
                  //             Spacer(),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Container(
                  //                 padding: EdgeInsetsDirectional.only(start: 25, top:5),
                  //                 height: 30,
                  //                 width: 90,
                  //                 child: Text('Follow', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.white,
                  //                   border: Border.all(color: Colors.purple),
                  //                   borderRadius: BorderRadius.circular(5),
                  //                    ),
                  //                 ),
                  //             ),
                  //           ],
                  //         ),

                  //         SizedBox(height: 10),

                  //         Text('  I was wondering for a good fastfood like mcd or smth'),
                          
                  //         Container(
                  //           height: 270,
                  //           decoration: BoxDecoration(
                  //             image: DecorationImage(image: AssetImage('assets/images/real.jpg'),
                  //             fit: BoxFit.fill)
                  //           ),
                  //           // child: Image.asset('assets/images/real.jpg'),
                  //         ),

                  //         Row(
                  //           children: [
                  //             Icon(Icons.file_present),
                  //             Text('Post .'),
                  //             Text('08 Oct'),
                  //           ],
                  //         ),

                  //         Column(
                  //           // crossAxisAlignment: CrossAxisAlignment.end,
                  //           children: [
                  //             Align(
                  //               alignment: Alignment.centerRight,
                  //               child: Container(
                  //               padding: EdgeInsets.all(5),
                  //               child: Text('50 comments'),
                  //             )
                  //             ),
                              
                  //           ],
                  //         ),

                  //         Divider(  // The line (divider)
                  //           color: Colors.grey,   // Color of the line
                  //           thickness: 1.0,        // Thickness of the line
                  //           indent: 20.0,          // Left padding of the line
                  //           endIndent: 20.0,       // Right padding of the line
                  //         ),

                  //         Row(
                  //           children: [
                  //             Expanded(child: Icon(Icons.favorite)),

                  //             Expanded(child: Icon(Icons.comment)),

                  //             Expanded(child: Icon(Icons.share))
                  //           ]
                  //         ),

                  //         SizedBox(height: 1)

                  //       ],
                  //     ),
                  //   ),
                  
                  // ),




