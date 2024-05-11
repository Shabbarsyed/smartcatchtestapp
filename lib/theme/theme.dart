import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278204546),
      surfaceTint: Color(4280703925),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280703925),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282080419),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286356711),
      onSecondaryContainer: Color(4278193709),
      tertiary: Color(4282082422),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291423487),
      onTertiaryContainer: Color(4280635233),
      error: Color(4290319179),
      onError: Color(4294967295),
      errorContainer: Color(4294929034),
      onErrorContainer: Color(4280745993),
      background: Color(4294638079),
      onBackground: Color(4279835425),
      surface: Color(4294638079),
      onSurface: Color(4279835425),
      surfaceVariant: Color(4292862704),
      onSurfaceVariant: Color(4282599250),
      outline: Color(4285757315),
      outlineVariant: Color(4291020500),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217078),
      inverseOnSurface: Color(4293980408),
      inversePrimary: Color(4289709823),
      primaryFixed: Color(4292469503),
      onPrimaryFixed: Color(4278196803),
      primaryFixedDim: Color(4289709823),
      onPrimaryFixedVariant: Color(4278207384),
      secondaryFixed: Color(4292469503),
      onSecondaryFixed: Color(4278196548),
      secondaryFixedDim: Color(4289775359),
      onSecondaryFixedVariant: Color(4280239241),
      tertiaryFixed: Color(4290767359),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4288924898),
      onTertiaryFixedVariant: Color(4280372317),
      surfaceDim: Color(4292467169),
      surfaceBright: Color(4294638079),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177787),
      surfaceContainer: Color(4293783029),
      surfaceContainerHigh: Color(4293388272),
      surfaceContainerHighest: Color(4293059306),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278204546),
      surfaceTint: Color(4280703925),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280703925),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279910533),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283593659),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280043609),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283529869),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287168563),
      onError: Color(4294967295),
      errorContainer: Color(4292358240),
      onErrorContainer: Color(4294967295),
      background: Color(4294638079),
      onBackground: Color(4279835425),
      surface: Color(4294638079),
      onSurface: Color(4279835425),
      surfaceVariant: Color(4292862704),
      onSurfaceVariant: Color(4282336078),
      outline: Color(4284178283),
      outlineVariant: Color(4286020231),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217078),
      inverseOnSurface: Color(4293980408),
      inversePrimary: Color(4289709823),
      primaryFixed: Color(4282544845),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280441267),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283593659),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281883296),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283529869),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281885044),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467169),
      surfaceBright: Color(4294638079),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177787),
      surfaceContainer: Color(4293783029),
      surfaceContainerHigh: Color(4293388272),
      surfaceContainerHighest: Color(4293059306),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278198352),
      surfaceTint: Color(4280703925),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278206352),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278198098),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4279910533),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199859),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280043609),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283170841),
      onError: Color(4294967295),
      errorContainer: Color(4287168563),
      onErrorContainer: Color(4294967295),
      background: Color(4294638079),
      onBackground: Color(4279835425),
      surface: Color(4294638079),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292862704),
      onSurfaceVariant: Color(4280296494),
      outline: Color(4282336078),
      outlineVariant: Color(4282336078),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217078),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293323775),
      primaryFixed: Color(4278206352),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278200933),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4279910533),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278200679),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280043609),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202689),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467169),
      surfaceBright: Color(4294638079),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177787),
      surfaceContainer: Color(4293783029),
      surfaceContainerHigh: Color(4293388272),
      surfaceContainerHighest: Color(4293059306),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289709823),
      surfaceTint: Color(4289709823),
      onPrimary: Color(4278201708),
      primaryContainer: Color(4278207125),
      onPrimaryContainer: Color(4292009727),
      secondary: Color(4289775359),
      onSecondary: Color(4278201710),
      secondaryContainer: Color(4283593659),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4294967295),
      onTertiary: Color(4278334790),
      tertiaryContainer: Color(4289846000),
      onTertiaryContainer: Color(4279780438),
      error: Color(4294947517),
      onError: Color(4284940324),
      errorContainer: Color(4292358240),
      onErrorContainer: Color(4294967295),
      background: Color(4279309081),
      onBackground: Color(4293059306),
      surface: Color(4279309081),
      onSurface: Color(4293059306),
      surfaceVariant: Color(4282599250),
      onSurfaceVariant: Color(4291020500),
      outline: Color(4287467677),
      outlineVariant: Color(4282599250),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059306),
      inverseOnSurface: Color(4281217078),
      inversePrimary: Color(4280703925),
      primaryFixed: Color(4292469503),
      onPrimaryFixed: Color(4278196803),
      primaryFixedDim: Color(4289709823),
      onPrimaryFixedVariant: Color(4278207384),
      secondaryFixed: Color(4292469503),
      onSecondaryFixed: Color(4278196548),
      secondaryFixedDim: Color(4289775359),
      onSecondaryFixedVariant: Color(4280239241),
      tertiaryFixed: Color(4290767359),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4288924898),
      onTertiaryFixedVariant: Color(4280372317),
      surfaceDim: Color(4279309081),
      surfaceBright: Color(4281809215),
      surfaceContainerLowest: Color(4278980116),
      surfaceContainerLow: Color(4279835425),
      surfaceContainer: Color(4280098597),
      surfaceContainerHigh: Color(4280822320),
      surfaceContainerHighest: Color(4281546043),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4290104063),
      surfaceTint: Color(4289709823),
      onPrimary: Color(4278195513),
      primaryContainer: Color(4284583916),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290169599),
      onSecondary: Color(4278195258),
      secondaryContainer: Color(4285501401),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294967295),
      onTertiary: Color(4278334790),
      tertiaryContainer: Color(4289846000),
      onTertiaryContainer: Color(4278199087),
      error: Color(4294949058),
      onError: Color(4281729039),
      errorContainer: Color(4294922107),
      onErrorContainer: Color(4278190080),
      background: Color(4279309081),
      onBackground: Color(4293059306),
      surface: Color(4279309081),
      onSurface: Color(4294769407),
      surfaceVariant: Color(4282599250),
      onSurfaceVariant: Color(4291283672),
      outline: Color(4288651952),
      outlineVariant: Color(4286546832),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059306),
      inverseOnSurface: Color(4280822320),
      inversePrimary: Color(4278207642),
      primaryFixed: Color(4292469503),
      onPrimaryFixed: Color(4278194223),
      primaryFixedDim: Color(4289709823),
      onPrimaryFixedVariant: Color(4278203255),
      secondaryFixed: Color(4292469503),
      onSecondaryFixed: Color(4278193968),
      secondaryFixedDim: Color(4289775359),
      onSecondaryFixedVariant: Color(4278399864),
      tertiaryFixed: Color(4290767359),
      onTertiaryFixed: Color(4278194972),
      tertiaryFixedDim: Color(4288924898),
      onTertiaryFixedVariant: Color(4278926156),
      surfaceDim: Color(4279309081),
      surfaceBright: Color(4281809215),
      surfaceContainerLowest: Color(4278980116),
      surfaceContainerLow: Color(4279835425),
      surfaceContainer: Color(4280098597),
      surfaceContainerHigh: Color(4280822320),
      surfaceContainerHighest: Color(4281546043),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294769407),
      surfaceTint: Color(4289709823),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290104063),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294769407),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290169599),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294967295),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289846000),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949058),
      onErrorContainer: Color(4278190080),
      background: Color(4279309081),
      onBackground: Color(4293059306),
      surface: Color(4279309081),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282599250),
      onSurfaceVariant: Color(4294769407),
      outline: Color(4291283672),
      outlineVariant: Color(4291283672),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059306),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278200159),
      primaryFixed: Color(4292863743),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290104063),
      onPrimaryFixedVariant: Color(4278195513),
      secondaryFixed: Color(4292863743),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290169599),
      onSecondaryFixedVariant: Color(4278195258),
      tertiaryFixed: Color(4291423487),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289188326),
      onTertiaryFixedVariant: Color(4278196515),
      surfaceDim: Color(4279309081),
      surfaceBright: Color(4281809215),
      surfaceContainerLowest: Color(4278980116),
      surfaceContainerLow: Color(4279835425),
      surfaceContainer: Color(4280098597),
      surfaceContainerHigh: Color(4280822320),
      surfaceContainerHighest: Color(4281546043),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        appBarTheme: AppBarTheme(backgroundColor: colorScheme.surfaceVariant),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
