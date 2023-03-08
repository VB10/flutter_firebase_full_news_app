import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.value,
    super.key,
  });
  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
