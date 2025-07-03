/*
# 저장 매체와 직접적인 소통
 - 데이터를 읽고 쓰는 구체적인 것에 집중

용도에 맞는 저장매체 특화 로직 구현
 - File을 조작
 - 서버와 통신
 - 메모리를 사용
 - (옵션) 데이터 형식 변환
*/
abstract interface class CommentDataSource {
  Future<List<Map<String,dynamic>>> getAll();
}