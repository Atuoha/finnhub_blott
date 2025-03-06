import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../domain/models/news_model/news.dart';
import '../error_logger/error_logger.dart';

part 'news_api.g.dart';

@RestApi(baseUrl: "https://finnhub.io/api/v1")
abstract class NewsApiServiceClient {
  factory NewsApiServiceClient(Dio dio, {String baseUrl}) =
      _NewsApiServiceClient;

  @GET("/news?category=general")
  Future<List<News>> retrieveNews();
}
