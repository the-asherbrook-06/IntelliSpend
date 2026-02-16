import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff715c0d),
      surfaceTint: Color(0xff715c0d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfffee186),
      onPrimaryContainer: Color(0xff564500),
      secondary: Color(0xff586420),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdcea97),
      onSecondaryContainer: Color(0xff414c08),
      tertiary: Color(0xff6a548d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffecdcff),
      onTertiaryContainer: Color(0xff513c73),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff1f1b13),
      onSurfaceVariant: Color(0xff4b4639),
      outline: Color(0xff7d7767),
      outlineVariant: Color(0xffcec6b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffe0c56d),
      primaryFixed: Color(0xfffee186),
      onPrimaryFixed: Color(0xff231b00),
      primaryFixedDim: Color(0xffe0c56d),
      onPrimaryFixedVariant: Color(0xff564500),
      secondaryFixed: Color(0xffdcea97),
      onSecondaryFixed: Color(0xff181e00),
      secondaryFixedDim: Color(0xffc0ce7e),
      onSecondaryFixedVariant: Color(0xff414c08),
      tertiaryFixed: Color(0xffecdcff),
      onTertiaryFixed: Color(0xff240e45),
      tertiaryFixedDim: Color(0xffd5bbfc),
      onTertiaryFixedVariant: Color(0xff513c73),
      surfaceDim: Color(0xffe1d9cc),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf3e5),
      surfaceContainer: Color(0xfff5eddf),
      surfaceContainerHigh: Color(0xffefe7d9),
      surfaceContainerHighest: Color(0xffeae1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff423500),
      surfaceTint: Color(0xff715c0d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff816b1d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff313a00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff67732e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff402b61),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff79629c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff141109),
      onSurfaceVariant: Color(0xff3a3629),
      outline: Color(0xff575244),
      outlineVariant: Color(0xff736d5e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffe0c56d),
      primaryFixed: Color(0xff816b1d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff665301),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff67732e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4e5a17),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff79629c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff604a82),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcdc6b9),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf3e5),
      surfaceContainer: Color(0xffefe7d9),
      surfaceContainerHigh: Color(0xffe4dcce),
      surfaceContainerHighest: Color(0xffd9d1c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff372b00),
      surfaceTint: Color(0xff715c0d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff594700),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff273000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff434e0b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff362156),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff543e76),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff302c20),
      outlineVariant: Color(0xff4e493b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffe0c56d),
      primaryFixed: Color(0xff594700),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3e3100),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff434e0b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2d3700),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff543e76),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3c275d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbfb8ab),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f0e2),
      surfaceContainer: Color(0xffeae1d4),
      surfaceContainerHigh: Color(0xffdbd3c6),
      surfaceContainerHighest: Color(0xffcdc6b9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe0c56d),
      surfaceTint: Color(0xffe0c56d),
      onPrimary: Color(0xff3c2f00),
      primaryContainer: Color(0xff564500),
      onPrimaryContainer: Color(0xfffee186),
      secondary: Color(0xffc0ce7e),
      onSecondary: Color(0xff2b3400),
      secondaryContainer: Color(0xff414c08),
      onSecondaryContainer: Color(0xffdcea97),
      tertiary: Color(0xffd5bbfc),
      onTertiary: Color(0xff3a255b),
      tertiaryContainer: Color(0xff513c73),
      onTertiaryContainer: Color(0xffecdcff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color.fromARGB(255, 17, 15, 9),
      onSurface: Color(0xffeae1d4),
      onSurfaceVariant: Color(0xffcec6b4),
      outline: Color(0xff979080),
      outlineVariant: Color(0xff4b4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff715c0d),
      primaryFixed: Color(0xfffee186),
      onPrimaryFixed: Color(0xff231b00),
      primaryFixedDim: Color(0xffe0c56d),
      onPrimaryFixedVariant: Color(0xff564500),
      secondaryFixed: Color(0xffdcea97),
      onSecondaryFixed: Color(0xff181e00),
      secondaryFixedDim: Color(0xffc0ce7e),
      onSecondaryFixedVariant: Color(0xff414c08),
      tertiaryFixed: Color(0xffecdcff),
      onTertiaryFixed: Color(0xff240e45),
      tertiaryFixedDim: Color(0xffd5bbfc),
      onTertiaryFixedVariant: Color(0xff513c73),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff3d392f),
      surfaceContainerLowest: Color(0xff110e07),
      surfaceContainerLow: Color(0xff1f1b13),
      surfaceContainer: Color(0xff231f17),
      surfaceContainerHigh: Color(0xff2d2a21),
      surfaceContainerHighest: Color(0xff38342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff7da80),
      surfaceTint: Color(0xffe0c56d),
      onPrimary: Color(0xff2f2500),
      primaryContainer: Color(0xffa78f3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd5e492),
      onSecondary: Color(0xff222900),
      secondaryContainer: Color(0xff8a974e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe7d5ff),
      onTertiary: Color(0xff2f1a4f),
      tertiaryContainer: Color(0xff9e86c3),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe4dcc9),
      outline: Color(0xffb9b1a0),
      outlineVariant: Color(0xff979080),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff574600),
      primaryFixed: Color(0xfffee186),
      onPrimaryFixed: Color(0xff171000),
      primaryFixedDim: Color(0xffe0c56d),
      onPrimaryFixedVariant: Color(0xff423500),
      secondaryFixed: Color(0xffdcea97),
      onSecondaryFixed: Color(0xff0f1300),
      secondaryFixedDim: Color(0xffc0ce7e),
      onSecondaryFixedVariant: Color(0xff313a00),
      tertiaryFixed: Color(0xffecdcff),
      onTertiaryFixed: Color(0xff1a023a),
      tertiaryFixedDim: Color(0xffd5bbfc),
      onTertiaryFixedVariant: Color(0xff402b61),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff49443a),
      surfaceContainerLowest: Color(0xff090703),
      surfaceContainerLow: Color(0xff211d15),
      surfaceContainer: Color(0xff2b271f),
      surfaceContainerHigh: Color(0xff363229),
      surfaceContainerHighest: Color(0xff423d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffefc5),
      surfaceTint: Color(0xffe0c56d),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffdcc16a),
      onPrimaryContainer: Color(0xff100b00),
      secondary: Color(0xffe9f8a4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbcca7b),
      onSecondaryContainer: Color(0xff090d00),
      tertiary: Color(0xfff7ecff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd1b7f8),
      onTertiaryContainer: Color(0xff12002f),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff8efdc),
      outlineVariant: Color(0xffcac2b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff574600),
      primaryFixed: Color(0xfffee186),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe0c56d),
      onPrimaryFixedVariant: Color(0xff171000),
      secondaryFixed: Color(0xffdcea97),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc0ce7e),
      onSecondaryFixedVariant: Color(0xff0f1300),
      tertiaryFixed: Color(0xffecdcff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd5bbfc),
      onTertiaryFixedVariant: Color(0xff1a023a),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff545045),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f17),
      surfaceContainer: Color(0xff343027),
      surfaceContainerHigh: Color(0xff3f3b31),
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
