import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
String formatTimeStamp(Timestamp timestamp){

  return DateFormat('dd/MM/yyyy, hh:mm a').format(timestamp.toDate());
}

String formatDateOnly(Timestamp timestamp){

  return DateFormat('d MMM yyyy ').format(timestamp.toDate());
}


String formatUtc(String timestamp){
  DateTime datetime=DateTime.parse(timestamp).toLocal();
  return DateFormat('dd/MM/yyyy, hh:mm a').format(datetime);
}


String formatDate(DateTime datetime){
  return DateFormat('dd/MM/yyyy, hh:mm a').format(datetime);
}