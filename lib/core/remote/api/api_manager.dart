import 'package:dio/dio.dart';
import 'package:news_c17/core/resources/app_constants.dart';

class ApiManager {
  static late Dio dio;
  static init(){
    dio = Dio(
        BaseOptions(
            baseUrl: AppConstants.baseUrl
        )
    );
  }
  //
  static getSources(String category)async{
    var response = await dio.get("/v2/top-headlines/sources",queryParameters: {
      "apiKey":AppConstants.apiKey,
      "category": category
    });
    print(response.data);
    print(response.statusCode);
  }
}