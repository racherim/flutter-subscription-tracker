import 'package:flutter/material.dart';
import 'package:flutter_subscription_tracker/utils/subscription_genres_items.dart';
import 'package:flutter_subscription_tracker/utils/subscription_icons_items.dart';

class AddSubscriptionWidget extends StatelessWidget {
  final TextEditingController subscriptionNameController = TextEditingController();
  final TextEditingController subscriptionPriceController = TextEditingController();
  AddSubscriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _addSubscriptionDialog(context),
      child: const Icon(Icons.add),
    );
  }

  Future<void> _addSubscriptionDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Subscription'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: subscriptionNameController,
                decoration: const InputDecoration(
                  labelText: 'Subscription Name',
                  hintText: 'e.g., Netflix, Spotify',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: subscriptionPriceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  hintText: '0.00',
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: 'Video & TV',
                items: SubscriptionGenres.items
                    .map((genre) => DropdownMenuItem(
                          value: genre,
                          child: Text(genre),
                        ))
                    .toList(),
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: 'icon1',
                items: SubscriptionIcons.items
                    .map((icon) => DropdownMenuItem(
                          value: icon,
                          child: Text(icon),
                        ))
                    .toList(),
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Icon',
                  hintText: 'Select an icon',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}