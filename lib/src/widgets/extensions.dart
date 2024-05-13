part of '../../select_range_date.dart';


extension FormatDate on String {

  String formatDate(context) {
    bool isGerman = Localizations.localeOf(context).languageCode == 'de';
    if (isGerman) {
      return formatGermanDateToDay;
    } else {
      return formatEnglishDateToDay;
    }
  }


  String get formatGermanDateToDay {
    String dateTime = this;
    String formattedDate = '';
    if (dateTime.isNotEmpty) {
      final DateTime date = DateTime.parse(dateTime);
      final String day = date.day.toString();
      final String year = date.year.toString();
      final String dayName = DateFormat('EEEE').format(date);
      // get german day name
      final String dayNameGerman = germanDayName[dayName] ?? dayName;
      final String monthName = DateFormat('MMMM').format(date);
      // get german month name
      final String monthNameGerman = germanMonthName[monthName] ?? monthName;
      formattedDate = '$dayNameGerman, $day. $monthNameGerman $year';
    }
    return formattedDate;
  }
  String get formatEnglishDateToDay {
    String dateTime = this;
    String formattedDate = '';
    if (dateTime.isNotEmpty) {
      final DateTime date = DateTime.parse(dateTime);
      final String day = date.day.toString();
      final String year = date.year.toString();
      final String dayName = DateFormat('EEEE').format(date);
      final String monthName = DateFormat('MMMM').format(date);
      formattedDate = '$dayName, $day. $monthName $year';
    }
    return formattedDate;
  }
}
