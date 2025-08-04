# Flutter Subscription Tracker 📱💳

A modern and intuitive Flutter app for tracking your monthly subscriptions and managing your recurring expenses. Built with a clean UI inspired by popular subscription management apps.

## ✨ Features

- **📊 Visual Dashboard**: Grid-based layout displaying all your subscriptions with custom colors and icons
- **💰 Expense Tracking**: Automatic calculation of total monthly costs
- **🗂️ Category Filtering**: Filter subscriptions by categories (Video & TV, Music, Gaming, etc.)
- **➕ Easy Adding**: Simple form to add new subscriptions with custom details
- **🗑️ Quick Deletion**: One-tap delete with confirmation dialog
- **💾 Persistent Storage**: SQLite database for offline data storage
- **🎨 Beautiful UI**: Custom app bar, floating action button, and responsive design

## 📱 Screenshots

The app features a clean, card-based interface similar to popular subscription management apps like "ReSubs", with:
- Colorful subscription cards showing service name, price, and custom icons
- Category filter chips for easy browsing
- Total monthly expense summary at the bottom
- Floating action button for adding new subscriptions

## 🛠️ Technical Stack

- **Framework**: Flutter 3.x
- **Database**: SQLite (sqflite package)
- **State Management**: StatefulWidget with setState
- **UI Components**: Material Design widgets

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  sqflite: ^2.4.2
  path: ^1.8.3
```

## 🗂️ Project Structure

```
lib/
├── main.dart                           # App entry point
├── constant/
│   └── pagestyle.dart                  # Theme and styling constants
├── pages/
│   └── home.dart                       # Main home page
├── widgets/
│   ├── add_subscription_widget.dart    # Add subscription dialog
│   ├── average_expenses_widget.dart    # Monthly expense summary
│   ├── custom_appbar.dart             # Custom app bar
│   ├── main_mobile.dart               # Mobile layout wrapper
│   ├── subscription_card_widget.dart  # Individual subscription card
│   └── subscription_grid_widget.dart  # Grid layout for subscriptions
├── utils/
│   ├── subscription_contents.dart     # Data access layer
│   ├── subscription_models.dart       # Subscription data model
│   ├── subscription_genres_items.dart # Category definitions
│   └── subscription_icons_items.dart  # Icon options
└── services/
    └── sqllite_service.dart           # Database service
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0 or higher
- Dart SDK 3.0 or higher
- Android Studio / VS Code
- Android emulator or physical device

### Installation

1. **Clone the repository**
   ```Install APK
   [@APK Link] https://github.com/racherim/flutter-subscription-tracker/releases/tag/non-production-release
   ```
## 💡 How to Use

### Adding a Subscription
1. Tap the **floating action button (+)** at the bottom right
2. Fill in the subscription details:
   - **Name**: Service name (e.g., Netflix, Spotify)
   - **Price**: Monthly cost
   - **Category**: Select from predefined categories
   - **Icon**: Choose an emoji icon
   - **Color**: Pick a color for the card
3. Tap **"Add"** to save

### Managing Subscriptions
- **View All**: See all subscriptions in a grid layout
- **Filter**: Use category chips to filter by type
- **Delete**: Tap the red × button on any card to delete
- **Total Cost**: View monthly expense summary at the bottom

### Categories Available
- Video & TV
- Music
- Gaming
- Productivity
- News
- Education
- Shopping
- Health & Fitness
- Food & Drink
- Others

## 🗄️ Database Schema

The app uses SQLite with the following table structure:

```sql
CREATE TABLE subscriptions(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  price REAL NOT NULL,
  colorValue INTEGER NOT NULL,
  icon TEXT NOT NULL,
  category TEXT NOT NULL
)
```

## 🎨 UI Components

- **Custom App Bar**: Clean header with category filters
- **Subscription Cards**: Colorful cards with service info
- **Grid Layout**: Responsive 2-column grid
- **Filter Chips**: Easy category selection
- **Floating Action Button**: Quick add functionality
- **Dialogs**: Confirmation and input dialogs

## 🔧 Customization

### Adding New Categories
Edit `lib/utils/subscription_genres_items.dart`:
```dart
static const List<String> items = [
  'Video & TV',
  'Music',
  'Your New Category', // Add here
];
```

### Adding New Icons
Edit `lib/utils/subscription_icons_items.dart`:
```dart
static const List<String> items = [
  '🎬', '🎵', '🎮',
  '🆕', // Add new emoji here
];
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI inspiration
- SQLite for reliable local storage

## 📞 Contact

[@racherim](https://github.com/racherim)

Project Link: [https://github.com/racherim/flutter-subscription-tracker](https://github.com/racherim/flutter-subscription-tracker)

---

⭐ Star this repository if you found it helpful!
