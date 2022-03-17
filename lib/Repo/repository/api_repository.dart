import '../../model/covid_model.dart';
import '../provider/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }

  Future<CovidModel> fetchCovidListByCountry(String country) {
    return _provider.fetchCovidListByCountry(country);
  }
}
