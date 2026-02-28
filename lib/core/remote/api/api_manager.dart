import 'package:dio/dio.dart';
import 'package:news_c17/core/resources/app_constants.dart';
import 'package:news_c17/model/articles_response/articles_response.dart';
import 'package:news_c17/model/sources_response/sources_response.dart';

class ApiManager {
  static late Dio dio;
  static void init(){
    dio = Dio(
        BaseOptions(
            baseUrl: AppConstants.baseUrl
        )
    );
  }
  //
  static Future<SourcesResponse?> getSources(String category)async{
    try{
      var response = await dio.get("/v2/top-headlines/sources",queryParameters: {
        "apiKey":AppConstants.apiKey,
        "category": category
      });
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      return sourcesResponse;
    }catch(e){
      return null;
    }

  }
  
  static Future<ArticlesResponse?> getArticles(String sourceId)async{
    try{
      var response = await dio.get("/v2/everything",queryParameters: {
        "apiKey":AppConstants.apiKey,
        "sources":sourceId
      });
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
      return articlesResponse;
    }catch(e){
      return null;
    }
  }

  static Future<ArticlesResponse?> searchArticles(String query)async{
    try{
      var response = await dio.get("/v2/everything",queryParameters: {
        "apiKey":AppConstants.apiKey,
        "q":query
      });
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
      return articlesResponse;
    }catch(e){
      return null;
    }
  }
}