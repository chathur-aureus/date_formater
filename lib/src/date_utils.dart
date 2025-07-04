/// Utility class for date manipulation and validation
class DateUtils {
  /// Checks if a string is a valid date in yyyy-MM-dd format
  static bool isValidYyyyMmDd(String dateString) {
    try {
      DateTime.parse(dateString);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Checks if a string is a valid date in dd/MM/yyyy format
  static bool isValidDdMmYyyy(String dateString) {
    try {
      final parts = dateString.split('/');
      if (parts.length != 3) return false;

      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      DateTime(year, month, day);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Checks if a string is a valid date in MM/dd/yyyy format
  static bool isValidMmDdYyyy(String dateString) {
    try {
      final parts = dateString.split('/');
      if (parts.length != 3) return false;

      final month = int.parse(parts[0]);
      final day = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      DateTime(year, month, day);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Gets the current date as DateTime
  static DateTime get now => DateTime.now();

  /// Gets the current date formatted as dd/MM/yyyy
  static String getCurrentDateDdMmYyyy() {
    final now = DateTime.now();
    return '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}';
  }

  /// Gets the current date formatted as yyyy-MM-dd
  static String getCurrentDateYyyyMmDd() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  /// Gets the current time formatted as HH:mm
  static String getCurrentTime24Hour() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  /// Gets the current time formatted as h:mm a
  static String getCurrentTime12Hour() {
    final now = DateTime.now();
    final hour =
        now.hour == 0 ? 12 : (now.hour > 12 ? now.hour - 12 : now.hour);
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${now.minute.toString().padLeft(2, '0')} $period';
  }

  /// Adds days to a date
  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  /// Subtracts days from a date
  static DateTime subtractDays(DateTime date, int days) {
    return date.subtract(Duration(days: days));
  }

  /// Gets the start of the day (00:00:00)
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Gets the end of the day (23:59:59)
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  /// Gets the start of the week (Monday)
  static DateTime startOfWeek(DateTime date) {
    final weekday = date.weekday;
    return date.subtract(Duration(days: weekday - 1));
  }

  /// Gets the end of the week (Sunday)
  static DateTime endOfWeek(DateTime date) {
    final weekday = date.weekday;
    return date.add(Duration(days: 7 - weekday));
  }

  /// Gets the start of the month
  static DateTime startOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  /// Gets the end of the month
  static DateTime endOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }

  /// Gets the start of the year
  static DateTime startOfYear(DateTime date) {
    return DateTime(date.year, 1, 1);
  }

  /// Gets the end of the year
  static DateTime endOfYear(DateTime date) {
    return DateTime(date.year, 12, 31);
  }

  /// Checks if a date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Checks if a date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  /// Checks if a date is tomorrow
  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  /// Gets the difference in days between two dates
  static int differenceInDays(DateTime date1, DateTime date2) {
    final normalizedDate1 = DateTime(date1.year, date1.month, date1.day);
    final normalizedDate2 = DateTime(date2.year, date2.month, date2.day);
    return normalizedDate1.difference(normalizedDate2).inDays.abs();
  }

  /// Gets the difference in hours between two dates
  static int differenceInHours(DateTime date1, DateTime date2) {
    return date1.difference(date2).inHours;
  }

  /// Gets the difference in minutes between two dates
  static int differenceInMinutes(DateTime date1, DateTime date2) {
    return date1.difference(date2).inMinutes;
  }

  /// Gets the age from a birth date
  static int getAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Checks if a year is a leap year
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  /// Gets the number of days in a month
  static int daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  /// Gets the quarter of the year for a given date
  static int getQuarter(DateTime date) {
    return ((date.month - 1) / 3).floor() + 1;
  }

  /// Gets the week of the year for a given date
  static int getWeekOfYear(DateTime date) {
    final startOfYear = DateTime(date.year, 1, 1);
    final daysSinceStart = date.difference(startOfYear).inDays;
    return ((daysSinceStart + startOfYear.weekday - 1) / 7).floor() + 1;
  }
}
