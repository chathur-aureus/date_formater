

import 'package:flutter_date_kit/flutter_date_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateFormatService', () {
    late DateFormatService formatter;
    late DateTime testDate;

    setUp(() {
      formatter = DateFormatService.instance;
      // Use a fixed date for consistent testing
      testDate = DateTime(2023, 12, 25, 14, 30, 45);
    });

    test('singleton instance works correctly', () {
      final instance1 = DateFormatService.instance;
      final instance2 = DateFormatService.instance;
      final instance3 = DateFormatService();

      expect(identical(instance1, instance2), true);
      expect(identical(instance1, instance3), true);
    });

    test('formatToDdMmYyyy formats date to dd/MM/yyyy', () {
      final result = formatter.formatToDdMmYyyy(testDate);
      expect(result, '25/12/2023');
    });

    test('formatToYyyyMmDd formats date to yyyy-MM-dd', () {
      final result = formatter.formatToYyyyMmDd(testDate);
      expect(result, '2023-12-25');
    });

    test('formatToShortDate formats date to dd MMM yyyy', () {
      final result = formatter.formatToShortDate(testDate);
      expect(result, '25 Dec 2023');
    });

    test('formatToDateWithTime formats date with time', () {
      final result = formatter.formatToDateWithTime(testDate);
      expect(result, '25 Dec 2023, 2:30 PM');
    });

    test('formatToFullDateTime formats date and time', () {
      final result = formatter.formatToFullDateTime(testDate);
      expect(result, '2023-12-25 14:30:45');
    });

    test('formatToIsoWithTimezone formats date to ISO with timezone', () {
      final result = formatter.formatToIsoWithTimezone(testDate);
      expect(result, contains('2023-12-25T14:30:45'));
    });

    test('formatToDayOfWeek formats to day name', () {
      final result = formatter.formatToDayOfWeek(testDate);
      expect(result, 'Mon');
    });

    test('formatToMonthAbbr formats to month abbreviation', () {
      final result = formatter.formatToMonthAbbr(testDate);
      expect(result, 'Dec');
    });

    test('formatToMonthFull formats to month full name', () {
      final result = formatter.formatToMonthFull(testDate);
      expect(result, 'December');
    });

    test('formatToTime12Hour formats time in 12-hour format', () {
      final result = formatter.formatToTime12Hour(testDate);
      expect(result, '2:30 PM');
    });

    test('formatToTime24Hour formats time in 24-hour format', () {
      final result = formatter.formatToTime24Hour(testDate);
      expect(result, '14:30');
    });

    test('formatToFullTime formats time with seconds', () {
      final result = formatter.formatToFullTime(testDate);
      expect(result, '14:30:45');
    });

    test('formatToYear formats to year', () {
      final result = formatter.formatToYear(testDate);
      expect(result, '2023');
    });

    test('formatToMonthYear formats to month and year', () {
      final result = formatter.formatToMonthYear(testDate);
      expect(result, 'December 2023');
    });

    test('formatToMmDdYyyy formats to MM/dd/yyyy', () {
      final result = formatter.formatToMmDdYyyy(testDate);
      expect(result, '12/25/2023');
    });

    test('formatToFullDayDate formats to full day and date', () {
      final result = formatter.formatToFullDayDate(testDate);
      expect(result, 'Monday, December 25, 2023');
    });

    test('formatToYyyyMmDdHhMm formats to yyyy-MM-dd HH:mm', () {
      final result = formatter.formatToYyyyMmDdHhMm(testDate);
      expect(result, '2023-12-25 14:30');
    });

    // String parsing and formatting tests
    test(
      'parseAndFormatDdMmYyyy parses yyyy-MM-dd and formats to dd/MM/yyyy',
      () {
        final result = formatter.parseAndFormatDdMmYyyy('2023-12-25');
        expect(result, '25/12/2023');
      },
    );

    test(
      'parseAndFormatShortDate parses yyyy-MM-dd and formats to dd MMM yyyy',
      () {
        final result = formatter.parseAndFormatShortDate('2023-12-25');
        expect(result, '25 Dec 2023');
      },
    );

    test(
      'parseAndFormatMonthAbbr parses yyyy-MM-dd and formats to month abbreviation',
      () {
        final result = formatter.parseAndFormatMonthAbbr('2023-12-25');
        expect(result, 'Dec');
      },
    );

    test(
      'parseAndFormatDayOfWeek parses yyyy-MM-dd and formats to day of week',
      () {
        final result = formatter.parseAndFormatDayOfWeek('2023-12-25');
        expect(result, 'Mon');
      },
    );

    test('parseAndFormatYear parses yyyy-MM-dd and formats to year', () {
      final result = formatter.parseAndFormatYear('2023-12-25');
      expect(result, '2023');
    });

    test(
      'parseAndFormatMonthYear parses yyyy-MM-dd and formats to month and year',
      () {
        final result = formatter.parseAndFormatMonthYear('2023-12-25');
        expect(result, 'December 2023');
      },
    );

    test(
      'parseDdMmYyyyAndFormatYyyyMmDd parses dd/MM/yyyy and formats to yyyy-MM-dd',
      () {
        final result = formatter.parseDdMmYyyyAndFormatYyyyMmDd('25/12/2023');
        expect(result, '2023-12-25');
      },
    );

    test(
      'parseDdMmYyyyAndFormatShortDate parses dd/MM/yyyy and formats to dd MMM yyyy',
      () {
        final result = formatter.parseDdMmYyyyAndFormatShortDate('25/12/2023');
        expect(result, '25 Dec 2023');
      },
    );

    test(
      'parseDdMmYyyyAndFormatMonthAbbr parses dd/MM/yyyy and formats to month abbreviation',
      () {
        final result = formatter.parseDdMmYyyyAndFormatMonthAbbr('25/12/2023');
        expect(result, 'Dec');
      },
    );

    // Error handling tests
    test('parseAndFormatDdMmYyyy throws FormatException for invalid date', () {
      expect(
        () => formatter.parseAndFormatDdMmYyyy('invalid-date'),
        throwsA(isA<FormatException>()),
      );
    });

    test(
      'parseDdMmYyyyAndFormatYyyyMmDd throws FormatException for invalid date',
      () {
        expect(
          () => formatter.parseDdMmYyyyAndFormatYyyyMmDd('invalid-date'),
          throwsA(isA<FormatException>()),
        );
      },
    );

    // Validation tests
    test('isValidYyyyMmDd returns true for valid date', () {
      expect(formatter.isValidYyyyMmDd('2023-12-25'), true);
    });

    test('isValidYyyyMmDd returns false for invalid date', () {
      expect(formatter.isValidYyyyMmDd('invalid-date'), false);
    });

    test('isValidDdMmYyyy returns true for valid date', () {
      expect(formatter.isValidDdMmYyyy('25/12/2023'), true);
    });

    test('isValidDdMmYyyy returns false for invalid date', () {
      expect(formatter.isValidDdMmYyyy('invalid-date'), false);
    });

    // Current date/time tests
    test(
      'getCurrentDateDdMmYyyy returns current date in dd/MM/yyyy format',
      () {
        final result = formatter.getCurrentDateDdMmYyyy();
        expect(result, matches(r'^\d{2}/\d{2}/\d{4}$'));
      },
    );

    test(
      'getCurrentDateYyyyMmDd returns current date in yyyy-MM-dd format',
      () {
        final result = formatter.getCurrentDateYyyyMmDd();
        expect(result, matches(r'^\d{4}-\d{2}-\d{2}$'));
      },
    );

    test('getCurrentTime24Hour returns current time in HH:mm format', () {
      final result = formatter.getCurrentTime24Hour();
      expect(result, matches(r'^\d{2}:\d{2}$'));
    });

    test('getCurrentTime12Hour returns current time in h:mm a format', () {
      final result = formatter.getCurrentTime12Hour();
      expect(result, matches(r'^\d{1,2}:\d{2} (AM|PM)$'));
    });
  });

  group('DateTimeFormatting Extension', () {
    late DateTime testDate;

    setUp(() {
      testDate = DateTime(2023, 12, 25, 14, 30, 45);
    });

    test('toDdMmYyyy formats date to dd/MM/yyyy', () {
      final result = testDate.toDdMmYyyy();
      expect(result, '25/12/2023');
    });

    test('toYyyyMmDd formats date to yyyy-MM-dd', () {
      final result = testDate.toYyyyMmDd();
      expect(result, '2023-12-25');
    });

    test('toShortDate formats date to short format', () {
      final result = testDate.toShortDate();
      expect(result, '25 Dec 2023');
    });

    test('toDateWithTime formats date with time', () {
      final result = testDate.toDateWithTime();
      expect(result, '25 Dec 2023, 2:30 PM');
    });

    test('toFullDateTime formats date to full date and time', () {
      final result = testDate.toFullDateTime();
      expect(result, '2023-12-25 14:30:45');
    });

    test('toIsoWithTimezone formats date to ISO with timezone', () {
      final result = testDate.toIsoWithTimezone();
      expect(result, contains('2023-12-25T14:30:45'));
    });

    test('toDayOfWeek formats to day of week', () {
      final result = testDate.toDayOfWeek();
      expect(result, 'Mon');
    });

    test('toMonthAbbr formats to month abbreviation', () {
      final result = testDate.toMonthAbbr();
      expect(result, 'Dec');
    });

    test('toMonthFull formats to month full name', () {
      final result = testDate.toMonthFull();
      expect(result, 'December');
    });

    test('toTime12Hour formats time in 12-hour format', () {
      final result = testDate.toTime12Hour();
      expect(result, '2:30 PM');
    });

    test('toTime24Hour formats time in 24-hour format', () {
      final result = testDate.toTime24Hour();
      expect(result, '14:30');
    });

    test('toFullTime formats time with seconds', () {
      final result = testDate.toFullTime();
      expect(result, '14:30:45');
    });

    test('toYear formats to year', () {
      final result = testDate.toYear();
      expect(result, '2023');
    });

    test('toMonthYear formats to month and year', () {
      final result = testDate.toMonthYear();
      expect(result, 'December 2023');
    });

    test('toMmDdYyyy formats to MM/dd/yyyy', () {
      final result = testDate.toMmDdYyyy();
      expect(result, '12/25/2023');
    });

    test('toFullDayDate formats to full day and date', () {
      final result = testDate.toFullDayDate();
      expect(result, 'Monday, December 25, 2023');
    });

    test('toYyyyMmDdHhMm formats to yyyy-MM-dd HH:mm', () {
      final result = testDate.toYyyyMmDdHhMm();
      expect(result, '2023-12-25 14:30');
    });

    // Date utility extension tests
    test('isToday returns true for today', () {
      final today = DateTime.now();
      expect(today.isToday, true);
    });

    test('isToday returns false for other dates', () {
      expect(testDate.isToday, false);
    });

    test('isYesterday returns true for yesterday', () {
      final yesterday = DateTime.now().subtract(Duration(days: 1));
      expect(yesterday.isYesterday, true);
    });

    test('isTomorrow returns true for tomorrow', () {
      final tomorrow = DateTime.now().add(Duration(days: 1));
      expect(tomorrow.isTomorrow, true);
    });

    test('age calculates age correctly', () {
      final birthDate = DateTime(1990, 6, 15);
      final age = birthDate.age;
      expect(age, greaterThan(0));
    });

    test('quarter returns correct quarter', () {
      expect(testDate.quarter, 4); // December is in Q4
    });

    test('weekOfYear returns correct week', () {
      final week = testDate.weekOfYear;
      expect(week, greaterThan(0));
      expect(week, lessThanOrEqualTo(53));
    });

    test('startOfDay returns start of day', () {
      final startOfDay = testDate.startOfDay;
      expect(startOfDay.hour, 0);
      expect(startOfDay.minute, 0);
      expect(startOfDay.second, 0);
      expect(startOfDay.millisecond, 0);
    });

    test('endOfDay returns end of day', () {
      final endOfDay = testDate.endOfDay;
      expect(endOfDay.hour, 23);
      expect(endOfDay.minute, 59);
      expect(endOfDay.second, 59);
    });

    test('addDays adds days correctly', () {
      final result = testDate.addDays(7);
      expect(result.day, 1);
      expect(result.month, 1);
      expect(result.year, 2024);
    });

    test('subtractDays subtracts days correctly', () {
      final result = testDate.subtractDays(7);
      expect(result.day, 18);
      expect(result.month, 12);
      expect(result.year, 2023);
    });

    test('differenceInDays calculates difference correctly', () {
      final otherDate = DateTime(2023, 12, 30);
      final difference = testDate.differenceInDays(otherDate);
      expect(difference, 5);
    });
  });

  group('StringDateFormatting Extension', () {
    test(
      'parseYyyyMmDdToDdMmYyyy parses yyyy-MM-dd and formats to dd/MM/yyyy',
      () {
        final result = '2023-12-25'.parseYyyyMmDdToDdMmYyyy();
        expect(result, '25/12/2023');
      },
    );

    test(
      'parseYyyyMmDdToShortDate parses yyyy-MM-dd and formats to dd MMM yyyy',
      () {
        final result = '2023-12-25'.parseYyyyMmDdToShortDate();
        expect(result, '25 Dec 2023');
      },
    );

    test(
      'parseYyyyMmDdToMonthAbbr parses yyyy-MM-dd and formats to month abbreviation',
      () {
        final result = '2023-12-25'.parseYyyyMmDdToMonthAbbr();
        expect(result, 'Dec');
      },
    );

    test(
      'parseYyyyMmDdToDayOfWeek parses yyyy-MM-dd and formats to day of week',
      () {
        final result = '2023-12-25'.parseYyyyMmDdToDayOfWeek();
        expect(result, 'Mon');
      },
    );

    test('parseYyyyMmDdToYear parses yyyy-MM-dd and formats to year', () {
      final result = '2023-12-25'.parseYyyyMmDdToYear();
      expect(result, '2023');
    });

    test(
      'parseYyyyMmDdToMonthYear parses yyyy-MM-dd and formats to month and year',
      () {
        final result = '2023-12-25'.parseYyyyMmDdToMonthYear();
        expect(result, 'December 2023');
      },
    );

    test(
      'parseDdMmYyyyToYyyyMmDd parses dd/MM/yyyy and formats to yyyy-MM-dd',
      () {
        final result = '25/12/2023'.parseDdMmYyyyToYyyyMmDd();
        expect(result, '2023-12-25');
      },
    );

    test(
      'parseDdMmYyyyToShortDate parses dd/MM/yyyy and formats to dd MMM yyyy',
      () {
        final result = '25/12/2023'.parseDdMmYyyyToShortDate();
        expect(result, '25 Dec 2023');
      },
    );

    test(
      'parseDdMmYyyyToMonthAbbr parses dd/MM/yyyy and formats to month abbreviation',
      () {
        final result = '25/12/2023'.parseDdMmYyyyToMonthAbbr();
        expect(result, 'Dec');
      },
    );

    // String validation tests
    test('isValidYyyyMmDd returns true for valid date', () {
      expect('2023-12-25'.isValidYyyyMmDd, true);
    });

    test('isValidYyyyMmDd returns false for invalid date', () {
      expect('invalid-date'.isValidYyyyMmDd, false);
    });

    test('isValidDdMmYyyy returns true for valid date', () {
      expect('25/12/2023'.isValidDdMmYyyy, true);
    });

    test('isValidDdMmYyyy returns false for invalid date', () {
      expect('invalid-date'.isValidDdMmYyyy, false);
    });

    test('isValidMmDdYyyy returns true for valid date', () {
      expect('12/25/2023'.isValidMmDdYyyy, true);
    });

    test('isValidMmDdYyyy returns false for invalid date', () {
      expect('invalid-date'.isValidMmDdYyyy, false);
    });
  });

  group('DateUtils', () {
    test('isValidYyyyMmDd returns true for valid date', () {
      expect(DateUtils.isValidYyyyMmDd('2023-12-25'), true);
    });

    test('isValidYyyyMmDd returns false for invalid date', () {
      expect(DateUtils.isValidYyyyMmDd('invalid-date'), false);
    });

    test('isValidDdMmYyyy returns true for valid date', () {
      expect(DateUtils.isValidDdMmYyyy('25/12/2023'), true);
    });

    test('isValidDdMmYyyy returns false for invalid date', () {
      expect(DateUtils.isValidDdMmYyyy('invalid-date'), false);
    });

    test('isValidMmDdYyyy returns true for valid date', () {
      expect(DateUtils.isValidMmDdYyyy('12/25/2023'), true);
    });

    test('isValidMmDdYyyy returns false for invalid date', () {
      expect(DateUtils.isValidMmDdYyyy('invalid-date'), false);
    });

    test(
      'getCurrentDateDdMmYyyy returns current date in dd/MM/yyyy format',
      () {
        final result = DateUtils.getCurrentDateDdMmYyyy();
        expect(result, matches(r'^\d{2}/\d{2}/\d{4}$'));
      },
    );

    test(
      'getCurrentDateYyyyMmDd returns current date in yyyy-MM-dd format',
      () {
        final result = DateUtils.getCurrentDateYyyyMmDd();
        expect(result, matches(r'^\d{4}-\d{2}-\d{2}$'));
      },
    );

    test('getCurrentTime24Hour returns current time in HH:mm format', () {
      final result = DateUtils.getCurrentTime24Hour();
      expect(result, matches(r'^\d{2}:\d{2}$'));
    });

    test('getCurrentTime12Hour returns current time in h:mm a format', () {
      final result = DateUtils.getCurrentTime12Hour();
      expect(result, matches(r'^\d{1,2}:\d{2} (AM|PM)$'));
    });

    test('addDays adds days correctly', () {
      final date = DateTime(2023, 12, 25);
      final result = DateUtils.addDays(date, 7);
      expect(result.day, 1);
      expect(result.month, 1);
      expect(result.year, 2024);
    });

    test('subtractDays subtracts days correctly', () {
      final date = DateTime(2023, 12, 25);
      final result = DateUtils.subtractDays(date, 7);
      expect(result.day, 18);
      expect(result.month, 12);
      expect(result.year, 2023);
    });

    test('startOfDay returns start of day', () {
      final date = DateTime(2023, 12, 25, 14, 30, 45);
      final result = DateUtils.startOfDay(date);
      expect(result.hour, 0);
      expect(result.minute, 0);
      expect(result.second, 0);
      expect(result.millisecond, 0);
    });

    test('endOfDay returns end of day', () {
      final date = DateTime(2023, 12, 25, 14, 30, 45);
      final result = DateUtils.endOfDay(date);
      expect(result.hour, 23);
      expect(result.minute, 59);
      expect(result.second, 59);
    });

    test('isToday returns true for today', () {
      final today = DateTime.now();
      expect(DateUtils.isToday(today), true);
    });

    test('isToday returns false for other dates', () {
      final otherDate = DateTime(2023, 12, 25);
      expect(DateUtils.isToday(otherDate), false);
    });

    test('isYesterday returns true for yesterday', () {
      final yesterday = DateTime.now().subtract(Duration(days: 1));
      expect(DateUtils.isYesterday(yesterday), true);
    });

    test('isTomorrow returns true for tomorrow', () {
      final tomorrow = DateTime.now().add(Duration(days: 1));
      expect(DateUtils.isTomorrow(tomorrow), true);
    });

    test('differenceInDays calculates difference correctly', () {
      final date1 = DateTime(2023, 12, 25);
      final date2 = DateTime(2023, 12, 30);
      final difference = DateUtils.differenceInDays(date2, date1);
      expect(difference, 5);
    });

    test('getAge calculates age correctly', () {
      final birthDate = DateTime(1990, 6, 15);
      final age = DateUtils.getAge(birthDate);
      expect(age, greaterThan(0));
    });

    test('isLeapYear returns true for leap year', () {
      expect(DateUtils.isLeapYear(2024), true);
    });

    test('isLeapYear returns false for non-leap year', () {
      expect(DateUtils.isLeapYear(2023), false);
    });

    test('daysInMonth returns correct days for February in leap year', () {
      expect(DateUtils.daysInMonth(2024, 2), 29);
    });

    test('daysInMonth returns correct days for February in non-leap year', () {
      expect(DateUtils.daysInMonth(2023, 2), 28);
    });

    test('getQuarter returns correct quarter', () {
      final date = DateTime(2023, 12, 25);
      expect(DateUtils.getQuarter(date), 4);
    });

    test('getWeekOfYear returns correct week', () {
      final date = DateTime(2023, 12, 25);
      final week = DateUtils.getWeekOfYear(date);
      expect(week, greaterThan(0));
      expect(week, lessThanOrEqualTo(53));
    });
  });
}
