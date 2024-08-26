import 'package:flutter/material.dart';

import 'ColorsUtil.dart';
import 'cache_data.dart';

abstract class ThemeColorConfig {
  //正常模式、也可读取后台数据模式
  Map<String, dynamic> normalColorInfo = {};

  //暗黑模式、可跟随系统
  Map<String, dynamic> darkColorInfo = {};

  Color configColor(String colorKey) {
    //读取是否是暗黑模式 这里是读取存储的模式，使用的SpUtil封装的，比较简易，就不贴了
    String isDark = CacheData.getInstance().getThemeType();
    Map colorInfo = isDark == "dark" ? darkColorInfo : normalColorInfo;
    debugPrint("colorInfo:${colorInfo[colorKey]}");
    return ColorsUtil.hexToColor(colorInfo[colorKey]);
  }
}

class ThemColorUtil extends ThemeColorConfig {
  @override
  // 暗黑模式，可随系统变化
  Map<String, dynamic> get darkColorInfo => {
    'backgroundColor': "#FFFFFF",
    'text': "#065808",
    'button': "#1E90FF",
    'content': "#000000",
    'themColor': "#8A2BE2",
    'line': "#999999",
    'space': "#E8E8E8",
    'cloc3c3c3': "#c3c3c3",
    'redText': "#FF6650",
    'cloC6C9DB': "#C6C9DB",
  };

  @override
  // 正常模式、也可读取后台数据模式
  Map<String, dynamic> get normalColorInfo =>
      {
        'text': "#6750A4",
        'button': "#1F1D2B",
        'backgroundColor': "#000000",
        'content': "#000000",
        'themColor': "#1F1D2B",
        'line': "#999999",
        'space': "#E8E8E8",
        'c3c3c3': "#c3c3c3",
        'redText': "#FF6650"
      };
}

