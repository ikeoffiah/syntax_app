/// Login response model
class LoginResponse {
  /// [LoginResponse] constructor
  LoginResponse({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.detail,
  });

  ///
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: Token.fromJson(json['data']['token']),
        firstName: json['data']['first_name'],
        lastName: json['data']['last_name'],
        detail: json['detail'],
      );

  /// token
  final Token token;

  /// first name
  final String firstName;

  /// last name
  final String lastName;

  /// details
  final String detail;

  /// convert to json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': <String, Object>{
          'token': token.toJson(),
          'first_name': firstName,
          'last_name': lastName,
        },
        'detail': detail,
      };
}

/// token
class Token {
  /// [Token] constructor
  Token({
    required this.refresh,
    required this.access,
  });

  /// refresh token
  final String refresh;

  /// access token
  final String access;

  /// convert fro json
  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json['refresh'],
        access: json['access'],
      );

  /// to json

  Map<String, dynamic> toJson() => <String, dynamic>{
        'refresh': refresh,
        'access': access,
      };
}
