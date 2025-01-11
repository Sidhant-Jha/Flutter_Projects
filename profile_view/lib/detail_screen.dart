import 'package:flutter/material.dart';
import 'package:profile_view/application.dart';
import 'package:profile_view/user_model.dart';
import 'package:profile_view/user_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {

  const DetailScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Details'
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                child: Image.network(user.picture),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name : ${user.title}', style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: 5,),
                  Text('About : ${user.subtitle}', style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: 5,),
                  Text('Publisher : ${user.publisher}', style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: 5,),
                  Text('Price : ${user.price}', style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: 5,),
                  // Row(
                  //   children: [
                      // Text('Description : ', style: Theme.of(context).textTheme.titleSmall,),
                      GestureDetector(
                        onTap: ()
                        {
                          context.read<UserProvider>().showDescription();
                        },
                        child: context.watch<UserProvider>().description ?
                        RichText(text: 
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Description : ',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            TextSpan(
                              text: '${user.description}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                         ) :
                        Text( "Description : ....", style: Theme.of(context).textTheme.titleMedium),
                      ),
                      
                  //   ],
                  // ),
                  SizedBox(height: 5,),
                  // Text('Link to Buy : ${user.buyLink}', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue),),
                  RichText(text: 
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Link to Buy : ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextSpan(
                          text: '${user.buyLink}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue),            
                        ),
                      ],
                    ),
                      )
                ],
              )
            //         title;
            // final String subtitle;
            // final String publisher;
            // final String picture;
            // final String price;
            // final String description;
            // final String buyLink;
              
            ],
          ),
        ),
      ),
    );
  }
}