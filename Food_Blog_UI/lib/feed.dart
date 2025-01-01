import 'package:flutter/material.dart';

class Feed extends StatelessWidget
{
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Feed', style: Theme.of(context).textTheme.displaySmall), 
          backgroundColor: const Color.fromARGB(255, 237, 222, 95),
          actions: [Icon(Icons.notifications), SizedBox(width: 20), Icon(Icons.search)],
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

               Padding(
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
                                child: Center(child: Text('S', style: TextStyle(fontSize: 20, color: Colors.white))),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(500)
                                ),
                              ),

                              SizedBox(width: 13),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Shriya', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text('@Shriyayaya', style: TextStyle(fontSize: 14),)
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

                          Text('  Suggest me a good restaurant at charni road'),

                          Row(
                            children: [
                              Icon(Icons.file_present),
                              Text('Post .'),
                              Text('07 Oct'),
                            ],
                          ),

                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                padding: EdgeInsets.all(5),
                                child: Text('20 comments'),
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
                  
                  ),

                  // SizedBox(height: 1),


                   Padding(
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
                                child: Center(child: Text('N', style: TextStyle(fontSize: 20, color: Colors.white))),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(500)
                                ),
                              ),

                              SizedBox(width: 13),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nikhat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text('@nikhat', style: TextStyle(fontSize: 14),)
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

                          Text('  I was wondering for a good fastfood like mcd or smth'),
                          
                          Container(
                            height: 270,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/real.jpg'),
                              fit: BoxFit.fill)
                            ),
                            // child: Image.asset('assets/images/real.jpg'),

                          ),

                          Row(
                            children: [
                              Icon(Icons.file_present),
                              Text('Post .'),
                              Text('08 Oct'),
                            ],
                          ),

                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                padding: EdgeInsets.all(5),
                                child: Text('50 comments'),
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

                          SizedBox(height: 1)

                        ],
                      ),
                    ),
                  
                  ),





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