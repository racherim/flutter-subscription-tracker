import 'package:flutter/material.dart';
import 'package:flutter_subscription_tracker/utils/subscription_contents.dart';

class AverageExpensesWidget extends StatelessWidget {

  const AverageExpensesWidget({super.key});

  double get totalExpenses {
    return subscriptions.fold(
      0.0,
      (sum, subscription) => sum + subscription['price'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Average expenses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'per month',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  '\$${totalExpenses.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
  }
}