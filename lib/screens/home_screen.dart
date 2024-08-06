import 'package:flutter/material.dart';
import 'package:flutter_animation_3/components/credentials_block.dart';
import 'package:flutter_animation_3/components/skip_button.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return  Scaffold(
          appBar: AppBar(
            actions:const [
              SkipButton(),
            ],
          ),
          body: const Center(
            child: CredentialsBlock(),
          ),
        );
  }
}