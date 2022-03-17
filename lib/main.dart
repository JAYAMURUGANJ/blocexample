import 'package:blocexample/bloc/covid_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'screen/covid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (_) => CounterBloc(),
          ),
          BlocProvider<CovidBloc>(
            create: (_) => CovidBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const Home(),
        ));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      listener: (context, state) {
        // ignore: todo
        // TODO: implement listener

        if (state.counter == -1) {
          context.read<CounterBloc>().add(Reset(0, false));
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          const snackBar = SnackBar(
            backgroundColor: Color.fromARGB(255, 35, 143, 92),
            content: Text("Counter reset"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state.counter == 5) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          final snackBar = SnackBar(
            backgroundColor: const Color.fromARGB(255, 181, 141, 247),
            content: Text(state.counter.toString()),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nexware'),
          ),
          backgroundColor: state.counter == 5
              ? Colors.green
              : Theme.of(context).primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.counter.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 80),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: "btn1",
                      onPressed: () {
                        context.read<CounterBloc>().add(Decrement());
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 100),
                    FloatingActionButton(
                      heroTag: "btn2",
                      onPressed: () {
                        context.read<CounterBloc>().add(Increment());
                      },
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: context.read<CovidBloc>(),
                          child: const CovidPage(),
                        ),
                      ),
                    );
                    final snackBar = SnackBar(
                      backgroundColor: Colors.grey,
                      elevation: 10.0,
                      content: Text(state.counter.toString()),
                    );
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    //show snackbar with delay of 2 seconds to avoid conflict with the snackbar from the previous page
                    Future.delayed(const Duration(seconds: 1), () {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  },
                  child: const Text('Second Page'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
