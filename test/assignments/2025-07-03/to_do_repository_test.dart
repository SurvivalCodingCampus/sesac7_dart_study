import 'package:modu_3_dart_study/assignments/2025-07-03/model/to_do.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/to_do_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/to_do_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_to_do_data_source_impl.dart';

void main() {
  test('Testing PhotoRepositoryImpl with MockPhotoDataSource', () async {
    //given
    final ToDoRepository testRepo = ToDoRepositoryImpl(
      MockToDoDataSourceImpl(),
    );

    final List<ToDo> completedResults = await testRepo.getCompletedTodos();
    final List<ToDo> results = await testRepo.getTodos();

    //when

    //then
    expect(completedResults.length, 1);
    print(completedResults);

    expect(results.length, 5);
    print(results);
  });
}
