import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:globalprovider/counter_view_model.dart';
import 'package:globalprovider/login_screen.dart';


class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});


  @override
  Widget build(BuildContext context) {
  // int counter = context.read<CounterViewModel>().counter; //we don't have to read to have to watch 
  //  int counter = context.watch<CounterViewModel>().counter;

  // in below build method is not getting called again and again on pressing increment button coze we haven't use setState or made StatelessWidget 
    log('$runtimeType build method called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter - Provider'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: 'login $hashCode',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: const Icon(Icons.login),
          ),

          const SizedBox(height: 16,),

          FloatingActionButton(
            heroTag: 'counter $hashCode',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CounterScreen(),
                ),
              );
            },
            child: const Icon(Icons.arrow_forward),
          ),


        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MeraProviderWalaTextWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {
                    context.read<CounterViewModel>().increment();
                  },
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 10,),
                FilledButton(
                  onPressed: () {
                    context.read<CounterViewModel>().decrement();
                  },
                  child: const Text('Decrement'),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

class MeraProviderWalaTextWidget extends StatelessWidget {
  const MeraProviderWalaTextWidget({
    super.key,
    // required this.counter,
  });

// no need to pass the below part as we have context
// advantage is on any route it will work 
  // final int counter;

  @override
  Widget build(BuildContext context) {
   int counter = context.watch<CounterViewModel>().counter;
// on pressing incrmeent below widget is called only onetime 
    log('$runtimeType build called');
    return Text(counter.toString(), style: Theme.of(context).textTheme.displayLarge);
  }
}
