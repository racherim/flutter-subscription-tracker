import 'package:flutter/material.dart';
import 'package:flutter_subscription_tracker/utils/subscription_contents.dart';
import 'package:flutter_subscription_tracker/widgets/add_subscription_widget.dart';
import 'package:flutter_subscription_tracker/widgets/average_expenses_widget.dart';
import 'package:flutter_subscription_tracker/widgets/subscription_card_widget.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  String selectedCategory = 'Video & TV';
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subscriptions grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: subscriptions.length,
              itemBuilder: (context, index) {
                final subscription = subscriptions[index];
                return SubscriptionCardWidget(
                  name: subscription['name'],
                  price: subscription['price'],
                  color: subscription['color'],
                  icon: subscription['icon'],
                );
              },
            ),
          ),

          AddSubscriptionWidget(),
          AverageExpensesWidget(),
        ],
      ),
    );
  }
}
