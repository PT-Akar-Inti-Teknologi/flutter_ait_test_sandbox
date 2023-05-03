import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      context.go(HomeNav.home.fullpath);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const _LoadingScreen();
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
