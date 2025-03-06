import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../gen/assets.gen.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Center(
        child: SvgPicture.asset(Assets.images.blott),
      ),
    );
  }
}
