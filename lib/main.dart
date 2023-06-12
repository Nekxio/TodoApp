import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'modules/home/views/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:json_theme/json_theme.dart';

import 'package:flutter/services.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(theme: theme));
}

class MyApp extends ConsumerWidget {
  final ThemeData theme;

  const MyApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'TodoApp',
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            theme: theme,
            themeMode: ThemeMode.light,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
