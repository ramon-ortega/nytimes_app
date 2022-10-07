import 'package:flutter/material.dart';
import 'package:nytimes_app/src/pages/detail_new.dart';
import 'package:nytimes_app/src/pages/home_page.dart';
import 'package:nytimes_app/src/services/news_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsService(),
        )
      ],
      child: MaterialApp(
        title: 'New York Times App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'detail': (_) => const DetailNew()
        },
      ),
    );
  }
}
