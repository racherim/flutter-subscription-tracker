import 'package:flutter/material.dart';
import 'package:flutter_subscription_tracker/utils/subscription_contents.dart';
import 'package:flutter_subscription_tracker/utils/subscription_genres_items.dart';
import 'package:flutter_subscription_tracker/utils/subscription_icons_items.dart';
import 'package:flutter_subscription_tracker/utils/subscription_models.dart';

class AddSubscriptionWidget extends StatefulWidget {
  final VoidCallback? onSubscriptionAdded;
  
  const AddSubscriptionWidget({super.key, this.onSubscriptionAdded});

  @override
  State<AddSubscriptionWidget> createState() => _AddSubscriptionWidgetState();
}

class _AddSubscriptionWidgetState extends State<AddSubscriptionWidget> {
  final TextEditingController subscriptionNameController = TextEditingController();
  final TextEditingController subscriptionPriceController = TextEditingController();
  String selectedCategory = 'Video & TV';
  String selectedIcon = '🎬';
  Color selectedColor = Colors.blue;

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
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add Subscription'),
              content: SingleChildScrollView(
                child: Column(
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
                      value: selectedCategory,
                      items: SubscriptionGenres.items
                          .map((genre) => DropdownMenuItem(
                                value: genre,
                                child: Text(genre),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Category',
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: selectedIcon,
                      items: SubscriptionIcons.items
                          .map((icon) => DropdownMenuItem(
                                value: icon,
                                child: Text(icon),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedIcon = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Icon',
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Color picker
                    Wrap(
                      spacing: 8,
                      children: [
                        Colors.blue,
                        Colors.red,
                        Colors.green,
                        Colors.purple,
                        Colors.orange,
                        Colors.teal,
                      ].map((color) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: selectedColor == color
                                  ? Border.all(color: Colors.black, width: 2)
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
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
                  onPressed: () async {
                    await _addSubscription();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
    Future<void> _addSubscription() async {
      if (subscriptionNameController.text.isEmpty || 
          subscriptionPriceController.text.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please fill in all required fields'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }
  
      try {
        final subscription = Subscription(
          name: subscriptionNameController.text,
          price: double.tryParse(subscriptionPriceController.text) ?? 0.0,
          colorValue: selectedColor.value,
          icon: selectedIcon,
          category: selectedCategory,
        );
  
        await SubscriptionContents.addSubscription(subscription);
        subscriptionNameController.clear();
        subscriptionPriceController.clear();

        setState(() {
          selectedCategory = 'Video & TV';
          selectedIcon = '🎬';
          selectedColor = Colors.blue;
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Subscription added successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
        
        if (widget.onSubscriptionAdded != null) {
          widget.onSubscriptionAdded!();
        }
        
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error adding subscription: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
}