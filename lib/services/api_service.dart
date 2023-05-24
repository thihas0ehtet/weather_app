import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weatherapp/model/models.dart';
import 'package:weatherapp/utils/constants.dart';

part 'api_service.g.dart';

@RestApi(
    baseUrl:
        "${ConstantUtils.apiUrl}/forecast.json?key=${ConstantUtils.apiKey}&days=${ConstantUtils.forecastDays}")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET("&q={city}")
  Future<WeatherModel> getWeather(@Path() String city);

  @GET("location/search/")
  Future<List<CityModel>> getCities(@Query("query") String keyword);
}
