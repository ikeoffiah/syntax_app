/// Represents the response structure for a successful sign-up request.
class SignUpResponse {
  /// Constructor for the [SignUpResponse] class.
  SignUpResponse({
    required this.data,
    required this.detail,
  });

  /// Creates a [SignUpResponse] object from a JSON map.
  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        data: UserData.fromJson(json['data']),
        detail: json['detail'],
      );

  /// Contains user-related data such as email, name, and tokens.
  final UserData data;

  /// The success message or additional details about the operation.
  final String detail;

  /// Converts the [SignUpResponse] object into a JSON map.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data.toJson(),
        'detail': detail,
      };
}

/// Represents user-specific data returned in the response.
class UserData {
  /// Constructor for the [UserData] class.
  UserData({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.token,
  });

  /// Creates a [UserData] object from a JSON map.
  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        token: Token.fromJson(json['token']),
      );

  /// The email of the user.
  final String email;

  /// The first name of the user.
  final String firstName;

  /// The last name of the user.
  final String lastName;

  /// Authentication tokens for the user.
  final Token token;

  /// Converts the [UserData] object into a JSON map.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'token': token.toJson(),
      };
}

/// Represents the authentication tokens returned in the response.
class Token {
  /// Constructor for the [Token] class.
  Token({
    required this.refresh,
    required this.access,
  });

  /// Creates a [Token] object from a JSON map.
  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json['refresh'],
        access: json['access'],
      );

  /// The refresh token used for obtaining a new access token.
  final String refresh;

  /// The access token used for authenticating API requests.
  final String access;

  /// Converts the [Token] object into a JSON map.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'refresh': refresh,
        'access': access,
      };
}
