import 'package:intl/intl.dart';

class DateHelper{

  static String formatDate(String date){
    if(date.isEmpty){
      return date;
    }
    DateTime dateTime = DateTime.parse(date).toLocal();

    String formattedDate = DateFormat('EEE, MMM dd, yyyy').format(dateTime);
    return formattedDate;
  }
}