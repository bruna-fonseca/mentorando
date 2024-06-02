import 'package:freezed_annotation/freezed_annotation.dart';

part 'roadmap_result.freezed.dart';

@freezed
class RoadmapResult<T> with _$RoadmapResult<T> {
  factory RoadmapResult.success(T data) = Success;
  factory RoadmapResult.error(String message) = Error;
}