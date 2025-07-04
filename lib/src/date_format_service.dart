import 'package:intl/intl.dart';

import 'date_formats.dart';
import 'date_utils.dart';

/// A service class for formatting dates using the intl package.
///
/// This class provides various date format patterns that can be used
/// to format DateTime objects into readable strings.
///
/// Usage:
/// ```dart
/// // Using the singleton instance (recommended)
/// final formatted = DateFormatService.instance.formatToDdMmYyyy(DateTime.now());
///
/// // Or create a new instance
/// final formatter = DateFormatService();
/// final formatted = formatter.formatToDdMmYyyy(DateTime.now());
/// ```
class DateFormatService {
  /// Singleton instance for better performance
  static final DateFormatService instance = DateFormatService._internal();

  /// Private constructor for singleton pattern
  DateFormatService._internal();

  /// Factory constructor for backward compatibility
  factory DateFormatService() => instance;

  // Core Date Formats
  /// Date format: dd/MM/yyyy (e.g., 25/12/2023)
  DateFormat get dateFddMMyyyy => DateFormatInstances.ddMMyyyy;

  /// Date format: yyyy-MM-dd (e.g., 2023-12-25)
  DateFormat get dateFyyyyMMdd => DateFormatInstances.yyyyMMdd;

  /// Date format: dd MMM yyyy (e.g., 25 Dec 2023)
  DateFormat get dateFddMMMyyyy => DateFormatInstances.ddMMMyyyy;

  /// Date format: dd MMM yyyy, h:mm a (e.g., 25 Dec 2023, 2:30 PM)
  DateFormat get dateFddMMMyyyyFhmma => DateFormatInstances.ddMMMyyyyHmma;

  /// Date format: yyyy-MM-dd HH:mm:ss (e.g., 2023-12-25 14:30:00)
  DateFormat get dateFyyyyMMddFHHmmss => DateFormatInstances.yyyyMMddHHmmss;

  /// Date format: yyyy-MM-dd'T'HH:mm:ssZ (e.g., 2023-12-25T14:30:00+00:00)
  DateFormat get dateFyyyyMMddTHHmmssZ => DateFormatInstances.yyyyMMddTHHmmssZ;

  // Time Formats
  /// Time format: h:mm a (e.g., 2:30 PM)
  DateFormat get timeFhmma => DateFormatInstances.hmma;

  /// Time format: HH:mm (e.g., 14:30)
  DateFormat get timeFHHmm => DateFormatInstances.HHmm;

  /// Time format: HH:mm:ss (e.g., 14:30:00)
  DateFormat get timeFHHmmss => DateFormatInstances.HHmmss;

  // Component Formats
  /// Day format: E (e.g., Mon)
  DateFormat get dayFE => DateFormatInstances.dayE;

  /// Month format: MMM (e.g., Dec)
  DateFormat get monthFMMM => DateFormatInstances.monthMMM;

  /// Month format: MMMM (e.g., December)
  DateFormat get monthFMMMM => DateFormatInstances.monthMMMM;

  /// Year format: y (e.g., 2023)
  DateFormat get yearFy => DateFormatInstances.yearY;

  // Additional Common Formats
  /// Date format: MM/dd/yyyy (e.g., 12/25/2023)
  DateFormat get dateFMMddyyyy => DateFormatInstances.MMddyyyy;

  /// Date format: EEEE, MMMM d, yyyy (e.g., Monday, December 25, 2023)
  DateFormat get dateFEEEEMMMMdyyyy => DateFormatInstances.EEEEMMMMdyyyy;

  /// Date format: yyyy-MM-dd HH:mm (e.g., 2023-12-25 14:30)
  DateFormat get dateFyyyyMMddHHmm => DateFormatInstances.yyyyMMddHHmm;

  // Core Formatting Methods

  /// Formats a DateTime to dd/MM/yyyy format
  ///
  /// Example:
  /// ```dart
  /// final formatted = DateFormatService.instance.formatToDdMmYyyy(DateTime.now());
  /// // Returns: "25/12/2023"
  /// ```
  String formatToDdMmYyyy(DateTime date) => dateFddMMyyyy.format(date);

  /// Formats a DateTime to yyyy-MM-dd format
  String formatToYyyyMmDd(DateTime date) => dateFyyyyMMdd.format(date);

  /// Formats a DateTime to short date format (dd MMM yyyy)
  String formatToShortDate(DateTime date) => dateFddMMMyyyy.format(date);

  /// Formats a DateTime to date with time (dd MMM yyyy, h:mm a)
  String formatToDateWithTime(DateTime date) =>
      dateFddMMMyyyyFhmma.format(date);

  /// Formats a DateTime to full date and time (yyyy-MM-dd HH:mm:ss)
  String formatToFullDateTime(DateTime date) =>
      dateFyyyyMMddFHHmmss.format(date);

  /// Formats a DateTime to ISO format with timezone
  String formatToIsoWithTimezone(DateTime date) =>
      dateFyyyyMMddTHHmmssZ.format(date);

  /// Formats a DateTime to day of week (E)
  String formatToDayOfWeek(DateTime date) => dayFE.format(date);

  /// Formats a DateTime to month abbreviation (MMM)
  String formatToMonthAbbr(DateTime date) => monthFMMM.format(date);

  /// Formats a DateTime to month full name (MMMM)
  String formatToMonthFull(DateTime date) => monthFMMMM.format(date);

  /// Formats a DateTime to time in 12-hour format (h:mm a)
  String formatToTime12Hour(DateTime date) => timeFhmma.format(date);

  /// Formats a DateTime to time in 24-hour format (HH:mm)
  String formatToTime24Hour(DateTime date) => timeFHHmm.format(date);

  /// Formats a DateTime to full time (HH:mm:ss)
  String formatToFullTime(DateTime date) => timeFHHmmss.format(date);

  /// Formats a DateTime to year (y)
  String formatToYear(DateTime date) => yearFy.format(date);

  /// Formats a DateTime to month and year (MMMM yyyy)
  String formatToMonthYear(DateTime date) =>
      DateFormat("MMMM yyyy").format(date);

  // Additional formatting methods
  /// Formats a DateTime to MM/dd/yyyy format
  String formatToMmDdYyyy(DateTime date) => dateFMMddyyyy.format(date);

  /// Formats a DateTime to full day and date (EEEE, MMMM d, yyyy)
  String formatToFullDayDate(DateTime date) => dateFEEEEMMMMdyyyy.format(date);

  /// Formats a DateTime to yyyy-MM-dd HH:mm format
  String formatToYyyyMmDdHhMm(DateTime date) => dateFyyyyMMddHHmm.format(date);

  // String date parsing and formatting methods with error handling

  /// Parses a date string in yyyy-MM-dd format and formats it to dd/MM/yyyy
  ///
  /// Throws [FormatException] if the input string is not in yyyy-MM-dd format
  String parseAndFormatDdMmYyyy(String dateString) {
    try {
      final date = dateFyyyyMMdd.parse(dateString);
      return dateFddMMyyyy.format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected yyyy-MM-dd, got: $dateString',
      );
    }
  }

  /// Parses a date string in yyyy-MM-dd format and formats it to dd MMM yyyy
  String parseAndFormatShortDate(String dateString) {
    try {
      final date = dateFyyyyMMdd.parse(dateString);
      return dateFddMMMyyyy.format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected yyyy-MM-dd, got: $dateString',
      );
    }
  }

  /// Parses a date string in yyyy-MM-dd format and formats it to month abbreviation
  String parseAndFormatMonthAbbr(String dateString) {
    try {
      final date = dateFyyyyMMdd.parse(dateString);
      return monthFMMM.format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected yyyy-MM-dd, got: $dateString',
      );
    }
  }

  /// Parses a date string in yyyy-MM-dd format and formats it to day of week
  String parseAndFormatDayOfWeek(String dateString) {
    try {
      final date = dateFyyyyMMdd.parse(dateString);
      return dayFE.format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected yyyy-MM-dd, got: $dateString',
      );
    }
  }

  /// Parses a date string in yyyy-MM-dd format and formats it to year
  String parseAndFormatYear(String dateString) {
    try {
      final date = dateFyyyyMMdd.parse(dateString);
      return yearFy.format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected yyyy-MM-dd, got: $dateString',
      );
    }
  }

  /// Parses a date string in yyyy-MM-dd format and formats it to month and year
  String parseAndFormatMonthYear(String dateString) {
    try {
      final date = dateFyyyyMMdd.parse(dateString);
      return DateFormat("MMMM yyyy").format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected yyyy-MM-dd, got: $dateString',
      );
    }
  }

  /// Generic method to parse a date string and format it using any DateFormat
  String parseAndFormat(String dateString, DateFormat outputFormat) {
    try {
      final date = dateFyyyyMMdd.parse(dateString);
      return outputFormat.format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected yyyy-MM-dd, got: $dateString',
      );
    }
  }

  /// Parses a date string in dd/MM/yyyy format and formats it to yyyy-MM-dd
  String parseDdMmYyyyAndFormatYyyyMmDd(String dateString) {
    try {
      final date = dateFddMMyyyy.parse(dateString);
      return dateFyyyyMMdd.format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected dd/MM/yyyy, got: $dateString',
      );
    }
  }

  /// Parses a date string in dd/MM/yyyy format and formats it to dd MMM yyyy
  String parseDdMmYyyyAndFormatShortDate(String dateString) {
    try {
      final date = dateFddMMyyyy.parse(dateString);
      return dateFddMMMyyyy.format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected dd/MM/yyyy, got: $dateString',
      );
    }
  }

  /// Parses a date string in dd/MM/yyyy format and formats it to month abbreviation
  String parseDdMmYyyyAndFormatMonthAbbr(String dateString) {
    try {
      final date = dateFddMMyyyy.parse(dateString);
      return monthFMMM.format(date);
    } catch (e) {
      throw FormatException(
        'Invalid date format. Expected dd/MM/yyyy, got: $dateString',
      );
    }
  }

  // Utility methods

  /// Checks if a string is a valid date in yyyy-MM-dd format
  bool isValidYyyyMmDd(String dateString) =>
      DateUtils.isValidYyyyMmDd(dateString);

  /// Checks if a string is a valid date in dd/MM/yyyy format
  bool isValidDdMmYyyy(String dateString) =>
      DateUtils.isValidDdMmYyyy(dateString);

  /// Gets the current date formatted as dd/MM/yyyy
  String getCurrentDateDdMmYyyy() => DateUtils.getCurrentDateDdMmYyyy();

  /// Gets the current date formatted as yyyy-MM-dd
  String getCurrentDateYyyyMmDd() => DateUtils.getCurrentDateYyyyMmDd();

  /// Gets the current time formatted as HH:mm
  String getCurrentTime24Hour() => DateUtils.getCurrentTime24Hour();

  /// Gets the current time formatted as h:mm a
  String getCurrentTime12Hour() => DateUtils.getCurrentTime12Hour();
}
