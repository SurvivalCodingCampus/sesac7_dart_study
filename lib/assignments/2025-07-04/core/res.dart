// ignore_for_file: public_member_api_docs, sort_constructors_first
class Res<T> {
  final int statusCode;
  final Map<String, String> header;
  final T body;

  const Res(this.statusCode, this.header, this.body);

  @override
  String toString() =>
      'Res(statusCode: $statusCode, header: $header, body: $body)';
}
