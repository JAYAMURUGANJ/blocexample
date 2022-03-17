import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/covid_bloc.dart';
import '../model/covid_model.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  final CovidBloc _newsBloc = CovidBloc();
  @override
  void initState() {
    _newsBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text("Counter Value: ${state.counter}");
          },
        ),
      ),
      body: BlocConsumer<CovidBloc, CovidState>(
        bloc: _newsBloc,
        listener: (context, state) {
          if (state is CovidError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CovidInitial) {
            return _buildLoading();
          } else if (state is CovidLoading) {
            return _buildLoading();
          } else if (state is CovidLoaded) {
            return _buildCard(context, state.covidModel);
          } else if (state is CovidError) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
    return ListView.builder(
      itemCount: model.countries!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Country: ${model.countries![index].country}"),
                  Text(
                      "Total Confirmed: ${model.countries![index].totalConfirmed}"),
                  Text("Total Deaths: ${model.countries![index].totalDeaths}"),
                  Text(
                      "Total Recovered: ${model.countries![index].totalRecovered}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
