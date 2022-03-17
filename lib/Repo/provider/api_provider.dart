import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../model/covid_model.dart';

Logger logger = Logger();

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      logger.i("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }

  Future<CovidModel> fetchCovidListByCountry(String country) async {
    try {
      Response response = await _dio.get(_url + '/country/$country');
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      logger.i("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }
}
