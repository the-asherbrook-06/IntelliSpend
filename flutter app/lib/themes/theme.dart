import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2c6a45),
      surfaceTint: Color(0xff2c6a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb0f1c3),
      onPrimaryContainer: Color(0xff0f512f),
      secondary: Color(0xff586420),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdcea97),
      onSecondaryContainer: Color(0xff414c08),
      tertiary: Color(0xff775a0b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdf9b),
      onTertiaryContainer: Color(0xff5b4300),
      error: Color(0xff8f4b3a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdbd2),
      onErrorContainer: Color(0xff723524),
      surface: Color(0xfffff8f1),
      onSurface: Color(0xff1f1b13),
      onSurfaceVariant: Color(0xff45464f),
      outline: Color(0xff757780),
      outlineVariant: Color(0xffc5c6d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xff95d5a8),
      primaryFixed: Color(0xffb0f1c3),
      onPrimaryFixed: Color(0xff00210f),
      primaryFixedDim: Color(0xff95d5a8),
      onPrimaryFixedVariant: Color(0xff0f512f),
      secondaryFixed: Color(0xffdcea97),
      onSecondaryFixed: Color(0xff181e00),
      secondaryFixedDim: Color(0xffc0ce7e),
      onSecondaryFixedVariant: Color(0xff414c08),
      tertiaryFixed: Color(0xffffdf9b),
      onTertiaryFixed: Color(0xff251a00),
      tertiaryFixedDim: Color(0xffe8c26c),
      onTertiaryFixedVariant: Color(0xff5b4300),
      surfaceDim: Color(0xffe2d9cc),
      surfaceBright: Color(0xfffff8f1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff6eddf),
      surfaceContainerHigh: Color(0xfff0e7d9),
      surfaceContainerHighest: Color(0xffeae1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003f22),
      surfaceTint: Color(0xff2c6a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3c7953),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff313a00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff67732e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff463300),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff87691c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5d2516),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa15947),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f1),
      onSurface: Color(0xff141109),
      onSurfaceVariant: Color(0xff34363e),
      outline: Color(0xff50525b),
      outlineVariant: Color(0xff6b6d75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xff95d5a8),
      primaryFixed: Color(0xff3c7953),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff21603c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff67732e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4f5a17),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff87691c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6c5100),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcec5b8),
      surfaceBright: Color(0xfffff8f1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff0e7d9),
      surfaceContainerHigh: Color(0xffe4dcce),
      surfaceContainerHighest: Color(0xffd9d0c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00341b),
      surfaceTint: Color(0xff2c6a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff125431),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff283000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff434e0b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3a2a00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5e4500),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff501b0d),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff753727),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f1),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2a2c34),
      outlineVariant: Color(0xff474951),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xff95d5a8),
      primaryFixed: Color(0xff125431),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003b1f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff434e0b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2e3600),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5e4500),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff423000),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0b8ab),
      surfaceBright: Color(0xfffff8f1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f0e2),
      surfaceContainer: Color(0xffeae1d4),
      surfaceContainerHigh: Color(0xffdcd3c6),
      surfaceContainerHighest: Color(0xffcec5b8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(149, 213, 168, 1),
      surfaceTint: Color(0xff95d5a8),
      onPrimary: Color(0xff00391e),
      primaryContainer: Color(0xff0f512f),
      onPrimaryContainer: Color(0xffb0f1c3),
      secondary: Color(0xffc0ce7e),
      onSecondary: Color(0xff2c3400),
      secondaryContainer: Color(0xff414c08),
      onSecondaryContainer: Color(0xffdcea97),
      tertiary: Color(0xffe8c26c),
      onTertiary: Color(0xff3f2e00),
      tertiaryContainer: Color(0xff5b4300),
      onTertiaryContainer: Color(0xffffdf9b),
      error: Color(0xffffb4a1),
      onError: Color(0xff561f11),
      errorContainer: Color(0xff723524),
      onErrorContainer: Color(0xffffdbd2),
      surface: Color(0xff16130b),
      onSurface: Color(0xffeae1d4),
      onSurfaceVariant: Color(0xffc5c6d0),
      outline: Color(0xff8f909a),
      outlineVariant: Color(0xff45464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff2c6a45),
      primaryFixed: Color(0xffb0f1c3),
      onPrimaryFixed: Color(0xff00210f),
      primaryFixedDim: Color(0xff95d5a8),
      onPrimaryFixedVariant: Color(0xff0f512f),
      secondaryFixed: Color(0xffdcea97),
      onSecondaryFixed: Color(0xff181e00),
      secondaryFixedDim: Color(0xffc0ce7e),
      onSecondaryFixedVariant: Color(0xff414c08),
      tertiaryFixed: Color(0xffffdf9b),
      onTertiaryFixed: Color(0xff251a00),
      tertiaryFixedDim: Color(0xffe8c26c),
      onTertiaryFixedVariant: Color(0xff5b4300),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff3d392f),
      surfaceContainerLowest: Color(0xff110e07),
      surfaceContainerLow: Color(0xff1f1b13),
      surfaceContainer: Color(0xff231f17),
      surfaceContainerHigh: Color(0xff2e2921),
      surfaceContainerHighest: Color(0xff39342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaaebbd),
      surfaceTint: Color(0xff95d5a8),
      onPrimary: Color(0xff002d16),
      primaryContainer: Color(0xff609e75),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd6e491),
      onSecondary: Color(0xff222900),
      secondaryContainer: Color(0xff8a974e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd880),
      onTertiary: Color(0xff322300),
      tertiaryContainer: Color(0xffae8c3d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2c7),
      onError: Color(0xff481407),
      errorContainer: Color(0xffcb7c67),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbdbe6),
      outline: Color(0xffb0b1bb),
      outlineVariant: Color(0xff8f9099),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff105330),
      primaryFixed: Color(0xffb0f1c3),
      onPrimaryFixed: Color(0xff001508),
      primaryFixedDim: Color(0xff95d5a8),
      onPrimaryFixedVariant: Color(0xff003f22),
      secondaryFixed: Color(0xffdcea97),
      onSecondaryFixed: Color(0xff0f1300),
      secondaryFixedDim: Color(0xffc0ce7e),
      onSecondaryFixedVariant: Color(0xff313a00),
      tertiaryFixed: Color(0xffffdf9b),
      onTertiaryFixed: Color(0xff181000),
      tertiaryFixedDim: Color(0xffe8c26c),
      onTertiaryFixedVariant: Color(0xff463300),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff49443a),
      surfaceContainerLowest: Color(0xff0a0703),
      surfaceContainerLow: Color(0xff211d15),
      surfaceContainer: Color(0xff2c271f),
      surfaceContainerHigh: Color(0xff373229),
      surfaceContainerHighest: Color(0xff423d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbeffd0),
      surfaceTint: Color(0xff95d5a8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff91d1a4),
      onPrimaryContainer: Color(0xff000f05),
      secondary: Color(0xffe9f8a3),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbcca7a),
      onSecondaryContainer: Color(0xff090d00),
      tertiary: Color(0xffffeed0),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe4be69),
      onTertiaryContainer: Color(0xff110a00),
      error: Color(0xffffece7),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaf9a),
      onErrorContainer: Color(0xff1f0200),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffefeffa),
      outlineVariant: Color(0xffc1c2cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff105330),
      primaryFixed: Color(0xffb0f1c3),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff95d5a8),
      onPrimaryFixedVariant: Color(0xff001508),
      secondaryFixed: Color(0xffdcea97),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc0ce7e),
      onSecondaryFixedVariant: Color(0xff0f1300),
      tertiaryFixed: Color(0xffffdf9b),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe8c26c),
      onTertiaryFixedVariant: Color(0xff181000),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff554f45),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f17),
      surfaceContainer: Color(0xff343027),
      surfaceContainerHigh: Color(0xff403b31),
      surfaceContainerHighest: Color(0xff4b463c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
