// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoteStateTearOff {
  const _$NoteStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Loading loading() {
    return const Loading();
  }

  Loaded loaded(Note note) {
    return Loaded(
      note,
    );
  }

  Listening listening(Note note, String recognizedWords, bool isFinal) {
    return Listening(
      note,
      recognizedWords,
      isFinal,
    );
  }
}

/// @nodoc
const $NoteState = _$NoteStateTearOff();

/// @nodoc
mixin _$NoteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) loaded,
    required TResult Function(Note note, String recognizedWords, bool isFinal)
        listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Listening value) listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStateCopyWith<$Res> {
  factory $NoteStateCopyWith(NoteState value, $Res Function(NoteState) then) =
      _$NoteStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteStateCopyWithImpl<$Res> implements $NoteStateCopyWith<$Res> {
  _$NoteStateCopyWithImpl(this._value, this._then);

  final NoteState _value;
  // ignore: unused_field
  final $Res Function(NoteState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$NoteStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'NoteState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) loaded,
    required TResult Function(Note note, String recognizedWords, bool isFinal)
        listening,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Listening value) listening,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements NoteState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$NoteStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'NoteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) loaded,
    required TResult Function(Note note, String recognizedWords, bool isFinal)
        listening,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Listening value) listening,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements NoteState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({Note note});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> extends _$NoteStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object? note = freezed,
  }) {
    return _then(Loaded(
      note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
    ));
  }
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded(this.note);

  @override
  final Note note;

  @override
  String toString() {
    return 'NoteState.loaded(note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loaded &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note);

  @JsonKey(ignore: true)
  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) loaded,
    required TResult Function(Note note, String recognizedWords, bool isFinal)
        listening,
  }) {
    return loaded(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
  }) {
    return loaded?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Listening value) listening,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements NoteState {
  const factory Loaded(Note note) = _$Loaded;

  Note get note;
  @JsonKey(ignore: true)
  $LoadedCopyWith<Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningCopyWith<$Res> {
  factory $ListeningCopyWith(Listening value, $Res Function(Listening) then) =
      _$ListeningCopyWithImpl<$Res>;
  $Res call({Note note, String recognizedWords, bool isFinal});
}

/// @nodoc
class _$ListeningCopyWithImpl<$Res> extends _$NoteStateCopyWithImpl<$Res>
    implements $ListeningCopyWith<$Res> {
  _$ListeningCopyWithImpl(Listening _value, $Res Function(Listening) _then)
      : super(_value, (v) => _then(v as Listening));

  @override
  Listening get _value => super._value as Listening;

  @override
  $Res call({
    Object? note = freezed,
    Object? recognizedWords = freezed,
    Object? isFinal = freezed,
  }) {
    return _then(Listening(
      note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      recognizedWords == freezed
          ? _value.recognizedWords
          : recognizedWords // ignore: cast_nullable_to_non_nullable
              as String,
      isFinal == freezed
          ? _value.isFinal
          : isFinal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Listening implements Listening {
  const _$Listening(this.note, this.recognizedWords, this.isFinal);

  @override
  final Note note;
  @override
  final String recognizedWords;
  @override
  final bool isFinal;

  @override
  String toString() {
    return 'NoteState.listening(note: $note, recognizedWords: $recognizedWords, isFinal: $isFinal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Listening &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.recognizedWords, recognizedWords) ||
                other.recognizedWords == recognizedWords) &&
            (identical(other.isFinal, isFinal) || other.isFinal == isFinal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note, recognizedWords, isFinal);

  @JsonKey(ignore: true)
  @override
  $ListeningCopyWith<Listening> get copyWith =>
      _$ListeningCopyWithImpl<Listening>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Note note) loaded,
    required TResult Function(Note note, String recognizedWords, bool isFinal)
        listening,
  }) {
    return listening(note, recognizedWords, isFinal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
  }) {
    return listening?.call(note, recognizedWords, isFinal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Note note)? loaded,
    TResult Function(Note note, String recognizedWords, bool isFinal)?
        listening,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(note, recognizedWords, isFinal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Listening value) listening,
  }) {
    return listening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
  }) {
    return listening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Listening value)? listening,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(this);
    }
    return orElse();
  }
}

abstract class Listening implements NoteState {
  const factory Listening(Note note, String recognizedWords, bool isFinal) =
      _$Listening;

  Note get note;
  String get recognizedWords;
  bool get isFinal;
  @JsonKey(ignore: true)
  $ListeningCopyWith<Listening> get copyWith =>
      throw _privateConstructorUsedError;
}
