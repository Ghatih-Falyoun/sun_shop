import 'package:freezed_annotation/freezed_annotation.dart';

part  'singup_state.freezed.dart';


@freezed
class SingupState with _$SingupState {
  const factory SingupState.initial() = _Initial;
  const factory SingupState.loading() = Loading;
  const factory SingupState.success() = Success;
  const factory SingupState.error(String error) = Error;
}
