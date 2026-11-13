/// SAFENAV CAVITE - Voice Guidance Service
///
/// Provides text-to-speech for turn-by-turn navigation instructions.
library;

import 'package:flutter_tts/flutter_tts.dart';

import '../models/navigation_models.dart';
import 'package:safenav_cavite/src/core/errors/result.dart' show Result, Success, FailureResult;
import 'package:safenav_cavite/src/core/errors/failures.dart';

/// Voice guidance service using flutter_tts
class VoiceGuidanceService {
  VoiceGuidanceService._internal();
  static final VoiceGuidanceService _instance = VoiceGuidanceService._internal();
  static VoiceGuidanceService get instance => _instance;

  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;
  bool _isEnabled = true;
  String _language = 'en-US';
  double _speechRate = 0.5;
  double _volume = 1.0;
  double _pitch = 1.0;

  /// Initialize the TTS engine
  Future<Result<void>> initialize() async {
    if (_isInitialized) return Success(null);

    try {
      await _flutterTts.setLanguage(_language);
      await _flutterTts.setSpeechRate(_speechRate);
      await _flutterTts.setVolume(_volume);
      await _flutterTts.setPitch(_pitch);

      // Set handler for completion
      _flutterTts.setCompletionHandler(() {
        // Speech completed
      });

      // Set handler for errors
      _flutterTts.setErrorHandler((msg) {
        // Handle TTS error
      });

      _isInitialized = true;
      return Success(null);
    } catch (e) {
      return FailureResult(VoiceGuidanceInitializationFailure(message: e.toString()));
    }
  }

  /// Enable or disable voice guidance
  void setEnabled(bool enabled) {
    _isEnabled = enabled;
  }

  bool get isEnabled => _isEnabled;

  /// Set language (e.g., 'en-US', 'fil-PH', 'es-ES')
  Future<void> setLanguage(String language) async {
    _language = language;
    if (_isInitialized) {
      await _flutterTts.setLanguage(_language);
    }
  }

  /// Set speech rate (0.0 - 1.0)
  Future<void> setSpeechRate(double rate) async {
    _speechRate = rate.clamp(0.0, 1.0);
    if (_isInitialized) {
      await _flutterTts.setSpeechRate(_speechRate);
    }
  }

  /// Set volume (0.0 - 1.0)
  Future<void> setVolume(double volume) async {
    _volume = volume.clamp(0.0, 1.0);
    if (_isInitialized) {
      await _flutterTts.setVolume(_volume);
    }
  }

  /// Set pitch (0.5 - 2.0)
  Future<void> setPitch(double pitch) async {
    _pitch = pitch.clamp(0.5, 2.0);
    if (_isInitialized) {
      await _flutterTts.setPitch(_pitch);
    }
  }

  /// Speak a navigation instruction
  Future<Result<void>> speakInstruction(NavigationInstruction instruction) async {
    if (!_isEnabled) return Success(null);
    if (!_isInitialized) {
      final initResult = await initialize();
      if (initResult.isFailure) return initResult;
    }

    final text = _instructionToSpeech(instruction);
    if (text.isEmpty) return Success(null);

    try {
      await _flutterTts.speak(text);
      return Success(null);
    } catch (e) {
      return FailureResult(VoiceGuidanceSpeakFailure(message: e.toString()));
    }
  }

  /// Speak custom text
  Future<Result<void>> speak(String text) async {
    if (!_isEnabled) return Success(null);
    if (!_isInitialized) {
      final initResult = await initialize();
      if (initResult.isFailure) return initResult;
    }

    try {
      await _flutterTts.speak(text);
      return Success(null);
    } catch (e) {
      return FailureResult(VoiceGuidanceSpeakFailure(message: e.toString()));
    }
  }

  /// Stop current speech
  Future<void> stop() async {
    await _flutterTts.stop();
  }

  /// Convert navigation instruction to natural speech text
  String _instructionToSpeech(NavigationInstruction instruction) {
    final distance = instruction.distanceToNext;
    final distanceText = _formatDistance(distance);
    final roadName = (instruction.roadName ?? '').isNotEmpty ? ' on ${instruction.roadName}' : '';

    final baseInstruction = instruction.type.when(
      start: () => 'Start navigation$roadName',
      continueStraight: () => 'Continue straight for $distanceText$roadName',
      turnLeft: () => 'Turn left in $distanceText$roadName',
      turnRight: () => 'Turn right in $distanceText$roadName',
      turnSlightLeft: () => 'Turn slightly left in $distanceText$roadName',
      turnSlightRight: () => 'Turn slightly right in $distanceText$roadName',
      uturn: () => 'Make a U-turn in $distanceText$roadName',
      arrive: () => 'You have arrived at your destination',
      enterBuilding: () => 'Enter ${(instruction.roadName ?? '').isNotEmpty ? instruction.roadName! : 'the building'}',
      exitBuilding: () => 'Exit the building',
    );

    // Add distance context for turns
    if (distance < 50) {
      return '$baseInstruction, then immediately ${_getNextInstructionHint(instruction)}';
    } else if (distance < 100) {
      return '$baseInstruction, then ${_getNextInstructionHint(instruction)}';
    }

    return baseInstruction;
  }

  String _formatDistance(double meters) {
    if (meters < 10) {
      return '${meters.toStringAsFixed(0)} meters';
    } else if (meters < 1000) {
      return '${meters.toStringAsFixed(0)} meters';
    } else {
      return '${(meters / 1000).toStringAsFixed(1)} kilometers';
    }
  }

  String _getNextInstructionHint(NavigationInstruction instruction) {
    // This would need access to the next instruction
    // For now, return empty - the next instruction will be spoken separately
    return '';
  }

  /// Speak a full route summary
  Future<Result<void>> speakRouteSummary(NavigationRoute route) async {
    if (!_isEnabled) return Success(null);
    if (!_isInitialized) {
      final initResult = await initialize();
      if (initResult.isFailure) return initResult;
    }

    final distanceText = _formatDistance(route.totalDistance);
    final durationText = _formatDuration(route.estimatedDuration);
    final instructionCount = route.instructions.length;

    final text =
        'Route calculated. Total distance: $distanceText. Estimated time: $durationText. $instructionCount turns.';

    try {
      await _flutterTts.speak(text);
      return Success(null);
    } catch (e) {
      return FailureResult(VoiceGuidanceSpeakFailure(message: e.toString()));
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    if (minutes < 60) {
      return '$minutes minutes';
    } else {
      final hours = minutes ~/ 60;
      final remainingMinutes = minutes % 60;
      if (remainingMinutes == 0) {
        return '$hours hour${hours > 1 ? 's' : ''}';
      }
      return '$hours hour${hours > 1 ? 's' : ''} $remainingMinutes minutes';
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    await _flutterTts.stop();
    _isInitialized = false;
  }
}

/// Voice guidance failures
class VoiceGuidanceInitializationFailure extends Failure {
  const VoiceGuidanceInitializationFailure({
    required super.message,
    super.code,
    super.details,
  });
}

class VoiceGuidanceSpeakFailure extends Failure {
  const VoiceGuidanceSpeakFailure({
    required super.message,
    super.code,
    super.details,
  });
}

class VoiceGuidanceLanguageFailure extends Failure {
  const VoiceGuidanceLanguageFailure({
    required super.message,
    super.code,
    super.details,
  });
}