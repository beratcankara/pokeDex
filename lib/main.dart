import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/pages/homePage.dart';

void main() => runApp(const PokeDex());

class PokeDex extends StatefulWidget {
  const PokeDex({super.key});

  @override
  State<PokeDex> createState() => _PokeDexState();
}

class _PokeDexState extends State<PokeDex> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Screen util responsive tasarım yapmaya yarıyor.
      designSize: Size(412, 732),
      builder: (context, child) => MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Poke Dex',
        home: homePage(),
      ),
    );
  }
}
