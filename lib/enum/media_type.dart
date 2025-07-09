enum MediaType {
  Article('article'),
  Image('image'),
  Video('video'),
  Unknown('unknown');

  const MediaType(this.value);

  final String value;
}
