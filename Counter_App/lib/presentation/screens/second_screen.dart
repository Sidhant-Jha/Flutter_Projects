import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/logic/cubit/counter_cubit.dart';
import 'package:todo_bloc/logic/cubit/counter_state.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(title),
      ),
      body:  
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue > 0) {
                    return Text("Yay Brah ${state.counterValue} is +ve Number");
                  } else if (state.counterValue < 0) {
                    return Text(
                        "Nahh Brah ${state.counterValue} is -ve Number");
                  } else if (state.counterValue == 0) {
                    return Text("Hell No don't give ${state.counterValue}");
                  }
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
                listener: (context, state) {
                  if (ModalRoute.of(context)?.isCurrent == true) {
                    if(state.wasIncrement)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incremented Bitch"), duration: Duration(seconds: 1),));
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Decremented Bitch"), duration: Duration(seconds: 1),));
                    } 
                  }
                },
                ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () => context.read<CounterCubit>().Decrement(),
                    child: const Icon(Icons.remove),
                  ),

                  SizedBox(width: 10,),

                  FilledButton(
                    onPressed: () => context.read<CounterCubit>().Increment(),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(
              height: 30,
              ),
              MaterialButton(
                color: color,
                child: Text("Go to Third Screen"),
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
              )
            ],
          ),
        ),

    );
  }
}