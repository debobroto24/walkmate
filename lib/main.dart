import 'package:flutter/material.dart';
import 'package:walkmate/pages/check_point.dart';
import 'package:walkmate/pages/home_page.dart';
import 'package:walkmate/pages/set_limit.dart';
import 'package:walkmate/provider/checkpoint_provider.dart';
import 'package:walkmate/route/routegenerator.dart';
import 'package:walkmate/theme/theme_modal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModal>(create: (context)=> ThemeModal(),), 
        ChangeNotifierProvider<CheckPointProvider>(create: (context)=>CheckPointProvider(),)
      ],
     
      
      child: Consumer(
        builder: (context, ThemeModal themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            // theme:themeNotifier.isDark ? ThemeData.dark(): ThemeData.light(),
            // home: HomePage(),
            // home:SetLimit(),
            // home: CheckPoint(),
            // home:SetLimit(),
            home:HomePage(),
            initialRoute: RouteGenerator.checkPointPage,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
