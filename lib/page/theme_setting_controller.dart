import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/cache_data.dart';

class ThemeSettingsController extends GetxController {
  final currentThemeIndex = 0.obs;

  List<String> themeList = [
    "跟随系统",
    "白天模式",
    "黑夜模式",
  ];

  @override
  void onInit() {
    super.onInit();
    currentThemeIndex.value = 0;
  }

  ///切换主题
  void changeTheme(BuildContext context, int themeIndex) {
    ThemeData themeData;
    ThemeMode themeMode;
    String themeType = "";
    switch (themeIndex) {
      case 0: //跟隨系統
        themeData = MediaQuery.of(context).platformBrightness == Brightness.dark ? darkTheme : lightTheme;
        themeMode = ThemeMode.system;
        themeType = MediaQuery.of(context).platformBrightness == Brightness.dark? "dark":"light";
        break;
      case 1: //浅色模式
        themeData = lightTheme;
        themeMode = ThemeMode.light;
        themeType = "light";
        break;
      case 2: //深色模式
        themeData = darkTheme;
        themeMode = ThemeMode.dark;
        themeType = "dark";
        break;
      default:
        themeData = MediaQuery.of(context).platformBrightness == Brightness.dark ? darkTheme : lightTheme;
        themeMode = ThemeMode.system;
        themeType = MediaQuery.of(context).platformBrightness == Brightness.dark? "dark":"light";
        break;
    }
    //保存到本地
    CacheData.getInstance().setThemeType(themeType);

    currentThemeIndex.value = themeIndex;
    Get.changeTheme(themeData);
    Get.changeThemeMode(themeMode);
  }
}

// // 主题 - 白天模式
// final ThemeData lightTheme = FlexThemeData.light(
//   useMaterial3: true,
//   colors: globalFlexScheme.light,
//   // subThemesData: const FlexSubThemesData(),
//   appBarElevation: 0.5,
//   visualDensity: VisualDensity.standard,
//   typography: Typography.material2021(
//     platform: defaultTargetPlatform,
//   ),
// );
//
// ///深色模式
// ThemeData darkTheme = FlexThemeData.dark(
//   useMaterial3: true,
//   colors: globalFlexScheme.dark,
//   // subThemesData: const FlexSubThemesData(),
//   appBarElevation: 1,
//   visualDensity: VisualDensity.standard,
//   typography: Typography.material2021(
//     platform: defaultTargetPlatform,
//   ),
// );
//
// FlexSchemeData globalFlexScheme = const FlexSchemeData(
//   name: 'Midnight blue',
//   description: 'Midnight blue theme, custom definition of all colors',
//   light: FlexSchemeColor(
//     primary: Color(0xFF00296B),
//     primaryContainer: Color(0xFFA0C2ED),
//     secondary: Color(0xFFD26900),
//     secondaryContainer: Color(0xFFFFD270),
//     tertiary: Color(0xFF5C5C95),
//     tertiaryContainer: Color(0xFFC8DBF8),
//   ),
//   dark: FlexSchemeColor(
//     primary: Color(0xFFB1CFF5),
//     primaryContainer: Color(0xFF3873BA),
//     secondary: Color(0xFFFFD270),
//     secondaryContainer: Color(0xFFD26900),
//     tertiary: Color(0xFFC9CBFC),
//     tertiaryContainer: Color(0xFF535393),
//   ),
// );

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: flexSchemeLight,
  appBarTheme: AppBarTheme(
    // backgroundColor: Colors.white,
    // foregroundColor: Colors.green,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      statusBarColor: Colors.transparent,
      statusBarBrightness: ThemeData.estimateBrightnessForColor(const Color(0x40FFFFFF)),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: false ? Brightness.light : Brightness.dark,
      systemNavigationBarDividerColor: null,
      systemNavigationBarContrastEnforced: false,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.oswald(
      fontSize: 30,
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: GoogleFonts.merriweather(),
    displaySmall: GoogleFonts.pacifico(),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: flexSchemeDark,
  appBarTheme: const AppBarTheme(
    // backgroundColor: Colors.black,
    // foregroundColor: Colors.green,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: true,
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor:  Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: null,
      systemNavigationBarContrastEnforced: false,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic),
    bodyMedium: GoogleFonts.merriweather(),
    displaySmall: GoogleFonts.pacifico(),
  ),
);

// Light and dark ColorSchemes made by FlexColorScheme v7.3.1.
// These ColorScheme objects require Flutter 3.7 or later.
const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff006876),
  onPrimary: Color(0xffE20000),
  primaryContainer: Color(0xffa1efff),
  onPrimaryContainer: Color(0xff0e1414),
  secondary: Color(0xff476365),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffcae8ea),
  onSecondaryContainer: Color(0xff111313),
  tertiary: Color(0xff585c82),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffdfe0ff),
  onTertiaryContainer: Color(0xff131314),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff141212),
  surface: Color(0xfff8fafb),
  onSurface: Color(0xff090909),
  surfaceContainerHighest: Color(0xffe0e6e7),
  onSurfaceVariant: Color(0xff111212),
  outline: Color(0xff7c7c7c),
  outlineVariant: Color(0xffc8c8c8),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff101313),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xff90dbe5),
  surfaceTint: Color(0xff006876),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff44d8f1),
  onPrimary: Color(0xff091414),
  primaryContainer: Color(0xff004e59),
  onPrimaryContainer: Color(0xffdfeced),
  secondary: Color(0xffaeccce),
  onSecondary: Color(0xff111414),
  secondaryContainer: Color(0xff304b4d),
  onSecondaryContainer: Color(0xffe7ebeb),
  tertiary: Color(0xffc0c3ef),
  onTertiary: Color(0xff131314),
  tertiaryContainer: Color(0xff404468),
  onTertiaryContainer: Color(0xffe9eaf0),
  error: Color(0xffffb4ab),
  onError: Color(0xff141211),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xfff6dfe1),
  surface: Color(0xff131b1c),
  onSurface: Color(0xffeceded),
  surfaceContainerHighest: Color(0xff334245),
  onSurfaceVariant: Color(0xffdfe1e1),
  outline: Color(0xff767d7d),
  outlineVariant: Color(0xff2c2e2e),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfff5fdfe),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff2b6b76),
  surfaceTint: Color(0xff44d8f1),
);

