part of 'covid_bloc.dart';

abstract class CovidEvent extends Equatable {
  const CovidEvent();

  @override
  List<Object> get props => [];
}

class GetCovidList extends CovidEvent {}

class GetCovidListByCountry extends CovidEvent {
  final String country;

  const GetCovidListByCountry(this.country);

  @override
  List<Object> get props => [country];
}
