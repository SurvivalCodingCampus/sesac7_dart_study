import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/250710/core/enums.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T, E> with _$Result<T, E> {
  const factory Result.success(T data) = Success;

  const factory Result.error(NetworkError e) = Error;
}
