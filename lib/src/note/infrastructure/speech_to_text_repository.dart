import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_to_text_repository.impl.dart';

abstract class SpeechToTextRepository{
  void startListening();
  void errorListener(SpeechRecognitionError error);
  void statusListener(String status);
  void resultListener(SpeechRecognitionResult result);
  void stopListening();
  void cancelListening();
}