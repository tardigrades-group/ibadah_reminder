import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ibadah_reminder/models/PrayerTimeSettings.dart';

class PrayerTimesPage extends StatelessWidget {
  static String routeName = '/prayerTimes';

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Prayer Times'),
      ),
      body: Consumer<PrayerTimeSettings> (
        builder: (context, value, child) => ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => PrayerTile (value.getPrayerSetting(index + 1)),
        ),
      )
    );
  }
}

class PrayerTile extends StatelessWidget {
  final PrayerSettings prayerSetting;

  const PrayerTile (this.prayerSetting);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile (
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
        ),
        title: Text (
          PrayerTimeSettings.getPrayerName(prayerSetting.index)
        ),
        trailing: Text (
          prayerSetting.prayerTime.hour.toString() + ":" + prayerSetting.prayerTime.minute.toString()
        ),
      )
    );
  }
}