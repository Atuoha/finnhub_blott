import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/enums/processing_status.dart';
import '../../../domain/i_news_repository/i_news_repository.dart';
import '../../../domain/models/custom_error/custom_error.dart';
import '../../../domain/models/news_model/news.dart';

part 'news_impl_event.dart';

part 'news_impl_state.dart';

part 'news_impl_bloc.freezed.dart';

@injectable
class NewsImplBloc extends Bloc<NewsImplEvent, NewsImplState> {
  final INewsRepository iNewsRepository;

  NewsImplBloc({required this.iNewsRepository})
      : super(NewsImplState.initial()) {
    on<RetrieveNews>(_retrieveNews);
  }

  Future<void> _retrieveNews(
      RetrieveNews event,
    Emitter<NewsImplState> emit,
  ) async {
    emit(state.copyWith(
      processingStatus: ProcessingStatus.waiting,
    ));

    try {
      final news = await iNewsRepository.retrieveNews();
      emit(state.copyWith(
        processingStatus: ProcessingStatus.success,
        news: news,
      ));
    } on CustomError catch (e) {
      emit(state.copyWith(
        processingStatus: ProcessingStatus.error,
        error: e,
      ));
    }
  }
}
