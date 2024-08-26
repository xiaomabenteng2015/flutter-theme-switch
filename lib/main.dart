import 'package:demo02_theme/page/theme_setting_controller.dart';
import 'package:demo02_theme/util/ColorsUtil.dart';
import 'package:demo02_theme/util/cache_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'page/theme_setting_page.dart';

void main() {
  CacheData.preInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';

    return GetMaterialApp(
      title: appName,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            )),
        // backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              color: Colors.pink,
              child: Text(
                'Text with a background color - colorScheme',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              color: ColorsUtil().backgroundColor,
              child: Text(
                'Text with a background color - customScheme',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorsUtil().textColor(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            brightness: Brightness.dark,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(ThemeSettingPage());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
