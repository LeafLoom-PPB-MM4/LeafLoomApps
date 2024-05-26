import 'package:flutter/material.dart';

class LTextTheme {
  static const TextStyle _baseLato = TextStyle(
    fontFamily: 'Lato',
  );

  //Reguler
  static final TextStyle latoReguler24 = _baseLato.copyWith(
    fontSize: 24,
  );
  static final TextStyle latoReguler18 = _baseLato.copyWith(
    fontSize: 18,
  );
  static final TextStyle latoReguler16 = _baseLato.copyWith(
    fontSize: 16,
  );
  static final TextStyle latoReguler14 = _baseLato.copyWith(
    fontSize: 14,
  );
  static final TextStyle latoReguler12 = _baseLato.copyWith(
    fontSize: 12,
  );

  //Medium
  static final TextStyle latoMedium24 = _baseLato.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle latoMedium18 = _baseLato.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle latoMedium16 = _baseLato.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle latoMedium14 = _baseLato.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle latoMedium12 = _baseLato.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  //SemiBold
  static final TextStyle latoSemiBold24 = _baseLato.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle latoSemiBold18 = _baseLato.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle latoSemiBold16 = _baseLato.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle latoSemiBold14 = _baseLato.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle latoSemiBold12 = _baseLato.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  //Bold
  static final TextStyle latoBold24 = _baseLato.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle latoBold20 = _baseLato.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle latoBold18 = _baseLato.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle latoBold16 = _baseLato.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle latoBold14 = _baseLato.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle latoBold12 = _baseLato.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  // light theme
  static TextTheme lightTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );

  //dark theme
  static TextTheme darkTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );
}
