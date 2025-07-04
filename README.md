# Date Formater

A Flutter package that provides easy-to-use date formatting utilities using the [intl](https://pub.dev/packages/intl) package. This package offers a comprehensive set of date formatting methods, extension methods, and utility functions for DateTime objects.

## ✨ Features

- 🗓️ **Multiple Date Formats**: Support for various date formats including dd/MM/yyyy, yyyy-MM-dd, ISO formats, and more
- ⏰ **Time Formatting**: Format time in 12-hour and 24-hour formats
- 🔧 **Extension Methods**: Convenient extension methods for DateTime objects
- 📱 **Flutter Ready**: Built specifically for Flutter applications
- 🧪 **Well Tested**: Comprehensive test coverage
- 📚 **Well Documented**: Clear documentation and examples
- ⚡ **Performance Optimized**: Singleton pattern for better performance
- 🛡️ **Error Handling**: Proper error handling for date parsing operations
- 🛠️ **Utility Functions**: Date manipulation and validation utilities

## 🚀 Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  date_formater: ^0.0.1
```

You'll also need to add the `intl` package as a dependency:

```yaml
dependencies:
  intl: ^0.20.2
```

## 📁 File Structure

The package is organized into a modular structure for better maintainability:

```
lib/
├── date_formater.dart              # Main entry point (exports all components)
└── src/
    ├── date_format_service.dart    # DateFormatService class with singleton pattern
    ├── date_time_extensions.dart   # DateTime extension methods
    ├── string_date_extensions.dart # String extension methods for date parsing
    ├── date_formats.dart          # DateFormat instances and patterns
    └── date_utils.dart            # Utility functions for date operations
```

This structure provides:
- **Better Organization**: Each file has a specific responsibility
- **Easier Maintenance**: Changes to specific functionality are isolated
- **Improved Readability**: Smaller, focused files are easier to understand
- **Better Testing**: Individual components can be tested separately

## 📖 Usage

> **💡 Tip**: Check out the [example app](example_app/) for a comprehensive demonstration of all features with a beautiful UI!
> 
> **🚀 Quick Start**: Run `./run_example.sh` to launch the example app directly!

```dart
import 'package:date_formater/date_formater.dart';

void main() {
  // Using the singleton instance (recommended for better performance)
  final formatted = DateFormatService.instance.formatToDdMmYyyy(DateTime.now());
  print(formatted); // "25/12/2023"
  
  // Or create a new instance (backward compatibility)
  final formatter = DateFormatService();
  final date = DateTime(2023, 12, 25, 14, 30, 45);
  
  // Basic date formatting
  print(formatter.formatToDdMmYyyy(date)); // "25/12/2023"
  print(formatter.formatToYyyyMmDd(date)); // "2023-12-25"
  print(formatter.formatToShortDate(date)); // "25 Dec 2023"
  
  // Date with time
  print(formatter.formatToDateWithTime(date)); // "25 Dec 2023, 2:30 PM"
  print(formatter.formatToFullDateTime(date)); // "2023-12-25 14:30:45"
  
  // Time formatting
  print(formatter.formatToTime12Hour(date)); // "2:30 PM"
  print(formatter.formatToTime24Hour(date)); // "14:30"
  
  // Other formats
  print(formatter.formatToDayOfWeek(date)); // "Mon"
  print(formatter.formatToMonthYear(date)); // "December 2023"
}
```

### Using Extension Methods (Most Convenient)

```dart
import 'package:date_formater/date_formater.dart';

void main() {
  final date = DateTime(2023, 12, 25, 14, 30, 45);
  
  // Extension methods make formatting even easier
  print(date.toDdMmYyyy()); // "25/12/2023"
  print(date.toYyyyMmDd()); // "2023-12-25"
  print(date.toShortDate()); // "25 Dec 2023"
  print(date.toDateWithTime()); // "25 Dec 2023, 2:30 PM"
  print(date.toTime12Hour()); // "2:30 PM"
  print(date.toTime24Hour()); // "14:30"
  print(date.toMonthYear()); // "December 2023"
  
  // Date utility extensions
  print(date.isToday); // false
  print(date.isYesterday); // false
  print(date.isTomorrow); // false
  print(date.age); // 0 (if date is today)
  print(date.quarter); // 4
  print(date.weekOfYear); // 52
  
  // Date manipulation
  final tomorrow = date.addDays(1);
  final yesterday = date.subtractDays(1);
  final daysDiff = date.differenceInDays(DateTime.now());
  
  // Date boundaries
  print(date.startOfDay); // 2023-12-25 00:00:00.000
  print(date.endOfDay); // 2023-12-25 23:59:59.000
  print(date.startOfWeek); // 2023-12-25 00:00:00.000 (Monday)
  print(date.endOfWeek); // 2023-12-31 00:00:00.000 (Sunday)
  print(date.startOfMonth); // 2023-12-01 00:00:00.000
  print(date.endOfMonth); // 2023-12-31 00:00:00.000
}
```

### Using String Date Parsing and Formatting

```dart
import 'package:date_formater/date_formater.dart';

void main() {
  final formatter = DateFormatService.instance;
  
  // Parse yyyy-MM-dd strings and format them
  print(formatter.parseAndFormatDdMmYyyy('2023-12-25')); // "25/12/2023"
  print(formatter.parseAndFormatShortDate('2023-12-25')); // "25 Dec 2023"
  print(formatter.parseAndFormatMonthAbbr('2023-12-25')); // "Dec"
  print(formatter.parseAndFormatDayOfWeek('2023-12-25')); // "Mon"
  print(formatter.parseAndFormatYear('2023-12-25')); // "2023"
  print(formatter.parseAndFormatMonthYear('2023-12-25')); // "December 2023"
  
  // Parse dd/MM/yyyy strings and format them
  print(formatter.parseDdMmYyyyAndFormatYyyyMmDd('25/12/2023')); // "2023-12-25"
  print(formatter.parseDdMmYyyyAndFormatShortDate('25/12/2023')); // "25 Dec 2023"
  print(formatter.parseDdMmYyyyAndFormatMonthAbbr('25/12/2023')); // "Dec"
  
  // Using string extension methods
  print('2023-12-25'.parseYyyyMmDdToDdMmYyyy()); // "25/12/2023"
  print('2023-12-25'.parseYyyyMmDdToShortDate()); // "25 Dec 2023"
  print('2023-12-25'.parseYyyyMmDdToMonthAbbr()); // "Dec"
  print('25/12/2023'.parseDdMmYyyyToYyyyMmDd()); // "2023-12-25"
  print('25/12/2023'.parseDdMmYyyyToShortDate()); // "25 Dec 2023"
  
  // String validation
  print('2023-12-25'.isValidYyyyMmDd); // true
  print('25/12/2023'.isValidDdMmYyyy); // true
  print('12/25/2023'.isValidMmDdYyyy); // true
  print('invalid-date'.isValidYyyyMmDd); // false
}
```

### Using DateUtils for Advanced Operations

```dart
import 'package:date_formater/date_formater.dart';

void main() {
  // Current date and time utilities
  print(DateUtils.getCurrentDateDdMmYyyy()); // "25/12/2023"
  print(DateUtils.getCurrentDateYyyyMmDd()); // "2023-12-25"
  print(DateUtils.getCurrentTime24Hour()); // "14:30"
  print(DateUtils.getCurrentTime12Hour()); // "2:30 PM"
  
  // Date validation
  print(DateUtils.isValidYyyyMmDd('2023-12-25')); // true
  print(DateUtils.isValidDdMmYyyy('25/12/2023')); // true
  print(DateUtils.isValidMmDdYyyy('12/25/2023')); // true
  
  // Date manipulation
  final date = DateTime(2023, 12, 25);
  print(DateUtils.addDays(date, 7)); // 2024-01-01
  print(DateUtils.subtractDays(date, 7)); // 2023-12-18
  
  // Date boundaries
  print(DateUtils.startOfDay(date)); // 2023-12-25 00:00:00.000
  print(DateUtils.endOfDay(date)); // 2023-12-25 23:59:59.000
  print(DateUtils.startOfWeek(date)); // 2023-12-25 00:00:00.000 (Monday)
  print(DateUtils.endOfWeek(date)); // 2023-12-31 00:00:00.000 (Sunday)
  print(DateUtils.startOfMonth(date)); // 2023-12-01 00:00:00.000
  print(DateUtils.endOfMonth(date)); // 2023-12-31 00:00:00.000
  
  // Date comparisons
  print(DateUtils.isToday(date)); // false
  print(DateUtils.isYesterday(date)); // false
  print(DateUtils.isTomorrow(date)); // false
  
  // Date differences
  final otherDate = DateTime(2023, 12, 30);
  print(DateUtils.differenceInDays(otherDate, date)); // 5
  print(DateUtils.differenceInHours(otherDate, date)); // 120
  print(DateUtils.differenceInMinutes(otherDate, date)); // 7200
  
  // Age calculation
  final birthDate = DateTime(1990, 6, 15);
  print(DateUtils.getAge(birthDate)); // 33
  
  // Calendar utilities
  print(DateUtils.isLeapYear(2024)); // true
  print(DateUtils.daysInMonth(2023, 2)); // 28
  print(DateUtils.getQuarter(date)); // 4
  print(DateUtils.getWeekOfYear(date)); // 52
}
```

### Error Handling

```dart
import 'package:date_formater/date_formater.dart';

void main() {
  try {
    // This will throw a FormatException
    final result = DateFormatService.instance.parseAndFormatDdMmYyyy('invalid-date');
  } catch (e) {
    print('Error: $e'); // Error: FormatException: Invalid date format. Expected yyyy-MM-dd, got: invalid-date
  }
  
  // Safe validation
  if ('2023-12-25'.isValidYyyyMmDd) {
    final result = DateFormatService.instance.parseAndFormatDdMmYyyy('2023-12-25');
    print(result); // "25/12/2023"
  }
}
```

## 📋 Available Format Methods

### DateFormatService Methods

| Method | Format | Example Output |
|--------|--------|----------------|
| `formatToDdMmYyyy()` | dd/MM/yyyy | "25/12/2023" |
| `formatToYyyyMmDd()` | yyyy-MM-dd | "2023-12-25" |
| `formatToShortDate()` | dd MMM yyyy | "25 Dec 2023" |
| `formatToDateWithTime()` | dd MMM yyyy, h:mm a | "25 Dec 2023, 2:30 PM" |
| `formatToFullDateTime()` | yyyy-MM-dd HH:mm:ss | "2023-12-25 14:30:45" |
| `formatToIsoWithTimezone()` | yyyy-MM-dd'T'HH:mm:ssZ | "2023-12-25T14:30:00+00:00" |
| `formatToTime12Hour()` | h:mm a | "2:30 PM" |
| `formatToTime24Hour()` | HH:mm | "14:30" |
| `formatToFullTime()` | HH:mm:ss | "14:30:45" |
| `formatToDayOfWeek()` | E | "Mon" |
| `formatToMonthAbbr()` | MMM | "Dec" |
| `formatToMonthFull()` | MMMM | "December" |
| `formatToYear()` | y | "2023" |
| `formatToMonthYear()` | MMMM yyyy | "December 2023" |
| `formatToMmDdYyyy()` | MM/dd/yyyy | "12/25/2023" |
| `formatToFullDayDate()` | EEEE, MMMM d, yyyy | "Monday, December 25, 2023" |
| `formatToYyyyMmDdHhMm()` | yyyy-MM-dd HH:mm | "2023-12-25 14:30" |

### String Parsing Methods (DateFormatService)

| Method | Input Format | Output Format | Example |
|--------|--------------|---------------|---------|
| `parseAndFormatDdMmYyyy()` | yyyy-MM-dd | dd/MM/yyyy | "2023-12-25" → "25/12/2023" |
| `parseAndFormatShortDate()` | yyyy-MM-dd | dd MMM yyyy | "2023-12-25" → "25 Dec 2023" |
| `parseAndFormatMonthAbbr()` | yyyy-MM-dd | MMM | "2023-12-25" → "Dec" |
| `parseAndFormatDayOfWeek()` | yyyy-MM-dd | E | "2023-12-25" → "Mon" |
| `parseAndFormatYear()` | yyyy-MM-dd | y | "2023-12-25" → "2023" |
| `parseAndFormatMonthYear()` | yyyy-MM-dd | MMMM yyyy | "2023-12-25" → "December 2023" |
| `parseDdMmYyyyAndFormatYyyyMmDd()` | dd/MM/yyyy | yyyy-MM-dd | "25/12/2023" → "2023-12-25" |
| `parseDdMmYyyyAndFormatShortDate()` | dd/MM/yyyy | dd MMM yyyy | "25/12/2023" → "25 Dec 2023" |
| `parseDdMmYyyyAndFormatMonthAbbr()` | dd/MM/yyyy | MMM | "25/12/2023" → "Dec" |

### Extension Methods

| Method | Format | Example Output |
|--------|--------|----------------|
| `toDdMmYyyy()` | dd/MM/yyyy | "25/12/2023" |
| `toYyyyMmDd()` | yyyy-MM-dd | "2023-12-25" |
| `toShortDate()` | dd MMM yyyy | "25 Dec 2023" |
| `toDateWithTime()` | dd MMM yyyy, h:mm a | "25 Dec 2023, 2:30 PM" |
| `toFullDateTime()` | yyyy-MM-dd HH:mm:ss | "2023-12-25 14:30:45" |
| `toIsoWithTimezone()` | yyyy-MM-dd'T'HH:mm:ssZ | "2023-12-25T14:30:00+00:00" |
| `toTime12Hour()` | h:mm a | "2:30 PM" |
| `toTime24Hour()` | HH:mm | "14:30" |
| `toFullTime()` | HH:mm:ss | "14:30:45" |
| `toDayOfWeek()` | E | "Mon" |
| `toMonthAbbr()` | MMM | "Dec" |
| `toMonthFull()` | MMMM | "December" |
| `toYear()` | y | "2023" |
| `toMonthYear()` | MMMM yyyy | "December 2023" |
| `toMmDdYyyy()` | MM/dd/yyyy | "12/25/2023" |
| `toFullDayDate()` | EEEE, MMMM d, yyyy | "Monday, December 25, 2023" |
| `toYyyyMmDdHhMm()` | yyyy-MM-dd HH:mm | "2023-12-25 14:30" |

### String Extension Methods

| Method | Input Format | Output Format | Example |
|--------|--------------|---------------|---------|
| `parseYyyyMmDdToDdMmYyyy()` | yyyy-MM-dd | dd/MM/yyyy | "2023-12-25" → "25/12/2023" |
| `parseYyyyMmDdToShortDate()` | yyyy-MM-dd | dd MMM yyyy | "2023-12-25" → "25 Dec 2023" |
| `parseYyyyMmDdToMonthAbbr()` | yyyy-MM-dd | MMM | "2023-12-25" → "Dec" |
| `parseYyyyMmDdToDayOfWeek()` | yyyy-MM-dd | E | "2023-12-25" → "Mon" |
| `parseYyyyMmDdToYear()` | yyyy-MM-dd | y | "2023-12-25" → "2023" |
| `parseYyyyMmDdToMonthYear()` | yyyy-MM-dd | MMMM yyyy | "2023-12-25" → "December 2023" |
| `parseDdMmYyyyToYyyyMmDd()` | dd/MM/yyyy | yyyy-MM-dd | "25/12/2023" → "2023-12-25" |
| `parseDdMmYyyyToShortDate()` | dd/MM/yyyy | dd MMM yyyy | "25/12/2023" → "25 Dec 2023" |
| `parseDdMmYyyyToMonthAbbr()` | dd/MM/yyyy | MMM | "25/12/2023" → "Dec" |
| `isValidYyyyMmDd` | - | bool | "2023-12-25" → true |
| `isValidDdMmYyyy` | - | bool | "25/12/2023" → true |
| `isValidMmDdYyyy` | - | bool | "12/25/2023" → true |

### DateTime Extension Properties

| Property | Type | Description | Example |
|----------|------|-------------|---------|
| `isToday` | bool | Checks if date is today | `date.isToday` |
| `isYesterday` | bool | Checks if date is yesterday | `date.isYesterday` |
| `isTomorrow` | bool | Checks if date is tomorrow | `date.isTomorrow` |
| `age` | int | Gets age from birth date | `birthDate.age` |
| `quarter` | int | Gets quarter of year | `date.quarter` |
| `weekOfYear` | int | Gets week of year | `date.weekOfYear` |
| `startOfDay` | DateTime | Start of day (00:00:00) | `date.startOfDay` |
| `endOfDay` | DateTime | End of day (23:59:59) | `date.endOfDay` |
| `startOfWeek` | DateTime | Start of week (Monday) | `date.startOfWeek` |
| `endOfWeek` | DateTime | End of week (Sunday) | `date.endOfWeek` |
| `startOfMonth` | DateTime | Start of month | `date.startOfMonth` |
| `endOfMonth` | DateTime | End of month | `date.endOfMonth` |
| `startOfYear` | DateTime | Start of year | `date.startOfYear` |
| `endOfYear` | DateTime | End of year | `date.endOfYear` |

### DateTime Extension Methods

| Method | Description | Example |
|--------|-------------|---------|
| `addDays(int days)` | Adds days to date | `date.addDays(7)` |
| `subtractDays(int days)` | Subtracts days from date | `date.subtractDays(7)` |
| `differenceInDays(DateTime other)` | Days difference | `date.differenceInDays(other)` |
| `differenceInHours(DateTime other)` | Hours difference | `date.differenceInHours(other)` |
| `differenceInMinutes(DateTime other)` | Minutes difference | `date.differenceInMinutes(other)` |

## 🏗️ Architecture

The package is organized into several modules for better maintainability:

- **`date_formater.dart`**: Main entry point with DateFormatService and extensions
- **`src/date_formats.dart`**: Date format patterns and pre-configured DateFormat instances
- **`src/date_utils.dart`**: Utility functions for date manipulation and validation

## 🔧 Performance Optimizations

- **Singleton Pattern**: DateFormatService uses a singleton pattern to avoid creating multiple instances
- **Pre-configured Formats**: DateFormat instances are pre-configured for better performance
- **Extension Methods**: Use the singleton instance internally for optimal performance

## 🛡️ Error Handling

The package provides comprehensive error handling:

- **FormatException**: Thrown when parsing invalid date strings
- **Validation Methods**: Safe validation methods to check date format validity
- **Try-Catch Support**: All parsing methods support try-catch error handling

## 📚 Additional information

This package is built on top of the [intl](https://pub.dev/packages/intl) package, which provides internationalization and localization facilities for Dart and Flutter applications.

### Dependencies

- `intl: ^0.20.2` - For date formatting functionality
- `flutter: ">=1.17.0"` - Flutter framework

### Contributing

Feel free to contribute to this package by:
1. Forking the repository
2. Creating a feature branch
3. Making your changes
4. Adding tests
5. Submitting a pull request

### License

This package is licensed under the BSD-3-Clause license.
