part of 'trash_cubit.dart';

@freezed
class TrashState with _$TrashState {
  const factory TrashState.initial() = Initial;
  const factory TrashState.loading() = Loading;
  const factory TrashState.loaded(List<Note> note) = Loaded;
}