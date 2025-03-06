// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:finnhub_news/application/blocs/news_impl/news_impl_bloc.dart';
import 'package:finnhub_news/core/constants/enums/processing_status.dart';
import 'package:finnhub_news/domain/i_news_repository/i_news_repository.dart';
import 'package:finnhub_news/domain/models/custom_error/custom_error.dart';
import 'package:finnhub_news/domain/models/news_model/news.dart';

class MockNewsRepository extends Mock implements INewsRepository {}

void main() {
  late NewsImplBloc newsBloc;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    newsBloc = NewsImplBloc(iNewsRepository: mockNewsRepository);
  });

  tearDown(() {
    newsBloc.close();
  });

  group('NewsImplBloc Tests', () {
    test('Initial state should be NewsImplState.initial()', () {
      expect(newsBloc.state, NewsImplState.initial());
    });

    blocTest<NewsImplBloc, NewsImplState>(
      'emits [waiting, success] when RetrieveNews succeeds',
      build: () {
        final mockNews = [News.initial()];

        when(() => mockNewsRepository.retrieveNews())
            .thenAnswer((_) async => mockNews);

        return newsBloc;
      },
      act: (bloc) => bloc.add(RetrieveNews()),
      expect: () => [
        NewsImplState.initial()
            .copyWith(processingStatus: ProcessingStatus.waiting),
        NewsImplState.initial().copyWith(
          processingStatus: ProcessingStatus.success,
          news: [News.initial()],
        ),
      ],
      verify: (_) {
        verify(() => mockNewsRepository.retrieveNews()).called(1);
      },
    );

    blocTest<NewsImplBloc, NewsImplState>(
      'emits [waiting, error] when RetrieveNews fails',
      build: () {
        when(() => mockNewsRepository.retrieveNews()).thenThrow(CustomError(
            errorMsg: 'Failed to fetch news', code: '', plugin: ''));

        return newsBloc;
      },
      act: (bloc) => bloc.add(RetrieveNews()),
      expect: () => [
        NewsImplState.initial()
            .copyWith(processingStatus: ProcessingStatus.waiting),
        NewsImplState.initial().copyWith(
          processingStatus: ProcessingStatus.error,
          error: CustomError(
              errorMsg: 'Failed to fetch news', code: '', plugin: ''),
        ),
      ],
      verify: (_) {
        verify(() => mockNewsRepository.retrieveNews()).called(1);
      },
    );
  });
}
