import 'package:estudo_rick_xp_flutter/characters/data/service/character_service.dart';
import 'package:estudo_rick_xp_flutter/injection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          final CharacterService service = GetIt.I.get();
          final response = await service.getCharacteres();

          print('RESPONSE::: $response');
        },
        child: const Text(
          'Teste botão',
        ),
      ),
    );
  }
}
