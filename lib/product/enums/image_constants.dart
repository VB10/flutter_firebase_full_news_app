enum IconConstants {
  microphone('ic_microphone');

  final String value;
  // ignore: sort_constructors_first
  const IconConstants(this.value);

  String get toPng => 'assets/icon/$value.png';
}
