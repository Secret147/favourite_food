import 'package:dishsapp/page/detail/detail_page.dart';
import 'package:dishsapp/page/home/home_page.dart';
import 'package:dishsapp/providers/dish_provider.dart';
import 'package:dishsapp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DishProvider(),
      child: MaterialApp.router(
        routerConfig: RouteCustom.router,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
