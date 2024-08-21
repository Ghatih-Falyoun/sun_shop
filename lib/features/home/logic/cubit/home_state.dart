
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.loaded(String name) = Loaded;
  const factory HomeState.error(String error) = Error;
}
