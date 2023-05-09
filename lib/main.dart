import 'package:flutter/material.dart';
import 'package:walkmate/pages/home_page.dart';
import 'package:walkmate/pages/set_limit.dart';
import 'package:walkmate/theme/theme_modal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModal>(
        create: (_) => ThemeModal(),
        child: Consumer(
          builder: (context, ThemeModal themeNotifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              // theme:themeNotifier.isDark ? ThemeData.dark(): ThemeData.light(),
              // home: HomePage(),
              home:SetLimit(), 
              // home:HomePage(), 
            );
          },
        ));
  }
}
