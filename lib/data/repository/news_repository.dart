import 'package:finnhub_news/domain/models/news_model/news.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../data/api/news_api.dart';
import '../../domain/i_news_repository/i_news_repository.dart';
import '../../domain/models/custom_error/custom_error.dart';

@LazySingleton(as: INewsRepository)
class NewsRepositoryImpl implements INewsRepository {
  final NewsApiServiceClient _newsApiServiceClient;

  NewsRepositoryImpl(this._newsApiServiceClient);

  final logger = Logger();

  @override
  Future<List<News>> retrieveNews() async {
    try {
      final news = await _newsApiServiceClient.retrieveNews();
      return news;
    } catch (e) {
      logger.e("ERROR: $e");
      throw CustomError(
        errorMsg: "Failed to retrieve project: $e",
        plugin: "",
        code: "",
      );
    }
  }
}
