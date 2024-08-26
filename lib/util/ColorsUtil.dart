import 'dart:math';

import 'package:flutter/material.dart';

import 'ThemeColorConfig.dart';

class ColorsUtil {
  // 颜色键值，取值用
  static String them = "themColor";
  static String background = "backgroundColor";
  static String text = "text";
  static String button = "button";
  static String content = "content";
  static String line = "line";
  static String space = "space";
  static String cloc3c3c3 = "cloc3c3c3";
  static String redText = "redText";
  static String cloC6C9DB = "cloC6C9DB";

  /// 十六进制颜色，
  /// hex, 十六进制值，例如：0xffffff,
  /// alpha, 透明度 [0.0,1.0]
  static Color hexToColor(dynamic string) {
    /// 如果传入的十六进制颜色值不符合要求，返回默认值
    if (string == null ||
        string.length != 7 ||
        int.tryParse(string.substring(1, 7), radix: 16) == null) {
      string = '#999999';
    }

    return Color(int.parse(string.substring(1, 7), radix: 16) + 0xFF000000);
  }

  ///生成随机颜色
  static Color randomColor() {
    return Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
  }

  /// 项目主题色
  Color themeColor = ThemColorUtil().configColor(them);

  /// 项目背景色
  Color backgroundColor = ThemColorUtil().configColor(background);

  /// 文本
  Color textColor(){
    var color =  ThemColorUtil().configColor(text);
    return color;
  }

  /// cloC6C9DB
  Color colorC6C9DB = ThemColorUtil().configColor(cloC6C9DB);
}
