import 'package:flutter/material.dart';
import 'package:ibadah_reminder/exceptions/InvalidModelInput.dart';
import 'package:ibadah_reminder/models/PrayerTimeSettings.dart';
import 'package:test/test.dart';

void main() {
  group('Testing PrayerTimeSettings', () {

    var prayerTimeSettings = PrayerTimeSettings();

    test ('Default all prayers are enabled and set to 00:00', (){
      for (int i = 1; i < 6; i++) {
        var prayerSetting = prayerTimeSettings.getPrayerSetting(i);
        expect (true, prayerSetting.enabled);
        expect (TimeOfDay(hour: 0, minute: 0), prayerSetting.prayerTime);
      }
    });

    test ('Test updating time works', () {
      prayerTimeSettings.update(1, TimeOfDay(hour: 1, minute: 0));
      var prayerSetting = prayerTimeSettings.getPrayerSetting(1);
      expect (true, prayerSetting.enabled);
      expect (TimeOfDay(hour: 1, minute: 0), prayerSetting.prayerTime);
    });

    test ('Test updating time with invalid prayer index fails', () {
      expect(() => prayerTimeSettings.update(0, TimeOfDay(hour: 1, minute: 0)), throwsA(isA<InvalidModelInput>()));
    });

    test ('Test prayer names are OK', () {
      expect("Fajar", PrayerTimeSettings.getPrayerName(1));
      expect("Luhar", PrayerTimeSettings.getPrayerName(2));
      expect("Asr", PrayerTimeSettings.getPrayerName(3));
      expect("Maghrib", PrayerTimeSettings.getPrayerName(4));
      expect("Isha", PrayerTimeSettings.getPrayerName(5));
    });
  });
}