part of 'news_impl_bloc.dart';

@freezed
class NewsImplEvent with _$NewsImplEvent {
  const factory NewsImplEvent.retrieveNews() = RetrieveNews;
}
