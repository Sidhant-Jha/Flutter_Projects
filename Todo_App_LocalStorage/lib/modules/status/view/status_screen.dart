// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:todo_app_localstorage/modules/status/model/status_model.dart';
import 'package:todo_app_localstorage/modules/status/view_model/status_view_model.dart';
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
    super.initState();
    _statusData = [];

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final statusViewModel = context.read<StatusViewModel>();
      await statusViewModel.countAllTodo();
      await statusViewModel.countAllCompletedTodo();
      await statusViewModel.countAllInCompletedTodo();

      setState(() {
        _statusData = statusViewModel.getTodoStatus();
      });

    });
  }

  
  @override
  Widget build(BuildContext context)
  {

    // final allTodos = context.read<StatusViewModel>().allTodos;
    // final incompletedTodos = context.read<StatusViewModel>().incompletedTodos;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Scaffold(
          body: SfCircularChart(
            annotations: [
              CircularChartAnnotation(widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${_calculatePercent()}%", style: TextStyle(fontSize: 15),),
                  Text("Task Completed", style: TextStyle(fontSize: 15),)
                ],
              ))
            ],
            title: ChartTitle(text: "Tasks Status (in Number)"),
            legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap, textStyle: TextStyle(fontSize: 20), iconHeight: 20, iconWidth: 20, position: LegendPosition.bottom),
            series: <CircularSeries>[
            DoughnutSeries<Status, String>(

              dataSource: _statusData,
              xValueMapper: (Status data, _) => data.status,
              yValueMapper: (Status data, _) => data.number,
              pointColorMapper: (Status data, _) 
              {
                if (data.status == "Completed") {
                  return Colors.green; 
                } else if (data.status == "Not Completed") {
                  return Colors.red; 
                }
                return null;
              },
              dataLabelSettings: DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 20, color: Colors.black)),
              dataLabelMapper: (Status data, _) {
                // Logic to hide the label for the other part if one is 100%
                final completed = _statusData.firstWhere((item) => item.status == "Completed").number;
                final notCompleted = _statusData.firstWhere((item) => item.status == "Not Completed").number;

                if (completed == 0) {
                  return data.status == "Not Completed" ? "${data.number}" : null;
                } else if (notCompleted == 0) {
                  return data.status == "Completed" ? "${data.number}" : null;
                }
                return "${data.number}"; // Default case: show labels for both
              },
            )
          ],),
        ),
      )
    );

  }

  double _calculatePercent()
  {
    final allTodos = context.read<StatusViewModel>().allTodos;
    final incompletedTodos = context.read<StatusViewModel>().incompletedTodos;

    final calculated = ((allTodos! - (incompletedTodos!))/(allTodos))*100;
    String value = calculated.toStringAsFixed(2);

    return double.parse(value);
  }
}
