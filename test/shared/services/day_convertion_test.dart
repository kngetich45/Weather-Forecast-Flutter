import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/shared/services/day_convertion.dart';

void main() {
  test("Test to get the correct weekday from date time", () {
    var result = Convertion.convertWeekDayToDay(1);
    expect(result, "Sunday");
  });
}
