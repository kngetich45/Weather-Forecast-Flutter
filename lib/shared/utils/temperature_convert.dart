library converter;

import 'package:intl/intl.dart';

const String unitDegreesCelsius = "\u00B0C";
const String unitDegreesFahrenheit = "\u00B0F";
const String unitKelvin = "K";

final NumberFormat _f = NumberFormat.decimalPattern("de_DE");

num stringToDouble(String s) => _f.parse(s);

double celsiusToKelvin(double celsius) => 273.15 + celsius; 

double kelvinToCelsius(double kelvin) => kelvin - 273.15;

String celsiusToString(double celsius) =>
    _doubleToString(celsius, unitDegreesCelsius);

String fahrenheitToString(double fahrenheit) =>
    _doubleToString(fahrenheit, unitDegreesFahrenheit);

String kelvinToString(double kelvin) => _doubleToString(kelvin, unitKelvin);

String _doubleToString(double val, String suffix) {
  var rounded = val.round();
  // Could be implemented nicer using intl
  return "${_f.format(val == rounded ? rounded : val)} $suffix";
}