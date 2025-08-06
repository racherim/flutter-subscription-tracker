# 📱 Subscription Tracker - Flutter Application with SQLite Integration

🚀 **Features**

- Create and manage subscription services
- SQLite local storage
- Real-time expense calculation
- Category filtering system
- One-tap deletion with confirmation
- Responsive design for mobile devices

📦 **Downloads**

- Android APK: [Download APK](https://github.com/racherim/flutter-subscription-tracker/releases/tag/non-production-release)
- Source Code: [GitHub Repository](https://github.com/racherim/flutter-subscription-tracker)

� **What's New**

- Initial release
- SQLite database integration
- Category-based filtering
- Custom subscription cards with colors and icons
- Monthly expense tracking
- Intuitive add/delete functionality

� **Installation**

**Android Installation**

1. **Download**: Click the Download APK link above
2. **Enable Installation**: Go to Android Settings > Security > Enable "Unknown Sources"
3. **Install**: Open the downloaded APK file and install
4. **Launch**: Find "Subscription Tracker" in your app drawer

**Development Setup**

```bash
git clone https://github.com/racherim/flutter-subscription-tracker.git
cd flutter-subscription-tracker
flutter pub get
flutter run
```

🛠️ **Technical Details**

- **Framework**: Flutter 3.16+
- **Database**: SQLite (sqflite package)
- **Storage**: Local device storage
- **Platforms**: Android
- **Minimum Android**: API 21 (Android 5.0)

**Dependencies:**
```yaml
sqflite: ^2.4.2
path: ^1.8.3
```

💡 **How to Use**

**Adding Subscriptions**
1. Tap the floating action button (+)
2. Enter subscription name and monthly price
3. Select category (Video & TV, Music, Gaming, etc.)
4. Choose an icon and color
5. Tap "Add" to save

**Managing Subscriptions**
- **View**: Browse all subscriptions in grid layout
- **Filter**: Use category chips to filter by type
- **Delete**: Tap red × button on any card
- **Track**: View total monthly expenses at bottom

🗂️ **Categories Available**

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

� **Privacy & Security**

- All data stored locally on your device
- No internet connection required
- No data collection or tracking
- Complete privacy and offline functionality

🎨 **UI Components**

- Clean, modern interface inspired by popular subscription apps
- Colorful subscription cards with custom icons
- Responsive 2-column grid layout
- Category filter chips
- Floating action button for quick adding
- Confirmation dialogs for safe deletion

🗄️ **Database Schema**

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

🤝 **Contributing**

This is an open-source project. Feel free to contribute!

1. Fork the repository
2. Create feature branch (`git checkout -b feature/NewFeature`)
3. Commit changes (`git commit -m 'Add NewFeature'`)
4. Push to branch (`git push origin feature/NewFeature`)
5. Open Pull Request

📄 **License**

MIT License - see [LICENSE](LICENSE) file for details

---

**Contact**: [@racherim](https://github.com/racherim) | **Project**: [flutter-subscription-tracker](https://github.com/racherim/flutter-subscription-tracker)

⭐ Star this repository if you found it helpful!
