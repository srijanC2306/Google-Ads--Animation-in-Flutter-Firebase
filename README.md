## Installation Guide

### Prerequisites

- Flutter SDK
- Firebase project
- Google AdMob account

### Step-by-Step Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-repository/fortune-wheel-app.git
   cd fortune-wheel-app
   
# Set Up Firebase

1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Create a new project or select an existing project.
3. Add an Android/iOS app to your Firebase project.
4. Follow the instructions to download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place it in the appropriate directory in your Flutter project.

## Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```
## Add Dependencis in Pubspec.yaml
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: latest_version
  firebase_admob: latest_version
  provider: latest_version
  # Add other dependencies as required
```
# Set Up Google AdMob

1. Go to the [Google AdMob Console](https://apps.admob.com/).
2. Create a new Ad Unit.
3. Copy the Ad Unit ID and add it to your Flutter project.

Example initialization in Flutter:

```dart
import 'package:firebase_admob/firebase_admob.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: "your_admob_app_id");
  runApp(MyApp());
}
```
# Add AdMob Banner Ad

Example of adding a Banner Ad in a widget:

```dart
BannerAd myBanner = BannerAd(
  adUnitId: "your_banner_ad_unit_id",
  size: AdSize.banner,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

myBanner..load()..show(
  anchorType: AnchorType.bottom,
);
```
# Add Animation using Transform.rotate

Example of using `Transform.rotate` for animations:

```dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpinningWheel extends StatefulWidget {
  @override
  _SpinningWheelState createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: _controller.value * 2.0 * math.pi,
        child: Image.asset('assets/fortune_wheel.png'),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```
## Usage

- Open the app and click on the spin button to spin the wheel.
- Earn rewards based on where the wheel stops.
- View ads to earn additional rewards.

## Contributing

Contributions are welcome! Please create a pull request or submit an issue for any features or improvements.

## License

This project is licensed under the MIT License - see the LICENSE file for details.








