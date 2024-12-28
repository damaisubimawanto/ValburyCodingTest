import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valbury_coding_test/utils/routes/routes.dart';
import 'package:valbury_coding_test/utils/routes/routes_name.dart';
import 'package:valbury_coding_test/view_models/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        initialRoute: RouteName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
