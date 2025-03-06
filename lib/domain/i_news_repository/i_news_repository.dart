import 'package:finnhub_news/domain/models/news_model/news.dart';


abstract class INewsRepository {
  Future<List<News>> retrieveNews();
}
