import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("My Info"),
      ),
      body: SharedPreference()
    )
  ));
}


class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key});

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {

  final TextEditingController nameController  = TextEditingController();
  final TextEditingController ageController  = TextEditingController();
  final TextEditingController locationController  = TextEditingController();

  late String name = "", age = "", location = "";

  List<String?> get = [];
  
  List<String> infoList()
  {
    return [name, age, location];
  }

  void addDetail(String name, String age, String location) {
  this.name = name;
  this.age = age;
  this.location = location;
}

  void showAlertDialog(BuildContext context)
  {
    showDialog(
      context: context,
        builder: (context)
        {
          return AlertDialog(
            title: Text("Add Info"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                  ),
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    hintText: "Enter Age",
                  ),
                ),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    hintText: "Enter Location",
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                nameController.clear();
                ageController.clear();
                locationController.clear();
                Navigator.of(context).pop();
                },
                child: Text("Cancel")
              ),
              TextButton(onPressed: () {
                addDetail(nameController.text, ageController.text, locationController.text);
                save();
                nameController.clear();
                ageController.clear();
                locationController.clear();
                Navigator.of(context).pop();
              },
               child: Text("Add"))
            ],
          );
        });
  }


  @override
  void initState()
  {
    super.initState();
    load();
  }


Future<void> load() async {
  final pref = await SharedPreferences.getInstance();
  setState(() {
    get = pref.getStringList("Info") ?? ["nothing", "nothing", "nothing"];
  });
}

Future<void> save() async {
  final pref = await SharedPreferences.getInstance();
  pref.setStringList("Info", infoList());
  load();  
  
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                  Text(get.elementAt(0) ?? "", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                  Text(get.elementAt(1) ?? "", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                  Text(get.elementAt(2) ?? "", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),

                  SizedBox(height: 80,),

                  FilledButton(onPressed: () => showAlertDialog(context), child: Text("Show Dialog", style: TextStyle(fontSize: 20),))
              ],
            ),
          )
        ],
      ),
    );
  }
}