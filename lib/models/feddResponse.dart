import 'dart:convert';

FeedResponse welcomeFromJson(String str) => FeedResponse.fromJson(json.decode(str));



class FeedResponse {
    FeedResponse({
        this.message,
    });

    String message;

    factory FeedResponse.fromJson(Map<String, dynamic> json) => FeedResponse(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}