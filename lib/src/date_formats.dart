import 'package:intl/intl.dart';

/// Collection of commonly used date format patterns
class DateFormats {
  // Core Date Formats
  static const String ddMMyyyy = "dd/MM/yyyy";
  static const String yyyyMMdd = "yyyy-MM-dd";
  static const String ddMMMyyyy = "dd MMM yyyy";
  static const String ddMMMyyyyHmma = "dd MMM yyyy, h:mm a";
  static const String yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";
  static const String yyyyMMddTHHmmssZ = "yyyy-MM-dd'T'HH:mm:ssZ";
  static const String yyyyMMddHHmmssZ = "yyyy-MM-dd HH:mm:ssZ";

  // Time Formats
  static const String hmma = "h:mm a";
  static const String HHmm = "HH:mm";
  static const String HHmmss = "HH:mm:ss";

  // Component Formats
  static const String dayE = "E";
  static const String monthMMM = "MMM";
  static const String monthMMMM = "MMMM";
  static const String yearY = "y";

  // Additional Common Formats
  static const String MMddyyyy = "MM/dd/yyyy";
  static const String EEEEMMMMdyyyy = "EEEE, MMMM d, yyyy";
  static const String yyyyMMddHHmm = "yyyy-MM-dd HH:mm";

  // Short Formats
  static const String ddMMyy = "dd/MM/yy";
  static const String MMddyy = "MM/dd/yy";
  static const String yyyyMMddSlash = "yyyy/MM/dd";
  static const String ddMMyyyyDash = "dd-MM-yyyy";

  // Extended Formats
  static const String yyyyMMddHHmmssSSS = "yyyy-MM-dd HH:mm:ss.SSS";
  static const String EEEEdMMMMyyyy = "EEEE, d MMMM yyyy";
  static const String dMMMMyyyy = "d MMMM yyyy";
  static const String MMMMdyyyy = "MMMM d, yyyy";
  static const String MMMdyyyy = "MMM d, yyyy";
  static const String ddMMyyyyHHmm = "dd/MM/yyyy HH:mm";
  static const String ddMMyyyyhmma = "dd/MM/yyyy h:mm a";
  static const String yyyyMMddTHHmmss = "yyyy-MM-dd'T'HH:mm:ss";
  static const String yyyyMMddTHHmmssSSS = "yyyy-MM-dd'T'HH:mm:ss.SSS";
  static const String yyyyMMddTHHmmssSSSZ = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

  // Day Formats
  static const String dayD = "d";
  static const String dayDd = "dd";
  static const String dayEE = "EE";
  static const String dayEEE = "EEE";
  static const String dayEEEE = "EEEE";
  static const String dayEEEEE = "EEEEE";
  static const String dayEEEEEE = "EEEEEE";

  // Month Formats
  static const String monthM = "M";
  static const String monthMM = "MM";
  static const String monthMMMMM = "MMMMM";

  // Year Formats
  static const String yearYy = "yy";
  static const String yearYyyy = "yyyy";

  // Time Formats
  static const String timeHmm = "H:mm";
  static const String timeHHmmssSSS = "HH:mm:ss.SSS";
  static const String timeHmmssa = "h:mm:ss a";
  static const String timeHmmss = "H:mm:ss";

  // Quarter Formats
  static const String quarterQ = "Q";
  static const String quarterQQ = "QQ";
  static const String quarterQQQ = "QQQ";
  static const String quarterQQQQ = "QQQQ";

  // Week Formats
  static const String weekW = "w";
  static const String weekWw = "ww";
  static const String weekW_ = "W";
  static const String weekWW = "WW";

  // Era Formats
  static const String eraG = "G";
  static const String eraGG = "GG";
  static const String eraGGG = "GGG";
  static const String eraGGGG = "GGGG";

  // Period Formats
  static const String periodA = "a";
  static const String periodAa = "aa";
  static const String periodAaa = "aaa";
  static const String periodAaaa = "aaaa";

  // Zone Formats
  static const String zoneZ = "z";
  static const String zoneZz = "zz";
  static const String zoneZzz = "zzz";
  static const String zoneZzzz = "zzzz";
  static const String zoneZ_ = "Z";
  static const String zoneZZ = "ZZ";
  static const String zoneZZZ = "ZZZ";
  static const String zoneZZZZ = "ZZZZ";

  // Hour Formats
  static const String hourH = "h";
  static const String hourHh = "hh";
  static const String hourH_ = "H";
  static const String hourHH = "HH";
  static const String hourK = "k";
  static const String hourKk = "kk";
  static const String hourK_ = "K";
  static const String hourKK = "KK";

  // Minute Formats
  static const String minuteM = "m";
  static const String minuteMm = "mm";

  // Second Formats
  static const String secondS = "s";
  static const String secondSs = "ss";

  // Millisecond Formats
  static const String millisecondS_ = "S";
  static const String millisecondSS = "SS";
  static const String millisecondSSS = "SSS";

  // Microsecond Formats
  static const String microsecondA = "A";

  // Nanosecond Formats
  static const String nanosecondN = "n";
  static const String nanosecondNn = "nn";
  static const String nanosecondNnn = "nnn";
  static const String nanosecondNnnnnn = "nnnnnn";
  static const String nanosecondNnnnnnnnn = "nnnnnnnnn";
}

/// Pre-configured DateFormat instances for common patterns
class DateFormatInstances {
  // Core Date Formats
  static final DateFormat ddMMyyyy = DateFormat(DateFormats.ddMMyyyy);
  static final DateFormat yyyyMMdd = DateFormat(DateFormats.yyyyMMdd);
  static final DateFormat ddMMMyyyy = DateFormat(DateFormats.ddMMMyyyy);
  static final DateFormat ddMMMyyyyHmma = DateFormat(DateFormats.ddMMMyyyyHmma);
  static final DateFormat yyyyMMddHHmmss = DateFormat(
    DateFormats.yyyyMMddHHmmss,
  );
  static final DateFormat yyyyMMddTHHmmssZ = DateFormat(
    DateFormats.yyyyMMddTHHmmssZ,
  );
  static final DateFormat yyyyMMddHHmmssZ = DateFormat(
    DateFormats.yyyyMMddHHmmssZ,
  );

  // Time Formats
  static final DateFormat hmma = DateFormat(DateFormats.hmma);
  static final DateFormat HHmm = DateFormat(DateFormats.HHmm);
  static final DateFormat HHmmss = DateFormat(DateFormats.HHmmss);

  // Component Formats
  static final DateFormat dayE = DateFormat(DateFormats.dayE);
  static final DateFormat monthMMM = DateFormat(DateFormats.monthMMM);
  static final DateFormat monthMMMM = DateFormat(DateFormats.monthMMMM);
  static final DateFormat yearY = DateFormat(DateFormats.yearY);

  // Additional Common Formats
  static final DateFormat MMddyyyy = DateFormat(DateFormats.MMddyyyy);
  static final DateFormat EEEEMMMMdyyyy = DateFormat(DateFormats.EEEEMMMMdyyyy);
  static final DateFormat yyyyMMddHHmm = DateFormat(DateFormats.yyyyMMddHHmm);
}
