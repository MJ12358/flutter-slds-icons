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
      children: const <Widget>[
        Icon(SLDSIcons.zoomout),
        Icon(SLDSIcons.account),
        Icon(SLDSIcons.account_info),
        Icon(SLDSIcons.action_list_component),
        Icon(SLDSIcons.actions_and_buttons),
        Icon(SLDSIcons.activation_target),
        Icon(SLDSIcons.activations),
        Icon(SLDSIcons.activity),
        Icon(SLDSIcons.ad_set),
        Icon(SLDSIcons.add),
        Icon(SLDSIcons.add_contact),
        Icon(SLDSIcons.add_file),
        Icon(SLDSIcons.add_photo_video),
        Icon(SLDSIcons.add_relationship),
        Icon(SLDSIcons.address),
        Icon(SLDSIcons.adduser),
        Icon(SLDSIcons.adjust_value),
        Icon(SLDSIcons.advanced_function),
        Icon(SLDSIcons.advertising),
        Icon(SLDSIcons.agent_home),
        Icon(SLDSIcons.agent_session),
        Icon(SLDSIcons.audio),
        Icon(SLDSIcons.csv),
        Icon(SLDSIcons.custom1),
        Icon(SLDSIcons.custom10),
        Icon(SLDSIcons.xml),
        Icon(SLDSIcons.your_account),
        Icon(SLDSIcons.yubi_key),
        Icon(SLDSIcons.zip),
        Icon(SLDSIcons.zoomin),
      ],
    );
  }
}
