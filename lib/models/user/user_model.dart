class UserResponse {
  final UserData data;
  final String detail;

  UserResponse({required this.data, required this.detail});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      data: UserData.fromJson(json['data']),
      detail: json['detail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'detail': detail,
    };
  }
}

class UserData {
  final String stage;
  final Map<String, dynamic> categoryPoints;
  final int points;
  final int totalAttempts;

  UserData({
    required this.stage,
    required this.categoryPoints,
    required this.points,
    required this.totalAttempts,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      stage: json['stage'],
      categoryPoints: Map<String, dynamic>.from(json['category_points']),
      points: json['points'],
      totalAttempts: json['total_attempts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stage': stage,
      'category_points': categoryPoints,
      'points': points,
      'total_attempts': totalAttempts,
    };
  }
}
