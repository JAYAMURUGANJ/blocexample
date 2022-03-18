import 'package:bloc/bloc.dart';
import 'package:blocexample/model/covid_country_model.dart';
import 'package:equatable/equatable.dart';
import '../Repo/repository/api_repository.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchUninitialized()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<Search>((event, emit) async {
      try {
        List<CovidCountry> countryList = await _apiRepository
            .fetchCovidListByCountry(event.query) as List<CovidCountry>;
        emit(SearchLoaded(countryList: countryList));
      } catch (e) {
        emit(SearchError());
      }
    });
  }
}
