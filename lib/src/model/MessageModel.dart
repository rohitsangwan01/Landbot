import 'dart:convert';

import 'package:landbot/src/model/CustomerModel.dart';

MessageData messageDataFromJson(String str) =>
    MessageData.fromJson(json.decode(str));

String messageDataToJson(MessageData data) => json.encode(data.toJson());

class MessageData {
  MessageData(
      {this.raw,
      this.type,
      this.data,
      this.timestamp,
      this.sender,
      this.customer,
      this.channel,
      this.author_type});

  Map<String, dynamic>? raw;
  String? type;
  String? author_type;
  Map<String, dynamic>? data;
  double? timestamp;
  Map<String, dynamic>? sender;
  Customer? customer;
  Map<String, dynamic>? channel;

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
        raw: json["_raw"],
        author_type: json['_raw']['author_type'],
        type: json["type"],
        data: json["data"],
        timestamp: json["timestamp"],
        sender: json["sender"],
        customer: Customer.fromJson(json["customer"]),
        channel: json["channel"],
      );

  Map<String, dynamic> toJson() => {
        "_raw": raw,
        "type": type,
        "data": data,
        "timestamp": timestamp,
        "sender": sender,
        "customer": customer,
        "channel": channel,
        "author_type": author_type
      };
}
