import 'package:flutter/material.dart';
import 'package:ibadah_reminder/models/PrayerTimeSettings.dart';
import 'package:ibadah_reminder/screens/PrayerTimesPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(IRApp());
}

class IRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PrayerTimeSettings> (
        create: (context) => PrayerTimeSettings(),
        child: MaterialApp(
          title: 'Ibadah Reminder',
          theme: ThemeData(
            primarySwatch:  Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            PrayerTimesPage.routeName: (context) => PrayerTimesPage()
          },
          initialRoute: PrayerTimesPage.routeName,
        )
    );
  }
}