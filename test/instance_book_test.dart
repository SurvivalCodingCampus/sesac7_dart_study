import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/instance_book.dart';
import 'package:test/test.dart';

void main() {
  group('InstanceBook 생성자 테스트', () {
    test('생성자 테스트: publishDate를 인자로 받지 않아도 정상적으로 인스턴스를 생성할 수 있는가?', () {
      // given
      final String testName = '셜록';
      final String testComment = '멋진 책';

      InstanceBook book = InstanceBook(
        title: testName,
        comment: testComment,
      );

      // when & then
      expect(book.title, equals(testName));
      expect(book.comment, equals(testComment));
    });

    test(
      '생성자 테스트: 인자로 받은 title, comment, publishDate가 정확하게 들어가는가? (publishDate에 null 값 X)',
      () {
        // given
        final String testName1 = '셜록';
        final String testName2 = '셰익스피어';
        final String testComment1 = '멋진 책';
        final String testComment2 = '훌륭해요';
        final DateTime testDateTime1 = DateTime(1731, 02, 15);
        final DateTime testDateTime2 = DateTime(1876, 04, 27);

        InstanceBook book1 = InstanceBook(
          title: testName1,
          comment: testComment1,
          publishDate: testDateTime1,
        );
        InstanceBook book2 = InstanceBook(
          title: testName2,
          comment: testComment2,
          publishDate: testDateTime2,
        );

        // when & then
        expect(book1.title, equals(testName1));
        expect(book1.comment, equals(testComment1));
        expect(book1.publishDate, equals(testDateTime1));

        expect(book2.title, equals(testName2));
        expect(book2.comment, equals(testComment2));
        expect(book2.publishDate, equals(testDateTime2));
      },
    );

    test(
      '생성자 테스트: publishDate가 null일 경우 publishDate에 DateTime.now() 값이 들어가는가?',
      () {
        // given
        final String testName1 = '셜록';
        final String testName2 = '셰익스피어';
        final String testComment1 = '멋진 책';
        final String testComment2 = '훌륭해요';
        final DateTime timeOfNow = DateTime.now();
        final DateTime? testDateTime = null;

        InstanceBook book1 = InstanceBook(
          title: testName1,
          comment: testComment1,
          publishDate: testDateTime,
        );
        InstanceBook book2 = InstanceBook(
          title: testName2,
          comment: testComment2,
          publishDate: testDateTime,
        );

        // when & then
        expect(book1.title, equals(testName1));
        expect(book1.comment, equals(testComment1));
        expect(book1.publishDate, equals(timeOfNow));

        expect(book2.title, equals(testName2));
        expect(book2.comment, equals(testComment2));
        expect(book2.publishDate, equals(timeOfNow));
      },
    );
  });

  group('재정의된 == 연산자 테스트', () {
    test('제목과 출간일이 같으면 같은 책으로 판단하는가?', () {
      // given
      final String testName1 = '셜록';
      final String testName2 = '셰익스피어';
      final String testComment1 = '멋진 책';
      final String testComment2 = '훌륭해요';
      final DateTime testDateTime1 = DateTime(1731, 02, 15);
      final DateTime testDateTime2 = DateTime(1876, 04, 27);

      // 비교 원본
      InstanceBook book1 = InstanceBook(
        title: testName1,
        comment: testComment1,
        publishDate: testDateTime1,
      );

      // 이름과 출간일이 모두 같은 책
      InstanceBook book2 = InstanceBook(
        title: testName1,
        comment: testComment2,
        publishDate: testDateTime1,
      );

      // 이름은 같은데 출간일이 다른 책
      InstanceBook book3 = InstanceBook(
        title: testName1,
        comment: testComment2,
        publishDate: testDateTime2,
      );

      // 출간일은 같은데 이름이 다른 책
      InstanceBook book4 = InstanceBook(
        title: testName2,
        comment: testComment2,
        publishDate: testDateTime1,
      );

      // 이름과 출간일이 모두 다른 책
      InstanceBook book5 = InstanceBook(
        title: testName2,
        comment: testComment2,
        publishDate: testDateTime2,
      );

      // when & then
      expect(book1 == book2, isTrue); // 이름과 출간일이 모두 같으므로 true
      expect(book1 == book3, isFalse); // 출간일이 달라서 false
      expect(book1 == book4, isFalse); // 이름이 달라서 false
      expect(book1 == book5, isFalse); // 이름과 출간일이 모두 달라서 false
    });
  });

  group(
    'Book 인스턴스를 담고 있는 컬렉션에 대해 sort() (혹은 sorted()) 를 수행하여 출간일을 신상 순서대로 정렬할 수 있는가?',
    () {
      test('출간일의 연/월/일이 모두 다른 경우', () {
        // given
        final String testName1 = '셜록';
        final String testName2 = '셰익스피어';
        final String testName3 = '변신';
        final String testName4 = '코스모스';
        final String testComment1 = '멋진 책';
        final String testComment2 = '훌륭해요';
        final String testComment3 = '대단해요';
        final String testComment4 = '굿';
        final DateTime testDateTime1 = DateTime(1731, 02, 15);
        final DateTime testDateTime2 = DateTime(1876, 04, 27);
        final DateTime testDateTime3 = DateTime(1500, 11, 09);
        final DateTime testDateTime4 = DateTime(1616, 07, 01);
        final List<InstanceBook> testList = [];

        InstanceBook book1 = InstanceBook(
          title: testName1,
          comment: testComment1,
          publishDate: testDateTime1,
        );
        InstanceBook book2 = InstanceBook(
          title: testName2,
          comment: testComment2,
          publishDate: testDateTime2,
        );
        InstanceBook book3 = InstanceBook(
          title: testName3,
          comment: testComment3,
          publishDate: testDateTime3,
        );
        InstanceBook book4 = InstanceBook(
          title: testName4,
          comment: testComment4,
          publishDate: testDateTime4,
        );

        // when
        testList.add(book1);
        testList.add(book2);
        testList.add(book3);
        testList.add(book4);
        final sortingResult = testList.sorted();

        // then
        expect(sortingResult[0].title, equals(book2.title));
        expect(sortingResult[0].comment, equals(book2.comment));
        expect(sortingResult[0].publishDate, equals(book2.publishDate));

        expect(sortingResult[1].title, equals(book1.title));
        expect(sortingResult[1].comment, equals(book1.comment));
        expect(sortingResult[1].publishDate, equals(book1.publishDate));

        expect(sortingResult[2].title, equals(book4.title));
        expect(sortingResult[2].comment, equals(book4.comment));
        expect(sortingResult[2].publishDate, equals(book4.publishDate));

        expect(sortingResult[3].title, equals(book3.title));
        expect(sortingResult[3].comment, equals(book3.comment));
        expect(sortingResult[3].publishDate, equals(book3.publishDate));
      });

      test('연도는 같고 월/일은 다른 책이 존재할 경우', () {
        // given
        final String testName1 = '셜록';
        final String testName2 = '셰익스피어';
        final String testName3 = '변신';
        final String testName4 = '코스모스';
        final String testComment1 = '멋진 책';
        final String testComment2 = '훌륭해요';
        final String testComment3 = '대단해요';
        final String testComment4 = '굿';
        final DateTime testDateTime1 = DateTime(1731, 02, 15);
        final DateTime testDateTime2 = DateTime(1876, 04, 27);
        final DateTime testDateTime3 = DateTime(1731, 11, 09);
        final DateTime testDateTime4 = DateTime(1616, 07, 01);
        final List<InstanceBook> testList = [];

        // book1과 book3의 출간일 연도가 같다.
        InstanceBook book1 = InstanceBook(
          title: testName1,
          comment: testComment1,
          publishDate: testDateTime1,
        );
        InstanceBook book2 = InstanceBook(
          title: testName2,
          comment: testComment2,
          publishDate: testDateTime2,
        );
        InstanceBook book3 = InstanceBook(
          title: testName3,
          comment: testComment3,
          publishDate: testDateTime3,
        );
        InstanceBook book4 = InstanceBook(
          title: testName4,
          comment: testComment4,
          publishDate: testDateTime4,
        );

        // when
        testList.add(book1);
        testList.add(book2);
        testList.add(book3);
        testList.add(book4);
        final sortingResult = testList.sorted();

        // then
        // 연도가 같은 경우에는 월/일을 기준으로 구분
        expect(sortingResult[0].title, equals(book2.title));
        expect(sortingResult[0].comment, equals(book2.comment));
        expect(sortingResult[0].publishDate, equals(book2.publishDate));

        expect(sortingResult[1].title, equals(book3.title));
        expect(sortingResult[1].comment, equals(book3.comment));
        expect(sortingResult[1].publishDate, equals(book3.publishDate));

        expect(sortingResult[2].title, equals(book1.title));
        expect(sortingResult[2].comment, equals(book1.comment));
        expect(sortingResult[2].publishDate, equals(book1.publishDate));

        expect(sortingResult[3].title, equals(book4.title));
        expect(sortingResult[3].comment, equals(book4.comment));
        expect(sortingResult[3].publishDate, equals(book4.publishDate));
      });

      test('연/월은 같고 일이 다른 책이 존재할 경우', () {
        // given
        final String testName1 = '셜록';
        final String testName2 = '셰익스피어';
        final String testName3 = '변신';
        final String testName4 = '코스모스';
        final String testComment1 = '멋진 책';
        final String testComment2 = '훌륭해요';
        final String testComment3 = '대단해요';
        final String testComment4 = '굿';
        final DateTime testDateTime1 = DateTime(1731, 02, 15);
        final DateTime testDateTime2 = DateTime(1731, 02, 27);
        final DateTime testDateTime3 = DateTime(1731, 11, 09);
        final DateTime testDateTime4 = DateTime(1616, 07, 01);
        final List<InstanceBook> testList = [];

        // book1과 book2는 연/월이, book1과 book3는 출간일 연도만 같다.
        InstanceBook book1 = InstanceBook(
          title: testName1,
          comment: testComment1,
          publishDate: testDateTime1,
        );
        InstanceBook book2 = InstanceBook(
          title: testName2,
          comment: testComment2,
          publishDate: testDateTime2,
        );
        InstanceBook book3 = InstanceBook(
          title: testName3,
          comment: testComment3,
          publishDate: testDateTime3,
        );
        InstanceBook book4 = InstanceBook(
          title: testName4,
          comment: testComment4,
          publishDate: testDateTime4,
        );

        // when
        testList.add(book1);
        testList.add(book2);
        testList.add(book3);
        testList.add(book4);
        final sortingResult = testList.sorted();

        // then
        // 연/월이 같은 경우에는 일을 기준으로 구분
        expect(sortingResult[0].title, equals(book3.title));
        expect(sortingResult[0].comment, equals(book3.comment));
        expect(sortingResult[0].publishDate, equals(book3.publishDate));

        expect(sortingResult[1].title, equals(book2.title));
        expect(sortingResult[1].comment, equals(book2.comment));
        expect(sortingResult[1].publishDate, equals(book2.publishDate));

        expect(sortingResult[2].title, equals(book1.title));
        expect(sortingResult[2].comment, equals(book1.comment));
        expect(sortingResult[2].publishDate, equals(book1.publishDate));

        expect(sortingResult[3].title, equals(book4.title));
        expect(sortingResult[3].comment, equals(book4.comment));
        expect(sortingResult[3].publishDate, equals(book4.publishDate));
      });

      test('연/월/일이 모두 같은 경우', () {
        // given
        final String testName1 = '셜록';
        final String testName2 = '셰익스피어';
        final String testName3 = '변신';
        final String testName4 = '코스모스';
        final String testComment1 = '멋진 책';
        final String testComment2 = '훌륭해요';
        final String testComment3 = '대단해요';
        final String testComment4 = '굿';
        final DateTime testDateTime1 = DateTime(1731, 02, 15);
        final DateTime testDateTime2 = DateTime(1731, 02, 27);
        final DateTime testDateTime3 = DateTime(1731, 11, 09);
        final DateTime testDateTime4 = DateTime(1731, 02, 15);
        final List<InstanceBook> testList = [];

        // 비교 원본 book1
        // book2과는 연/월이, book3과는 연도가, book4와는 연/월/일이 모두 같다.
        InstanceBook book1 = InstanceBook(
          title: testName1,
          comment: testComment1,
          publishDate: testDateTime1,
        );
        InstanceBook book2 = InstanceBook(
          title: testName2,
          comment: testComment2,
          publishDate: testDateTime2,
        );
        InstanceBook book3 = InstanceBook(
          title: testName3,
          comment: testComment3,
          publishDate: testDateTime3,
        );
        InstanceBook book4 = InstanceBook(
          title: testName4,
          comment: testComment4,
          publishDate: testDateTime4,
        );

        // when
        testList.add(book1);
        testList.add(book2);
        testList.add(book3);
        testList.add(book4);
        final sortingResult = testList.sorted();

        // then
        expect(sortingResult[0].title, equals(book3.title));
        expect(sortingResult[0].comment, equals(book3.comment));
        expect(sortingResult[0].publishDate, equals(book3.publishDate));

        expect(sortingResult[1].title, equals(book2.title));
        expect(sortingResult[1].comment, equals(book2.comment));
        expect(sortingResult[1].publishDate, equals(book2.publishDate));

        // 값이 같아서 compareTo 값이 0인 경우는 sorting 안함
        expect(sortingResult[2].title, equals(book1.title));
        expect(sortingResult[2].comment, equals(book1.comment));
        expect(sortingResult[2].publishDate, equals(book1.publishDate));

        expect(sortingResult[3].title, equals(book4.title));
        expect(sortingResult[3].comment, equals(book4.comment));
        expect(sortingResult[3].publishDate, equals(book4.publishDate));
      });
    },
  );

  group('copyWith() 메서드를 이용했을 때 깊은 복사를 실현하는가?', () {
    test('객체 복사 테스트', () {
      // given
      final String testName1 = '셜록';
      final String testName2 = '셰익스피어';
      final String testComment1 = '멋진 책';
      final String testComment2 = '훌륭해요';
      final DateTime testDateTime1 = DateTime(1731, 02, 15);
      final DateTime testDateTime2 = DateTime(1876, 04, 27);
      final DateTime timeOfNow = DateTime.now();

      // 복사할 대상 book1
      InstanceBook book1 = InstanceBook(
        title: testName1,
        comment: testComment1,
        publishDate: testDateTime1,
      );

      // 모든 인자 작성
      InstanceBook book2 = book1.copyWith(
        title: testName2,
        comment: testComment2,
        publishDate: testDateTime2,
      );

      // publishDate를 null로 설정
      InstanceBook book3 = book1.copyWith(
        title: testName2,
        comment: testComment2,
      );

      // comment, publishDate를 null로 설정
      InstanceBook book4 = book1.copyWith(
        title: testName2,
        comment: null,
      );

      // title을 null로 설정
      InstanceBook book5 = book1.copyWith(
        title: null,
        comment: testComment2,
      );

      // 모든 인자를 null로 설정
      InstanceBook book6 = book1.copyWith(
        title: null,
        comment: null,
      );

      // when & then
      expect(book1.title, equals(testName1));
      expect(book1.comment, equals(testComment1));
      expect(book1.publishDate, equals(testDateTime1));

      // 모든 인자를 작성했으므로 작성한 인자값으로 설정
      expect(book2.title, equals(testName2));
      expect(book2.comment, equals(testComment2));
      expect(book2.publishDate, equals(testDateTime2));

      // publishDate가 null이므로 현재 시간(timeOfNow)으로 설정됨
      expect(book3.title, equals(testName2));
      expect(book3.comment, equals(testComment2));
      expect(book3.publishDate, equals(timeOfNow));

      // comment, publishDate가 null이므로 각각 testComment1, 현재 시간(timeOfNow)으로 설정됨
      expect(book4.title, equals(testName2));
      expect(book4.comment, equals(testComment1));
      expect(book4.publishDate, equals(timeOfNow));

      // title, publishDate가 null이므로 각각 testName1, 현재 시간(timeOfNow)으로 설정됨
      expect(book5.title, equals(testName1));
      expect(book5.comment, equals(testComment2));
      expect(book5.publishDate, equals(timeOfNow));

      // title, comment, publishDate가 null이므로 각각 testName1, testComment1, 현재 시간(timeOfNow)으로 설정됨
      expect(book6.title, equals(testName1));
      expect(book6.comment, equals(testComment1));
      expect(book6.publishDate, equals(timeOfNow));
    });
  });
}

/*

### 테스트 케이스 ###
- 생성자 테스트: 인자로 받은 title, comment, publishDate가 정확하게 들어갔는가? (publishDate에 null 값 X)
- 생성자 테스트: 인자로 받은 title, comment, publishDate가 정확하게 들어갔는가? (publishDate에 null 값 O)
- 제목과 출간일이 같으면 같은 책으로 판단하는가?
- Book 인스턴스를 담고 있는 컬렉션에 대해 sort() (혹은 sorted())를 수행하여 출간일을 신상 순서대로 정렬할 수 있는가?
  a. 연/월/일이 모두 다른 경우
  b. 연도는 같고 월/일은 다른 책이 존재할 경우
  c. 연/월은 같고 일이 다른 책이 존재할 경우
  d. 연/월/일이 모두 같은 경우
- copyWith() 메서드를 이용했을 때 깊은 복사를 실현하는가?
  => Book 인스턴스를 하나 만들고, 해당 인스턴스를 복사.
  => 이후, 복사한 인스턴스의 publishDate를 건들면 기존 Book 인스턴스의 publishDate 값이 변동하는지를 확인.
  => 변한다면 얕은 복사, 변하지 않는다면 깊은 복사.


*/
