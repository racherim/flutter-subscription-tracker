import 'package:flutter/material.dart';

class Subscription {
  final int? id;
  final String name;
  final double price;
  final int colorValue;
  final String icon;
  final String category;

  Subscription({
    this.id,
    required this.name,
    required this.price,
    required this.colorValue,
    required this.icon,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'colorValue': colorValue,
      'icon': icon,
      'category': category,
    };
  }
  
  factory Subscription.fromMap(Map<String, dynamic> map) {
    return Subscription(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      colorValue: map['colorValue'],
      icon: map['icon'],
      category: map['category'],
    );
  }
  Color get color => Color(colorValue);
}