import 'package:flutter/material.dart';
import 'package:food_blog/model/feed.dart';

class FeedCard extends StatelessWidget
{
  const FeedCard({super.key, required this.feed});

  final FeedModel feed;

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(child: Text(feed.profileText, style: TextStyle(fontSize: 20, color: Colors.white))),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(500)
                                ),
                              ),

                              SizedBox(width: 13),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(feed.customerName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text(feed.customerHandle, style: TextStyle(fontSize: 14),)
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsetsDirectional.only(start: 25, top:5),
                                  height: 30,
                                  width: 90,
                                  child: Text('Follow', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.purple),
                                    borderRadius: BorderRadius.circular(5),
                                     ),
                                  ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          Text(feed.customerQuery, style: TextStyle(fontSize: 18),),

                          
                          // Container(
                          //   height: feed.imageUrl != '' ? 400 : 0,
                          //   width: 400,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(image: AssetImage(feed.imageUrl),
                          //     fit: BoxFit.fill)
                          //   ),
                          //   // child: Image.asset('assets/images/real.jpg'),
                          // ),
                            SizedBox(height: 10),
                          
                            Container(
                              height: feed.imageUrl.isNotEmpty ? 400 : 0, // Show container only if there are images
                              width: 400,
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                children: feed.imageUrl.map((e) => Container(child: Image.asset(e, height: 400, width: 400, fit: BoxFit.fill))).toList(),
                              ),
                            ),

                                                      
                            SizedBox(height: 5),

                          Row(
                            children: [
                              Icon(Icons.file_present, size: 15),
                              Text('Post .'),
                              Text(feed.feedDate),
                            ],
                          ),

                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                padding: EdgeInsets.all(5),
                                child: Text('${feed.feedComments} comments'),
                              )
                              ),
                              
                            ],
                          ),

                          Divider(  // The line (divider)
                            color: Colors.grey,   // Color of the line
                            thickness: 1.0,        // Thickness of the line
                            indent: 20.0,          // Left padding of the line
                            endIndent: 20.0,       // Right padding of the line
                          ),

                          Row(
                            children: [
                              Expanded(child: Icon(Icons.favorite)),

                              Expanded(child: Icon(Icons.comment)),

                              Expanded(child: Icon(Icons.share))
                            ]
                          ),

                          SizedBox(height: 15,)

                        ],
                      ),
                    ),
                  
                  );
  }
  
}