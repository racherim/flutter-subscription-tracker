import 'package:flutter/material.dart';
import 'package:flutter_subscription_tracker/utils/subscription_contents.dart';

class AverageExpensesWidget extends StatefulWidget {
  const AverageExpensesWidget({super.key});

  @override
  State<AverageExpensesWidget> createState() => _AverageExpensesWidgetState();
}

class _AverageExpensesWidgetState extends State<AverageExpensesWidget> {
  double totalExpenses = 0.0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTotalExpenses();
  }

  Future<void> _loadTotalExpenses() async {
    try {
      final total = await SubscriptionContents.getTotalMonthlyCost();
      setState(() {
        totalExpenses = total;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        totalExpenses = 0.0;
        isLoading = false;
      });
    }
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                'per month',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(
                  '\$${totalExpenses.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
        ],
      ),
    );
  }
}