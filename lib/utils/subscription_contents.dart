import 'package:flutter_subscription_tracker/services/sqllite_service.dart';
import 'package:flutter_subscription_tracker/utils/subscription_models.dart';

class SubscriptionContents {
  static final SqlliteService _databaseHelper = SqlliteService();

  // Get all subscriptions from database
  static Future<List<Subscription>> getSubscriptions() async {
    return await _databaseHelper.getSubscriptions();
  }

  // Add new subscription
  static Future<int> addSubscription(Subscription subscription) async {
    return await _databaseHelper.insertSubscription(subscription);
  }

  // Delete subscription
  static Future<int> deleteSubscription(int id) async {
    return await _databaseHelper.deleteSubscription(id);
  }

  // Get total monthly cost
  static Future<double> getTotalMonthlyCost() async {
    return await _databaseHelper.getTotalMonthlyCost();
  }
}