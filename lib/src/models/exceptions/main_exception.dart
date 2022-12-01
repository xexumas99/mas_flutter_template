import 'dart:convert';

MainException mainExceptionFromJson(final String str) =>
    MainException.fromJson(json.decode(str));

String mainExceptionToJson(final MainException data) =>
    json.encode(data.toJson());

class MainException {
  MainException({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory MainException.fromJson(final Map<String, dynamic> json) =>
      MainException(
        status: json['status'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
