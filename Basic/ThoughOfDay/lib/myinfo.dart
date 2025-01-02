import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Shared Preference"),),
      body: SharedPreference(),
    ),
  ));
}


class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key});

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {

  final TextEditingController textcontroller = TextEditingController();
  String thoughtoutday = "sth";


  @override
  void initState()
  {
    super.initState();
    load();
  }

  Future<void> load() async
  {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      thoughtoutday = pref.getString("thought") ?? "No Data Available";
    });

  }
  Future<void> save() async
  {
    thoughtoutday = textcontroller.text;
    final pref = await SharedPreferences.getInstance();
    pref.setString("thought", thoughtoutday);
    textcontroller.clear();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Thought of the Day ?", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),
          Text(thoughtoutday, style: TextStyle(fontSize: 30),),
          SizedBox(height: 80,),
          TextField(
            controller: textcontroller,
            decoration: InputDecoration(
              hintText: "Thoughts.."
            ),
          ),
          SizedBox(height: 30,),
          FilledButton(onPressed: save, child: Text("Save Thoughts"))
        ],
      ),
    );
  }
}