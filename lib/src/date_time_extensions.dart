import 'date_format_service.dart';
import 'date_utils.dart';

/// Extension methods for DateTime to make formatting easier
///
/// Usage:
/// ```dart
/// final date = DateTime.now();
/// print(date.toDdMmYyyy()); // "25/12/2023"
/// print(date.toShortDate()); // "25 Dec 2023"
/// print(date.toTime12Hour()); // "2:30 PM"
/// ```
extension DateTimeFormatting on DateTime {
  /// Formats the date to dd/MM/yyyy format
  String toDdMmYyyy() => DateFormatService.instance.formatToDdMmYyyy(this);

  /// Formats the date to yyyy-MM-dd format
  String toYyyyMmDd() => DateFormatService.instance.formatToYyyyMmDd(this);

  /// Formats the date to short date format (dd MMM yyyy)
  String toShortDate() => DateFormatService.instance.formatToShortDate(this);

  /// Formats the date to date with time (dd MMM yyyy, h:mm a)
  String toDateWithTime() =>
      DateFormatService.instance.formatToDateWithTime(this);

  /// Formats the date to full date and time (yyyy-MM-dd HH:mm:ss)
  String toFullDateTime() =>
      DateFormatService.instance.formatToFullDateTime(this);

  /// Formats the date to ISO format with timezone
  String toIsoWithTimezone() =>
      DateFormatService.instance.formatToIsoWithTimezone(this);

  /// Formats the date to day of week (E)
  String toDayOfWeek() => DateFormatService.instance.formatToDayOfWeek(this);

  /// Formats the date to month abbreviation (MMM)
  String toMonthAbbr() => DateFormatService.instance.formatToMonthAbbr(this);

  /// Formats the date to month full name (MMMM)
  String toMonthFull() => DateFormatService.instance.formatToMonthFull(this);

  /// Formats the date to time in 12-hour format (h:mm a)
  String toTime12Hour() => DateFormatService.instance.formatToTime12Hour(this);

  /// Formats the date to time in 24-hour format (HH:mm)
  String toTime24Hour() => DateFormatService.instance.formatToTime24Hour(this);

  /// Formats the date to full time (HH:mm:ss)
  String toFullTime() => DateFormatService.instance.formatToFullTime(this);

  /// Formats the date to year (y)
  String toYear() => DateFormatService.instance.formatToYear(this);

  /// Formats the date to month and year (MMMM yyyy)
  String toMonthYear() => DateFormatService.instance.formatToMonthYear(this);

  // Additional extension methods
  /// Formats the date to MM/dd/yyyy format
  String toMmDdYyyy() => DateFormatService.instance.formatToMmDdYyyy(this);

  /// Formats the date to full day and date (EEEE, MMMM d, yyyy)
  String toFullDayDate() =>
      DateFormatService.instance.formatToFullDayDate(this);

  /// Formats the date to yyyy-MM-dd HH:mm format
  String toYyyyMmDdHhMm() =>
      DateFormatService.instance.formatToYyyyMmDdHhMm(this);

  // Date utility extensions
  /// Checks if the date is today
  bool get isToday => DateUtils.isToday(this);

  /// Checks if the date is yesterday
  bool get isYesterday => DateUtils.isYesterday(this);

  /// Checks if the date is tomorrow
  bool get isTomorrow => DateUtils.isTomorrow(this);

  /// Gets the age from this date (assuming it's a birth date)
  int get age => DateUtils.getAge(this);

  /// Gets the quarter of the year for this date
  int get quarter => DateUtils.getQuarter(this);

  /// Gets the week of the year for this date
  int get weekOfYear => DateUtils.getWeekOfYear(this);

  /// Gets the start of the day (00:00:00)
  DateTime get startOfDay => DateUtils.startOfDay(this);

  /// Gets the end of the day (23:59:59)
  DateTime get endOfDay => DateUtils.endOfDay(this);

  /// Gets the start of the week (Monday)
  DateTime get startOfWeek => DateUtils.startOfWeek(this);

  /// Gets the end of the week (Sunday)
  DateTime get endOfWeek => DateUtils.endOfWeek(this);

  /// Gets the start of the month
  DateTime get startOfMonth => DateUtils.startOfMonth(this);

  /// Gets the end of the month
  DateTime get endOfMonth => DateUtils.endOfMonth(this);

  /// Gets the start of the year
  DateTime get startOfYear => DateUtils.startOfYear(this);

  /// Gets the end of the year
  DateTime get endOfYear => DateUtils.endOfYear(this);

  /// Adds days to this date
  DateTime addDays(int days) => DateUtils.addDays(this, days);

  /// Subtracts days from this date
  DateTime subtractDays(int days) => DateUtils.subtractDays(this, days);

  /// Gets the difference in days between this date and another date
  int differenceInDays(DateTime other) =>
      DateUtils.differenceInDays(this, other);

  /// Gets the difference in hours between this date and another date
  int differenceInHours(DateTime other) =>
      DateUtils.differenceInHours(this, other);

  /// Gets the difference in minutes between this date and another date
  int differenceInMinutes(DateTime other) =>
      DateUtils.differenceInMinutes(this, other);
}
