import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Order App',
      initialRoute: '/',
      getPages: AppRoutes.routes,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
