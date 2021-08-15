import 'package:flutter/material.dart';
import 'package:ibadah_reminder/exceptions/InvalidModelInput.dart';

class PrayerTimeSettings extends ChangeNotifier {

  static final Map<int, String> _prayerNames = Map();

  static void initPrayerNames () {
    _prayerNames[1] = "Fajar";
    _prayerNames[2] = "Luhar";
    _prayerNames[3] = "Asr";
    _prayerNames[4] = "Maghrib";
    _prayerNames[5] = "Isha";
  }

  static String getPrayerName(int prayerIndex) {
    if (_prayerNames.length != 5) {
      initPrayerNames();
    }
    if (prayerIndex < 1 || prayerIndex > 5) {
      throw new InvalidModelInput("prayerIndex cannot be $prayerIndex. Must be in range 1-5");
    }
    String? prayerName = _prayerNames[prayerIndex];
    if (prayerName != null) {
      return prayerName;
    }
    throw new InvalidModelInput("Prayer Name not initialized");
  }

  final Map<int, PrayerSettings> _values = Map();

  /*
   * Init Values with 'now' for fresh installation
   */
  PrayerTimeSettings () {
    for (int i = 1; i < 6; i++) {
      _values [i] = PrayerSettings(i);
    }
  }

  /*
   * Get specific prayer time
   */
  PrayerSettings getPrayerSetting(int prayerIndex) {
    if (prayerIndex < 1 || prayerIndex > 5) {
      throw new InvalidModelInput("prayerIndex must in range 1-5. Cannot be $prayerIndex");
    }
    PrayerSettings? value = _values[prayerIndex];
    if (value != null) {
      return value;
    }
    // Code should never reach here, ideally.
    throw new InvalidModelInput("Prayer Setting Not Initialized");
  }

  /*
   * Update Time value for a prayer
   */
  void update (int prayerIndex, TimeOfDay prayerTime) {
    if (prayerIndex < 1 || prayerIndex > 5) {
      throw new InvalidModelInput("prayerIndex must in range 1-5. Cannot be $prayerIndex");
    }
    _values[prayerIndex]!.updateTime(prayerTime);
    notifyListeners();
  }
}

class PrayerSettings {
  int _index = 0;
  TimeOfDay _timeOfDay = TimeOfDay(hour: 0, minute: 0);
  bool _enabled = true;

  PrayerSettings (int index) {
    _index = index;
  }

  /*
   * Getters
   */
  int get index => _index;
  bool get enabled => _enabled;
  TimeOfDay get prayerTime => _timeOfDay;

  void updateTime (TimeOfDay newTime) {
    _timeOfDay = newTime;
  }
}