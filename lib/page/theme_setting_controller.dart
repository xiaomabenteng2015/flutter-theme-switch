import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
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
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: Colors.white,
    onPrimary: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.green,
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
  primaryColor: Colors.black,
  colorScheme: const ColorScheme.dark(
    primary: Colors.black,
    onPrimary: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.green,
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
    displayLarge: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.amber),
    titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic, color: Colors.amber),
    bodyMedium: GoogleFonts.merriweather(),
    displaySmall: GoogleFonts.pacifico(),
  ),
);
