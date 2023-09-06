import 'package:flutter/material.dart';
import 'package:flutter_slds_icons_example/map.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SLDS Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter SLDS Icons'),
        ),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      children: kIcons.entries.map<Widget>((MapEntry<String, IconData> v) {
        return Column(
          children: <Widget>[
            Icon(v.value),
            Text(
              v.key,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 8),
            ),
          ],
        );
      }).toList(),
    );
  }
}
