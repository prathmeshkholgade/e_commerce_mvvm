import 'package:e_commerce_app/presentation/views/error/network_error_page.dart';
import 'package:e_commerce_app/di/injection.dart';
import 'package:e_commerce_app/presentation/bloc/auth/app_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/auth/auth_controller.dart';
import 'package:e_commerce_app/presentation/views/auth/loginpage.dart';
import 'package:e_commerce_app/presentation/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  await setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  // final networkErrorController = Get.put(NetworkController());
  // ever(networkErrorController.isConnected, (conneted) {
  //   print("cheeking for network..");
  //   if (!conneted) {
  //     Get.to(NetworkErrorPage());
  //   }
  // });

  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = sl<AuthController>();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainPage(),
      // authController.token.value.isEmpty ? Loginpage() : MainPage(),
    );
  }
}
