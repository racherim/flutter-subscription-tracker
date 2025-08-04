import 'package:flutter/material.dart';
import 'package:flutter_subscription_tracker/utils/subscription_contents.dart';
import 'package:flutter_subscription_tracker/utils/subscription_models.dart';
import 'package:flutter_subscription_tracker/widgets/average_expenses_widget.dart';
import 'package:flutter_subscription_tracker/widgets/subscription_card_widget.dart';

class SubscriptionGridWidget extends StatefulWidget {
  const SubscriptionGridWidget({super.key});

  @override
  State<SubscriptionGridWidget> createState() => _SubscriptionGridWidgetState();
}

class _SubscriptionGridWidgetState extends State<SubscriptionGridWidget> {
  List<Subscription> subscriptions = [];
  bool isLoading = true;
  String selectedCategory = 'Video & TV';

  @override
  void initState() {
    super.initState();
    _loadSubscriptions();
  }

  Future<void> _loadSubscriptions() async {
    try {
      final loadedSubscriptions = await SubscriptionContents.getSubscriptions();
      setState(() {
        subscriptions = loadedSubscriptions;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        subscriptions = [];
        isLoading = false;
      });
    }
  }

  // Filter subscriptions by category
  List<Subscription> get filteredSubscriptions {
    if (selectedCategory == 'All') {
      return subscriptions;
    }
    return subscriptions.where((sub) => sub.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category filter chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryChip('All'),
                const SizedBox(width: 8),
                _buildCategoryChip('Video & TV'),
                const SizedBox(width: 8),
                _buildCategoryChip('Music'),
                const SizedBox(width: 8),
                _buildCategoryChip('Gaming'),
                const SizedBox(width: 8),
                _buildCategoryChip('Productivity'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Subscriptions grid
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredSubscriptions.isEmpty
                    ? const Center(
                        child: Text(
                          'No subscriptions found',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: filteredSubscriptions.length,
                        itemBuilder: (context, index) {
                          final subscription = filteredSubscriptions[index];
                          return SubscriptionCardWidget(
                            name: subscription.name,
                            price: subscription.price,
                            color: subscription.color,
                            icon: subscription.icon,
                            id: subscription.id,
                            onDelete: () => _deleteSubscription(subscription.id!),
                          );
                        },
                      ),
          ),
          // Average expenses at the bottom
          const AverageExpensesWidget(),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final isSelected = selectedCategory == category;
    return FilterChip(
      label: Text(category),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          selectedCategory = category;
        });
      },
      selectedColor: Colors.blue.withOpacity(0.2),
      checkmarkColor: Colors.blue,
    );
  }

  Future<void> _deleteSubscription(int id) async {
    try {
      await SubscriptionContents.deleteSubscription(id);
      _loadSubscriptions(); // Refresh the list after deletion
      
      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Subscription deleted successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting subscription: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void refreshSubscriptions() {
    _loadSubscriptions();
  }
}