import 'package:flutter/material.dart';

class SubscriptionCardWidget extends StatelessWidget {
  final String name;
  final double price;
  final Color color;
  final String icon;

  const SubscriptionCardWidget({
    super.key,
    required this.name,
    required this.price,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon/Logo area
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                icon,
                style: TextStyle(
                  fontSize: icon.length == 1 ? 18 : 12,
                  fontWeight: FontWeight.bold,
                  color: color == Colors.black || color == Colors.blue[800]
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
          const Spacer(),
          // Service name
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color == Colors.black || color == Colors.blue[800]
                  ? Colors.white
                  : Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          // Price
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 14,
              color:
                  (color == Colors.black || color == Colors.blue[800]
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
