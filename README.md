# Landbot

Landbot is a wrapper over [landbot.io](https://landbot.io/) ,its a Bot Builder Service

## Features

Currently Landbot supports subscribing to Stream of Webhooks , Getting Customer Data and Sending Messages to the Customers

## Getting started

Add Landbot to Dependencies

```dart
dependencies:
  landbot: any
```

## Usage

longer examples are into `/example` folder.

Create a Landbot instance

```dart
Landbot landbot = Landbot();
```

Make Sure to Initialise Landbot First before using it ,
and get the access token from Landbot Account [Setting](https://app.landbot.io/gui/settings/account)

```dart
await landbot.initialise(token: 'YOUR_LANDBOT_TOKEN');
```

Lanbot will initially start a server on ip:3000 with webhook endpoint as ip:3000/webhook
we can change this port(3000) and default webhook endpoint(webhook)
To Get data into this Stream , make sure to add this url ( http://YOUR_IP:3000/webhook ) to Landbot webhooks
This Stream will Return Message Data , we can reply back to The Customer by using `sendMessage` function
or you can genrate a url with [ngrok](https://ngrok.com/) if you are working on localhost

```dart
  StreamSubscription subscription =
      landbot.webhook.listen((MessageData messageData) {

    landbot.sendMessage(
        customerID: messageData.customer!.id!,
        message: 'Hello ${messageData.customer!.name}');
  });
```

To send Message to the Customer , use

```dart
 await landbot.sendMessage(
      customerID: customer.id, message: 'Hello ${customer.name}');
```

To Get data of a Customer , use

```dart
 Customer? customer = await landbot.getCustomer(id: CUSTOMER_ID);
```

## Additional information

This is Just The Initial Version feel free to Contribute or Report any Bug!
