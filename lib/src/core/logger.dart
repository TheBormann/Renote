import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(
    //filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: false,
    ), // Use the PrettyPrinter to format and print log
    //output: null, // Use the default LogOutput (-> send everything to console)
  );
}