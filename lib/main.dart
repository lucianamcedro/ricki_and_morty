import 'package:device_preview/device_preview.dart';
import 'package:estudo_rick_xp_flutter/home/presentation/page/home_page.dart';
import 'package:estudo_rick_xp_flutter/injection.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/application_theme.dart';
import 'package:estudo_rick_xp_flutter/shared/theme/data/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    DevicePreview(
      builder: (_) {
        return const RickAndMortyApp();
      },
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themes[AppTheme.dark]?.themeData,
      home: const HomePage(),
    );
  }
}
