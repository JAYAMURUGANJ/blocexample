import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Repo/repository/api_repository.dart';
import '../model/covid_model.dart';

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetCovidList>((event, emit) async {
      try {
        emit(CovidLoading());
        final mList = await _apiRepository.fetchCovidList();
        emit(CovidLoaded(mList));
        if (mList.error != null) {
          emit(CovidError(mList.error));
        }
      } catch (e) {
        emit(CovidError(e.toString()));
      }
    });

    on<GetCovidListByCountry>((event, emit) async {
      try {
        emit(CovidLoading());
        final mList =
            await _apiRepository.fetchCovidListByCountry(event.country);
        emit(CovidLoaded(mList));
        if (mList.error != null) {
          emit(CovidError(mList.error));
        }
      } catch (e) {
        emit(CovidError(e.toString()));
      }
    });
  }
}
