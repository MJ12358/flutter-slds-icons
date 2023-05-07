import 'package:flutter/material.dart';
import 'package:flutter_slds_icons/flutter_slds_icons.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      children: const [
        Icon(SLDSIcons.account),
        Icon(SLDSIcons.account_info),
        Icon(SLDSIcons.action_list_component),
        Icon(SLDSIcons.add_contact),
        Icon(SLDSIcons.add_file),
        Icon(SLDSIcons.audio),
        Icon(SLDSIcons.csv),
        Icon(SLDSIcons.custom1),
        Icon(SLDSIcons.custom10),
      ],
    );
  }
}
