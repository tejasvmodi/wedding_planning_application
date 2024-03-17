import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wedding_planning_application/Models/token_manager.dart';
import 'package:wedding_planning_application/Screen/Screen_Navigation.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    _checkLoggedIn();
  }

  Future<void> _checkLoggedIn() async {
    final token = await TokenManager.getToken();
    if (token != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(62, 53, 53, 1),
        ),
        //      inputDecorationTheme: const InputDecorationTheme(
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.black), // Your desired enabled border color
        // ),
        //  disabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.black), // Your desired disabled border color
        // ),),
        useMaterial3: true,
      ),
      home: _isLoggedIn ? ScreenNavigation() : const LoginForm(),
    );
  }
}
