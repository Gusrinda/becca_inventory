import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://backend.qqltech.com:7021')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
}