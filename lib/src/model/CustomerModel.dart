import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    this.name,
    this.avatar,
    this.email,
    this.options,
    this.phone,
    this.question,
    this.replyButtons,
    this.welcome,
    this.id,
    this.uuid,
    this.unread,
    this.blocked,
    this.brandId,
    this.archived,
    this.agentId,
    this.metaData,
    this.channelId,
    this.visitorId,
    this.lastMessageContent,
    this.ticketId,
    this.pausedUntil,
    this.lastMessage,
    this.lastSendDate,
    this.lastReceiveDate,
    this.registerDate,
    this.optIn,
    this.customFields,
  });

  String? name;
  String? avatar;
  String? email;
  String? options;
  String? phone;
  String? question;
  String? replyButtons;
  String? welcome;
  int? id;
  String? uuid;
  bool? unread;
  bool? blocked;
  int? brandId;
  bool? archived;
  int? agentId;
  Map<String, dynamic>? metaData;
  int? channelId;
  double? visitorId;
  String? lastMessageContent;
  double? ticketId;
  String? pausedUntil;
  double? lastMessage;
  double? lastSendDate;
  double? lastReceiveDate;
  double? registerDate;
  bool? optIn;
  Map<String, dynamic>? customFields;

  Customer copyWith({
    String? name,
    String? avatar,
    String? email,
    String? options,
    String? phone,
    String? question,
    String? replyButtons,
    String? welcome,
    int? id,
    String? uuid,
    bool? unread,
    bool? blocked,
    int? brandId,
    bool? archived,
    int? agentId,
    Map<String, dynamic>? metaData,
    int? channelId,
    double? visitorId,
    String? lastMessageContent,
    double? ticketId,
    String? pausedUntil,
    double? lastMessage,
    double? lastSendDate,
    double? lastReceiveDate,
    double? registerDate,
    bool? optIn,
    Map<String, dynamic>? customFields,
  }) =>
      Customer(
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        email: email ?? this.email,
        options: options ?? this.options,
        phone: phone ?? this.phone,
        question: question ?? this.question,
        replyButtons: replyButtons ?? this.replyButtons,
        welcome: welcome ?? this.welcome,
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        unread: unread ?? this.unread,
        blocked: blocked ?? this.blocked,
        brandId: brandId ?? this.brandId,
        archived: archived ?? this.archived,
        agentId: agentId ?? this.agentId,
        metaData: metaData ?? this.metaData,
        channelId: channelId ?? this.channelId,
        visitorId: visitorId ?? this.visitorId,
        lastMessageContent: lastMessageContent ?? this.lastMessageContent,
        ticketId: ticketId ?? this.ticketId,
        pausedUntil: pausedUntil ?? this.pausedUntil,
        lastMessage: lastMessage ?? this.lastMessage,
        lastSendDate: lastSendDate ?? this.lastSendDate,
        lastReceiveDate: lastReceiveDate ?? this.lastReceiveDate,
        registerDate: registerDate ?? this.registerDate,
        optIn: optIn ?? this.optIn,
        customFields: customFields ?? this.customFields,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"],
        avatar: json["avatar"],
        email: json["email"],
        options: json["options"],
        phone: json["phone"],
        question: json["question"],
        replyButtons: json["reply_buttons"],
        welcome: json["welcome"],
        id: json["id"],
        uuid: json["uuid"],
        unread: json["unread"],
        blocked: json["blocked"],
        brandId: json["brand_id"],
        archived: json["archived"],
        agentId: json["agent_id"],
        metaData: json["meta_data"],
        channelId: json["channel_id"],
        visitorId: json["visitor_id"],
        lastMessageContent: json["last_message_content"],
        ticketId: json["ticket_id"],
        pausedUntil: json["paused_until"],
        lastMessage: json["last_message"],
        lastSendDate: json["last_send_date"],
        lastReceiveDate: json["last_receive_date"],
        registerDate: json["register_date"],
        optIn: json["opt_in"],
        customFields: json["custom_fields"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "email": email,
        "options": options,
        "phone": phone,
        "question": question,
        "reply_buttons": replyButtons,
        "welcome": welcome,
        "id": id,
        "uuid": uuid,
        "unread": unread,
        "blocked": blocked,
        "brand_id": brandId,
        "archived": archived,
        "agent_id": agentId,
        "meta_data": metaData,
        "channel_id": channelId,
        "visitor_id": visitorId,
        "last_message_content": lastMessageContent,
        "ticket_id": ticketId,
        "paused_until": pausedUntil,
        "last_message": lastMessage,
        "last_send_date": lastSendDate,
        "last_receive_date": lastReceiveDate,
        "register_date": registerDate,
        "opt_in": optIn,
        "custom_fields": customFields,
      };
}
