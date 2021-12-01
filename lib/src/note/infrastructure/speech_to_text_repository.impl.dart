
part of './speech_to_text_repository.dart';

/// A service that generates Text from speech
class SpeechToTextRepositoryImpl implements SpeechToTextRepository {
  static final SpeechToTextRepositoryImpl instance = SpeechToTextRepositoryImpl._init();
  static SpeechToText? _speechToText;
  static bool _hasSpeech = false;

  // TODO: Check if this creates a memory leak - should be closed when disposing note_cubit
  var errors = StreamController<SpeechRecognitionError>.broadcast();
  var statuses = BehaviorSubject<String>();
  var words = StreamController<SpeechRecognitionResult>.broadcast();

  var _localeId = '';

  SpeechToTextRepositoryImpl._init();

  Future<SpeechToText> get speechToText async {
    if (_speechToText != null) return _speechToText!;

    await _initSpeech();
    return _speechToText!;
  }

  /// This has to happen only once per app
  Future<void> _initSpeech() async {
    _speechToText = SpeechToText();
    _hasSpeech = await _speechToText!.initialize(
      onError: errorListener,
      onStatus: statusListener,
    );

    if (_hasSpeech) {
      // transcribing language is set to system language
      var systemLocale = await _speechToText!.systemLocale();
      if (null != systemLocale) {
        _localeId = systemLocale.localeId;
      } else {
        _localeId = 'en_EN';
      }

      _localeId = systemLocale!.localeId;
    }
  }

  /// Each time to start a speech recognition session
  @override
  Future<void> startListening() async {
    final stt = await instance.speechToText;
    stt.stop();
    stt.listen(
        onResult: resultListener,
        listenFor: const Duration(minutes: 1),
        localeId: _localeId,
        onSoundLevelChange: null,
        cancelOnError: true,
        partialResults: true);
  }

  @override
  void errorListener(SpeechRecognitionError error) {
    errors.add(error);
  }

  @override
  void statusListener(String status) {
    statuses.add(status);
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  @override
  void resultListener(SpeechRecognitionResult result) {
    words.add(result);
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  @override
  Future<void> stopListening() async {
    final stt = await instance.speechToText;
    stt.stop();
  }

  @override
  Future<void> cancelListening() async {
    final stt = await instance.speechToText;
    stt.cancel();
  }
}