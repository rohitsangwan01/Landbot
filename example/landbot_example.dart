// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:landbot/landbot.dart';
import 'package:landbot/src/model/MessageModel.dart';

void main() async {
  Landbot landbot = Landbot();

  /// Get Token From `Landbot`
  String token = 'YOUR_TOKEN';

  ///First we have to `initialise` the landbot
  await landbot.initialise(token: token);

  ///We can `Subscribe` to the `Webhooks` , default Endpoint is /webhook
  StreamSubscription subscription =
      landbot.webhook.listen((MessageData messageData) {
    ///Here we can reply to ther Cusomer , or do other Tasks
    landbot.sendMessage(
        customerID: messageData.customer!.id!,
        message: 'Hello ${messageData.customer!.name}');
  });

  ///To get the `Customer` Data
  // try {
  //   Customer? customer = await landbot.getCustomer(id: 161808359);
  //   print(customer?.toJson());
  // } catch (e) {
  //   print(e);
  // }

  ///To send Message to the `Customers`
  // await landbot.sendMessage(
  //     customerID: customer.id!, message: 'Hello ${customer.name}');
}
