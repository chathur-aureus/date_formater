import 'package:flutter/material.dart';
import 'package:flutter_date_kit/flutter_date_kit.dart' as df;

void main() {
  runApp(const DateFormatterExampleApp());
}

class DateFormatterExampleApp extends StatelessWidget {
  const DateFormatterExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Date Kit Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DateFormatterExampleHome(),
    );
  }
}

class DateFormatterExampleHome extends StatefulWidget {
  const DateFormatterExampleHome({super.key});

  @override
  State<DateFormatterExampleHome> createState() =>
      _DateFormatterExampleHomeState();
}

class _DateFormatterExampleHomeState extends State<DateFormatterExampleHome> {
  late final DateTime sampleDate;

  /// Controller for the date input text field
  final TextEditingController _dateController = TextEditingController();

  String _parsedResult = '';

  /// Stores the validation result message
  String _validationResult = '';

  @override
  void initState() {
    super.initState();
    // Initialize with current date and time for consistent demo
    sampleDate = DateTime.now();
    // Pre-populate the text field with the sample date in yyyy-MM-dd format
    _dateController.text = sampleDate.toYyyyMmDd();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Date Kit Example'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildDateFormattingSection(),
            const SizedBox(height: 24),
            _buildTimeFormattingSection(),
            const SizedBox(height: 24),
            _buildStringParsingSection(),
            const SizedBox(height: 24),
            _buildDateTimeExtensionsSection(),
            const SizedBox(height: 24),
            _buildUtilityFunctionsSection(),
            const SizedBox(height: 24),
            _buildErrorHandlingSection(),
          ],
        ),
      ),
    );
  }

  /// Builds the header section with app title and sample date display
  Widget _buildHeader() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today,
                    color: Theme.of(context).primaryColor, size: 32),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Flutter Date Kit Package Demo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Sample Date: ${sampleDate.toFullDateTime()}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the date formatting section demonstrating various date format patterns
  Widget _buildDateFormattingSection() {
    return _buildSection(
      title: 'Date Formatting',
      icon: Icons.date_range,
      children: [
        // Demonstrates dd/MM/yyyy format (e.g., 25/12/2023)
        _buildFormatCard('dd/MM/yyyy', sampleDate.toDdMmYyyy()),
        // Demonstrates yyyy-MM-dd format (e.g., 2023-12-25)
        _buildFormatCard('yyyy-MM-dd', sampleDate.toYyyyMmDd()),
        // Demonstrates short date format (e.g., 25 Dec 2023)
        _buildFormatCard('dd MMM yyyy', sampleDate.toShortDate()),
        // Demonstrates MM/dd/yyyy format (e.g., 12/25/2023)
        _buildFormatCard('MM/dd/yyyy', sampleDate.toMmDdYyyy()),
        // Demonstrates full day date format (e.g., Monday, December 25, 2023)
        _buildFormatCard('EEEE, MMMM d, yyyy', sampleDate.toFullDayDate()),
        // Demonstrates month year format (e.g., December 2023)
        _buildFormatCard('MMMM yyyy', sampleDate.toMonthYear()),
      ],
    );
  }

  /// Builds the time formatting section demonstrating various time format patterns
  Widget _buildTimeFormattingSection() {
    return _buildSection(
      title: 'Time Formatting',
      icon: Icons.access_time,
      children: [
        // Demonstrates 12-hour time format (e.g., 2:30 PM)
        _buildFormatCard('h:mm a (12h)', sampleDate.toTime12Hour()),
        // Demonstrates 24-hour time format (e.g., 14:30)
        _buildFormatCard('HH:mm (24h)', sampleDate.toTime24Hour()),
        // Demonstrates full time with seconds (e.g., 14:30:45)
        _buildFormatCard('HH:mm:ss', sampleDate.toFullTime()),
        // Demonstrates date with time in 12-hour format
        _buildFormatCard('dd MMM yyyy, h:mm a', sampleDate.toDateWithTime()),
        // Demonstrates date with time in 24-hour format
        _buildFormatCard('yyyy-MM-dd HH:mm', sampleDate.toYyyyMmDdHhMm()),
        // Demonstrates full date and time with seconds
        _buildFormatCard('yyyy-MM-dd HH:mm:ss', sampleDate.toFullDateTime()),
      ],
    );
  }

  /// Builds the string parsing section with interactive date validation and conversion
  Widget _buildStringParsingSection() {
    return _buildSection(
      title: 'String Parsing & Validation',
      icon: Icons.text_fields,
      children: [
        // Interactive text field for date input and validation
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Enter date (yyyy-MM-dd)',
                  border: const OutlineInputBorder(),
                  helperText:
                      'Try: ${sampleDate.toYyyyMmDd()}, ${sampleDate.toDdMmYyyy()}, or invalid-date',
                ),
                onChanged: (value) {
                  _validateAndParseDate(value);
                },
              ),
              const SizedBox(height: 16),
              // Display validation result with color-coded feedback
              if (_validationResult.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _validationResult.contains('Valid')
                        ? Colors.green.shade50
                        : Colors.red.shade50,
                    border: Border.all(
                      color: _validationResult.contains('Valid')
                          ? Colors.green
                          : Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _validationResult,
                    style: TextStyle(
                      color: _validationResult.contains('Valid')
                          ? Colors.green.shade800
                          : Colors.red.shade800,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              // Display parsed result if validation is successful
              if (_parsedResult.isNotEmpty) ...[
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Parsed: $_parsedResult',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        // Examples of string-to-string date format conversions
        _buildFormatCard('${sampleDate.toYyyyMmDd()} → dd/MM/yyyy',
            sampleDate.toYyyyMmDd().parseYyyyMmDdToDdMmYyyy()),
        _buildFormatCard('${sampleDate.toYyyyMmDd()} → dd MMM yyyy',
            sampleDate.toYyyyMmDd().parseYyyyMmDdToShortDate()),
        _buildFormatCard(
            '${sampleDate.toYyyyMmDd()} → ${sampleDate.toYyyyMmDd().parseYyyyMmDdToMonthAbbr()}',
            sampleDate.toYyyyMmDd().parseYyyyMmDdToMonthAbbr()),
        _buildFormatCard('${sampleDate.toDdMmYyyy()} → yyyy-MM-dd',
            sampleDate.toDdMmYyyy().parseDdMmYyyyToYyyyMmDd()),
      ],
    );
  }

  /// Builds the DateTime extensions section demonstrating utility properties and methods
  Widget _buildDateTimeExtensionsSection() {
    // Calculate relative dates for demonstration
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));

    return _buildSection(
      title: 'DateTime Extensions & Utilities',
      icon: Icons.extension,
      children: [
        // Relative date checks
        _buildFormatCard(
            'Is Today -> ${today.toYyyyMmDd()}', sampleDate.isToday.toString()),
        _buildFormatCard('Is Yesterday -> ${yesterday.toYyyyMmDd()}',
            yesterday.isYesterday.toString()),
        _buildFormatCard('Is Tomorrow -> ${tomorrow.toYyyyMmDd()}',
            tomorrow.isTomorrow.toString()),
        // Date properties
        _buildFormatCard('Quarter', 'Q${sampleDate.quarter}'),
        _buildFormatCard('Week of Year', 'Week ${sampleDate.weekOfYear}'),
        _buildFormatCard('Age (if birth date)', '${sampleDate.age} years'),
        // Boundary calculations
        _buildFormatCard('Start of Day', sampleDate.startOfDay.toString()),
        _buildFormatCard('End of Day', sampleDate.endOfDay.toString()),
        _buildFormatCard('Start of Week', sampleDate.startOfWeek.toString()),
        _buildFormatCard('End of Week', sampleDate.endOfWeek.toString()),
        _buildFormatCard('Start of Month', sampleDate.startOfMonth.toString()),
        _buildFormatCard('End of Month', sampleDate.endOfMonth.toString()),
        // Date arithmetic
        _buildFormatCard('Add 7 days', sampleDate.addDays(7).toShortDate()),
        _buildFormatCard(
            'Subtract 7 days', sampleDate.subtractDays(7).toShortDate()),
        _buildFormatCard(
            'Days from today', '${sampleDate.differenceInDays(today)} days'),
      ],
    );
  }

  /// Builds the utility functions section demonstrating static utility methods
  Widget _buildUtilityFunctionsSection() {
    return _buildSection(
      title: 'Utility Functions',
      icon: Icons.build,
      children: [
        // Current date/time utilities
        _buildFormatCard(
            'Current Date (dd/MM/yyyy)', df.DateUtils.getCurrentDateDdMmYyyy()),
        _buildFormatCard(
            'Current Date (yyyy-MM-dd)', df.DateUtils.getCurrentDateYyyyMmDd()),
        _buildFormatCard(
            'Current Time (24h)', df.DateUtils.getCurrentTime24Hour()),
        _buildFormatCard(
            'Current Time (12h)', df.DateUtils.getCurrentTime12Hour()),
        // Leap year calculations
        _buildFormatCard(
            'Is 2024 Leap Year', df.DateUtils.isLeapYear(2024).toString()),
        _buildFormatCard(
            'Is 2023 Leap Year', df.DateUtils.isLeapYear(2023).toString()),
        // Days in month calculations
        _buildFormatCard(
            'Days in Feb 2024', df.DateUtils.daysInMonth(2024, 2).toString()),
        _buildFormatCard(
            'Days in Feb 2023', df.DateUtils.daysInMonth(2023, 2).toString()),
        // Date analysis utilities
        _buildFormatCard('Quarter of Sample Date',
            'Q${df.DateUtils.getQuarter(sampleDate)}'),
        _buildFormatCard(
            'Week of Year', 'Week ${df.DateUtils.getWeekOfYear(sampleDate)}'),
      ],
    );
  }

  /// Builds the error handling section demonstrating date validation methods
  Widget _buildErrorHandlingSection() {
    return _buildSection(
      title: 'Error Handling',
      icon: Icons.error_outline,
      children: [
        // Valid date format examples
        _buildFormatCard('Valid yyyy-MM-dd -> 2023-12-25',
            '2023-12-25'.isValidYyyyMmDd.toString()),
        _buildFormatCard('Valid dd/MM/yyyy -> 25/12/2023',
            '25/12/2023'.isValidDdMmYyyy.toString()),
        _buildFormatCard('Valid MM/dd/yyyy -> 12/25/2023',
            '12/25/2023'.isValidMmDdYyyy.toString()),
        // Invalid date format examples
        _buildFormatCard('Invalid Date -> string text',
            'string text'.isValidYyyyMmDd.toString()),
        _buildFormatCard('Empty String', ''.isValidYyyyMmDd.toString()),
        _buildFormatCard('Null String', 'null'.isValidYyyyMmDd.toString()),
      ],
    );
  }

  /// Generic section builder that creates a consistent card layout for each demo section
  ///
  /// [title] - The section title to display in the header
  /// [icon] - The icon to display next to the title
  /// [children] - List of widgets to display in the section body
  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header with colored background
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          // Section content
          ...children,
        ],
      ),
    );
  }

  /// Builds a format card displaying a label and its corresponding formatted value
  ///
  /// [label] - The description of what is being formatted
  /// [value] - The actual formatted result to display
  Widget _buildFormatCard(String label, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Validates and parses a date string entered by the user
  ///
  /// This method performs the following operations:
  /// 1. Validates the input string against supported date formats
  /// 2. Updates the validation result message
  /// 3. Attempts to parse and convert the date if valid
  /// 4. Updates the parsed result display
  ///
  /// [dateString] - The date string to validate and parse
  void _validateAndParseDate(String dateString) {
    setState(() {
      // Clear results if input is empty
      if (dateString.isEmpty) {
        _validationResult = '';
        _parsedResult = '';
        return;
      }

      // Check validation against supported formats
      bool isValid = false;
      String validationMessage = '';

      // Validate yyyy-MM-dd format (e.g., 2023-12-25)
      if (dateString.isValidYyyyMmDd) {
        isValid = true;
        validationMessage = 'Valid yyyy-MM-dd format';
      }
      // Validate dd/MM/yyyy format (e.g., 25/12/2023)
      else if (dateString.isValidDdMmYyyy) {
        isValid = true;
        validationMessage = 'Valid dd/MM/yyyy format';
      }
      // Validate MM/dd/yyyy format (e.g., 12/25/2023)
      else if (dateString.isValidMmDdYyyy) {
        isValid = true;
        validationMessage = 'Valid MM/dd/yyyy format';
      }
      // Invalid format
      else {
        validationMessage = 'Invalid date format';
      }

      _validationResult = validationMessage;

      // Parse and format the date if validation passed
      if (isValid) {
        try {
          if (dateString.isValidYyyyMmDd) {
            // Convert yyyy-MM-dd to multiple formats
            _parsedResult =
                '${dateString.parseYyyyMmDdToDdMmYyyy()} | ${dateString.parseYyyyMmDdToShortDate()} | ${dateString.parseYyyyMmDdToMonthAbbr()}';
          } else if (dateString.isValidDdMmYyyy) {
            // Convert dd/MM/yyyy to multiple formats
            _parsedResult =
                '${dateString.parseDdMmYyyyToYyyyMmDd()} | ${dateString.parseDdMmYyyyToShortDate()} | ${dateString.parseDdMmYyyyToMonthAbbr()}';
          } else {
            _parsedResult = 'Parsed successfully';
          }
        } catch (e) {
          _parsedResult = 'Error: $e';
        }
      } else {
        _parsedResult = '';
      }
    });
  }
}
