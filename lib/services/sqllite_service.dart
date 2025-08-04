import 'package:flutter_subscription_tracker/utils/subscription_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class SqlliteService {
  static final SqlliteService _instance = SqlliteService._internal();
  factory SqlliteService() => _instance;
  SqlliteService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'subscriptions.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE subscriptions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        colorValue INTEGER NOT NULL,
        icon TEXT NOT NULL,
        category TEXT NOT NULL
      )
    ''');

    // Insert default subscriptions
    await _insertDefaultSubscriptions(db);
  }

  Future<void> _insertDefaultSubscriptions(Database db) async {
    final defaultSubscriptions = [
      {
        'name': 'Paramount+',
        'price': 12.99,
        'colorValue': Colors.blue.value,
        'icon': '🏔️',
        'category': 'Video & TV',
      },
    ];

    for (var subscription in defaultSubscriptions) {
      await db.insert('subscriptions', subscription);
    }
  }

  // Insert subscription
  Future<int> insertSubscription(Subscription subscription) async {
    final db = await database;
    return await db.insert('subscriptions', subscription.toMap());
  }

  // Get all subscriptions
  Future<List<Subscription>> getSubscriptions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('subscriptions');
    return List.generate(maps.length, (i) {
      return Subscription.fromMap(maps[i]);
    });
  }

  // Update subscription
  Future<int> updateSubscription(Subscription subscription) async {
    final db = await database;
    return await db.update(
      'subscriptions',
      subscription.toMap(),
      where: 'id = ?',
      whereArgs: [subscription.id],
    );
  }

  // Delete subscription
  Future<int> deleteSubscription(int id) async {
    final db = await database;
    return await db.delete(
      'subscriptions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Get total monthly cost
  Future<double> getTotalMonthlyCost() async {
    final subscriptions = await getSubscriptions();
    double total = 0.0;
    for (final subscription in subscriptions) {
      total += subscription.price;
    }
    return total;
  }
}