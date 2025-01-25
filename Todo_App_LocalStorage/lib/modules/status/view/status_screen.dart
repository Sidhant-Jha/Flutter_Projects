// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';



class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {

  late List<Status> _statusData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _statusData = getTodoStatus();
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        body: SfCircularChart(series: <CircularSeries>[
          PieSeries<Status, String>(
            dataSource: _statusData,
            xValueMapper: (Status data, _) => data.status,
            yValueMapper: (Status data, _) => data.number,
          )
        ],),
      )
    );
  }

  List<Status> getTodoStatus() {
    final List<Status> statusData = [
      Status('Completed', 54),
      Status('Not Completed', 46)
    ];

    return statusData;
  }

}

class Status {
  Status(this.status, this.number);
  final String status;
  final int number;
}

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Todo App'),
  //     ),

      
      // body: SingleChildScrollView(
      //   child: Padding(padding: EdgeInsets.all(20),
      //     child: Column(
      //       children: [
      //         SizedBox(height: 30,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Column(
      //               children: [
      //                 Text('Work', style: Theme.of(context).textTheme.headlineSmall,),
      //                 SizedBox(height: 25,),
      //                 CircularPercentIndicator(
      //                     radius: 70.0,
      //                     lineWidth: 10.0,
      //                     percent: 0.90,
      //                     center: new Text("90%" , style: Theme.of(context).textTheme.titleLarge),
      //                     progressColor: Colors.green,
      //                   ),
      //               ],
      //             ),

      //             SizedBox(width: 50,),

      //             Column(
      //               children: [
      //                 Text('Personal', style: Theme.of(context).textTheme.headlineSmall,),
      //                 SizedBox(height: 25,),
      //                 CircularPercentIndicator(
      //                     radius: 70.0,
      //                     lineWidth: 10.0,
      //                     percent: 0.90,
      //                     center: new Text("90%" , style: Theme.of(context).textTheme.titleLarge),
      //                     progressColor: Colors.green,
      //                   ),
      //               ],
      //             ),
      //           ],
      //         ),

      //         SizedBox(height: 70,),


      //         Column(
      //           children: [
      //             Text('Overall', style: Theme.of(context).textTheme.headlineSmall,),
      //             SizedBox(height: 20,),
      //             CircularPercentIndicator(
      //               radius: 120.0,
      //               lineWidth: 10.0,
      //               percent: 0.90,
      //               center: new Text("90%", style: Theme.of(context).textTheme.headlineSmall,),
      //               progressColor: Colors.green,
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),),
      // )
//     );
  // }
// }