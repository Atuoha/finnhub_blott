part of 'news_impl_bloc.dart';

@freezed
class NewsImplState with _$NewsImplState {
  const factory NewsImplState({
    required ProcessingStatus processingStatus,
    required CustomError error,
    required List<News> news,
  }) = _NewsImplState;

  factory NewsImplState.initial() => NewsImplState(
        processingStatus: ProcessingStatus.initial,
        error: CustomError.initial(),
        news: [],
      );
}
