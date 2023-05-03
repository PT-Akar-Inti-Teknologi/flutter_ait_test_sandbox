import 'package:auth_blocks/auth_blocks.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: DesignButton(
                style: DesignButtonStyle.primary(context),
                child: (ctx, color) => Text(
                  'Logout',
                  style: DesignTextStyle.body1.overrideColor(color),
                ),
                onTap: () {
                  di<AuthRepository>().logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
