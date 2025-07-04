import 'package:intl/intl.dart';

import 'date_format_service.dart';
import 'date_utils.dart';

/// Extension methods for String to make date parsing and formatting easier
///
/// Usage:
/// ```dart
/// print('2023-12-25'.parseYyyyMmDdToDdMmYyyy()); // "25/12/2023"
/// print('25/12/2023'.parseDdMmYyyyToYyyyMmDd()); // "2023-12-25"
/// ```
extension StringDateFormatting on String {
  /// Parses a date string in yyyy-MM-dd format and formats it to dd/MM/yyyy
  String parseYyyyMmDdToDdMmYyyy() =>
      DateFormatService.instance.parseAndFormatDdMmYyyy(this);

  /// Parses a date string in yyyy-MM-dd format and formats it to dd MMM yyyy
  String parseYyyyMmDdToShortDate() =>
      DateFormatService.instance.parseAndFormatShortDate(this);

  /// Parses a date string in yyyy-MM-dd format and formats it to month abbreviation
  String parseYyyyMmDdToMonthAbbr() =>
      DateFormatService.instance.parseAndFormatMonthAbbr(this);

  /// Parses a date string in yyyy-MM-dd format and formats it to day of week
  String parseYyyyMmDdToDayOfWeek() =>
      DateFormatService.instance.parseAndFormatDayOfWeek(this);

  /// Parses a date string in yyyy-MM-dd format and formats it to year
  String parseYyyyMmDdToYear() =>
      DateFormatService.instance.parseAndFormatYear(this);

  /// Parses a date string in yyyy-MM-dd format and formats it to month and year
  String parseYyyyMmDdToMonthYear() =>
      DateFormatService.instance.parseAndFormatMonthYear(this);

  /// Parses a date string in dd/MM/yyyy format and formats it to yyyy-MM-dd
  String parseDdMmYyyyToYyyyMmDd() =>
      DateFormatService.instance.parseDdMmYyyyAndFormatYyyyMmDd(this);

  /// Parses a date string in dd/MM/yyyy format and formats it to dd MMM yyyy
  String parseDdMmYyyyToShortDate() =>
      DateFormatService.instance.parseDdMmYyyyAndFormatShortDate(this);

  /// Parses a date string in dd/MM/yyyy format and formats it to month abbreviation
  String parseDdMmYyyyToMonthAbbr() =>
      DateFormatService.instance.parseDdMmYyyyAndFormatMonthAbbr(this);

  /// Generic method to parse a date string in yyyy-MM-dd format and format it using any DateFormat
  String parseYyyyMmDdAndFormat(DateFormat outputFormat) =>
      DateFormatService.instance.parseAndFormat(this, outputFormat);

  /// Checks if the string is a valid date in yyyy-MM-dd format
  bool get isValidYyyyMmDd => DateUtils.isValidYyyyMmDd(this);

  /// Checks if the string is a valid date in dd/MM/yyyy format
  bool get isValidDdMmYyyy => DateUtils.isValidDdMmYyyy(this);

  /// Checks if the string is a valid date in MM/dd/yyyy format
  bool get isValidMmDdYyyy => DateUtils.isValidMmDdYyyy(this);
}
