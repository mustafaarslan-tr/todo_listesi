import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Sabitler/provider.dart';
import 'package:todo_list/Sabitler/renkler.dart';
import 'package:todo_list/Sayfalar/ana_sayfa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        ProviderData();
      },
      child: DtScoreBoard()));
}

class DtScoreBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderData>(
        create: (_) => ProviderData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: beyaz,
            body: AnaSayfa(),
          ),
        ));
  }
}
