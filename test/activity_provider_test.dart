import 'package:flutter_test/flutter_test.dart';
import 'package:daily_wellness/providers/activity_provider.dart';

void main() {
  test('addActivity increases list length', () {
    final provider = ActivityProvider();
    final initial = provider.activities.length;
    provider.addActivity('Yoga');
    expect(provider.activities.length, initial + 1);
  });
}
