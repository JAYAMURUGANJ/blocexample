// ignore_for_file: must_be_immutable

part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {}

class Search extends SearchEvent {
  String query;

  Search({required this.query});

  @override
  List<Object> get props => [];
}
