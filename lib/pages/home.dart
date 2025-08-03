import 'package:flutter/material.dart';
import 'package:flutter_subscription_tracker/widgets/custom_appbar_widget.dart';
import 'package:flutter_subscription_tracker/widgets/main_mobile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppbarWidget(),
      body: MainMobile()
    );
  }
}
