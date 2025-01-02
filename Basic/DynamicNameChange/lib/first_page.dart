import 'package:flutter/material.dart';
import 'package:namebothpage/model_view.dart';
import 'package:namebothpage/second_page.dart';
import 'package:provider/provider.dart';

class FirstNameChange extends StatelessWidget
{
  const FirstNameChange({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<NameModelView>().textcontroller.text, style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
            SizedBox(height: 50,),
            Container(
              width: 200,
              child: TextField(
                controller: context.watch<NameModelView>().textcontroller,
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                  alignLabelWithHint: true,
                ),
                textAlign: TextAlign.center,
                onChanged: (text)
                {
                  context.read<NameModelView>().update(text);
                },
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SecondNameChange())) , 
              child: Text("Go to next page"))
          ],
        )
      )
    );
  }
  
}