import 'package:flutter/material.dart';
import 'package:flutter_subscription_tracker/constant/pagestyle.dart';
import 'package:flutter_subscription_tracker/widgets/custom_appbar.dart';
import 'package:flutter_subscription_tracker/widgets/subscription_grid_widget.dart';
import 'package:flutter_subscription_tracker/widgets/add_subscription_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Key _gridKey = UniqueKey();

  void _refreshGrid() {
    setState(() {
      _gridKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageStyle().backgroundColor,
      appBar: const CustomAppbar(),
      body: Stack(
        children: [
          SubscriptionGridWidget(key: _gridKey),
          Positioned(
            bottom: 80,
            right: 16,
            child: AddSubscriptionWidget(
              onSubscriptionAdded: _refreshGrid,
            ),
          ),
        ],
      ),
    );
  }
}