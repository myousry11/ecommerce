// Function to convert server time to local time
import 'package:jiffy/jiffy.dart';

String localizeTime(String serverTime) {
  try {
    // Parse the datetime from the database
    DateTime utcTime = DateTime.parse(serverTime); // Parse in UTC format
    DateTime localTime = utcTime.toLocal(); // Convert to local time
    // Use Jiffy.parse to create a Jiffy object
    return Jiffy.parse(localTime.toString()).fromNow(); // Display time in "time ago" format
  } catch (e) {
    return "Invalid Date"; // Handle invalid date format gracefully
  }
}