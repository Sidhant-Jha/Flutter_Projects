import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/counter_cubit.dart';
import 'package:todo_bloc/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("App Bar"),
      ),
      body: 
      // BlocListener<CounterCubit, CounterState>(
      //   listener: (context, state) {
      //     if(state.wasIncrement)
      //     {
      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incremented Bitch"), duration: Duration(seconds: 1),));
      //     }
      //     else
      //     {
      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Decremented Bitch"), duration: Duration(seconds: 1),));
      //     } 
      //   },
        // child: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              // BlocBuilder<CounterCubit, CounterState>(
              //   builder: (context, state) {
              //     if (state.counterValue > 0) {
              //       return Text("Yay Brah ${state.counterValue} is +ve Number");
              //     } else if (state.counterValue < 0) {
              //       return Text(
              //           "Nahh Brah ${state.counterValue} is -ve Number");
              //     } else if (state.counterValue == 0) {
              //       return Text("Hell No don't give ${state.counterValue}");
              //     }
              //     return Text(
              //       state.counterValue.toString(),
              //       style: Theme.of(context).textTheme.headlineMedium,
              //     );
              //   },
              // ),

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
                    if(state.wasIncrement)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incremented Bitch"), duration: Duration(seconds: 1),));
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Decremented Bitch"), duration: Duration(seconds: 1),));
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

            ],
          ),
        ),
      // ),

    );
  }
}
