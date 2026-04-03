// Flutter Hive 本地数据库
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final box = await Hive.openBox<String>('demo');
  await box.put('name', 'Alice');
  runApp(MyApp(box: box));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.box});

  final Box<String> box;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Hive')),
        body: Center(child: Text('Stored name: ${box.get('name')}')),
      ),
    );
  }
}
