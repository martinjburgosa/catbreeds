enum PngImage {
  dogHandFill('assets/img/dog_hand_fill.png'),
  dogHandEmpty('assets/img/dog_hand_empty.png');

  const PngImage(this.value);

  final String value;
}

enum GifImage {
  animatedCat('assets/img/animated_cat.gif');

  const GifImage(this.value);

  final String value;
}
