import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "row column icon widget",
        theme: ThemeData(primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: const Pagelayout(),
    );
  }
}
  class Pagelayout extends StatelessWidget{
    const Pagelayout({super.key});
  }

