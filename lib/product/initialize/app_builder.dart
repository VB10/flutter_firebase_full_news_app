import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class AppBuilder {
  AppBuilder(this.child);

  final Widget? child;

  Widget build() {
    return ResponsiveWrapper.builder(
      child,
      maxWidth: 1200,
      minWidth: 480,
      defaultScale: true,
      breakpoints: [
        const ResponsiveBreakpoint.resize(480, name: MOBILE),
        const ResponsiveBreakpoint.autoScale(800, name: TABLET),
        const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
      ],
      background: Container(color: const Color(0xFFF5F5F5)),
    );
  }
}
