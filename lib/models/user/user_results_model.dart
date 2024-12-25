/// A model class representing the user result response.
class UserResultModel {
  /// Constructor to initialize the [UserResultModel] with required fields.
  UserResultModel({
    required this.data,
    required this.detail,
  });

  /// Factory method to create a [UserResultModel] instance from a JSON map.
  ///
  /// The JSON map must contain:
  /// - A `data` field (parsed into [ResultData]).
  /// - A `detail` field (string).
  factory UserResultModel.fromJson(Map<String, dynamic> json) =>
      UserResultModel(
        data: ResultData.fromJson(json['data']),
        detail: json['detail'],
      );

  /// The data field contains detailed information about the result.
  final ResultData data;

  /// A string providing additional details about the result.
  final String detail;

  /// Converts the [UserResultModel] instance into a JSON map.
  ///
  /// The resulting JSON map contains:
  /// - `data` (converted from [ResultData]).
  /// - `detail` (string).
  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data.toJson(),
        'detail': detail,
      };
}

/// A model class representing the detailed result data.
class ResultData {
  /// Constructor to initialize the [ResultData] with required fields.
  ResultData({
    required this.stageUpdated,
    required this.stage,
    required this.points,
  });

  /// Factory method to create a [ResultData] instance from a JSON map.
  ///
  /// The JSON map must contain:
  /// - A `stage_updated` field (boolean).
  /// - A `stage` field (string).
  /// - A `points` field (integer).
  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
        stageUpdated: json['stage_updated'],
        stage: json['stage'],
        points: json['points'],
      );

  /// Indicates whether the stage was updated.
  final bool stageUpdated;

  /// The current stage of the user result.
  final String stage;

  /// The points scored or associated with the user result.
  final int points;

  /// Converts the [ResultData] instance into a JSON map.
  ///
  /// The resulting JSON map contains:
  /// - `stage_updated` (boolean).
  /// - `stage` (string).
  /// - `points` (integer).
  Map<String, dynamic> toJson() => <String, dynamic>{
        'stage_updated': stageUpdated,
        'stage': stage,
        'points': points,
      };
}
