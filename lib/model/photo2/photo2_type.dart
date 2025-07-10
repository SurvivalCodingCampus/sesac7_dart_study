enum Photo2Type {
  article,
  image,
  video,
  unknown;

  @override
  String toString() {
    return switch (this) {
      Photo2Type.article => 'article',
      Photo2Type.image => 'image',
      Photo2Type.video => 'video',
      Photo2Type.unknown => '',
    };
  }
}
