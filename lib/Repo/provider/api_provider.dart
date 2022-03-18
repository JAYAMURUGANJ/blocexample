import 'package:blocexample/model/covid_country_model.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../model/covid_model.dart';

Logger logger = Logger();

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url + '/summary');
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      logger.i("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }

  Future<CovidCountry> fetchCovidListByCountry(String country) async {
    try {
      Response response = await _dio.get(_url + '/country/$country');
      logger.i("Response data", [response.data]);
      return CovidCountry.fromJson(response.data);
    } catch (error, stacktrace) {
      logger.e("Exception occured", [error, stacktrace]);
      return CovidCountry();
    }
  }
}
