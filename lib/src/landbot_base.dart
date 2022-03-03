// ignore_for_file: non_constant_identifier_names, unused_field

import 'dart:async';
import 'dart:convert';
import 'package:alfred/alfred.dart';
import 'package:dio/dio.dart';
import 'package:landbot/src/model/CustomerModel.dart';
import 'package:landbot/src/model/MessageModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Landbot {
  bool _isInitialised = false;
  Alfred? _app;
  StreamController<MessageData> controller = StreamController();
  final String _landbot_base_url = 'https://api.landbot.io/v1/';
  late Dio dio;
  late Stream<MessageData> webhook;

  bool get isInit => _isInitialised;

  ///Initialise the Dio BaseClient
  _initDioBaseClient(token, {bool logNetwork = false}) async {
    BaseOptions options = BaseOptions(
        baseUrl: _landbot_base_url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token"
        },
        contentType: "application/json",
        receiveDataWhenStatusError: true,
        connectTimeout: 10000,
        receiveTimeout: 10000);
    dio = Dio(options);

    if (logNetwork) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: false,
          maxWidth: 90));
    }
  }

  /// Initialize the `Alfred` Library
  ///`webHookEndPoint` is the Endpoint we have to pass on to Landbot Webhooks
  initialise({
    required token,
    bool logNetwork = false,
    String webHookEndPoint = 'webhook',
    int webPort = 3000,
    Function? onSuccess,
  }) async {
    try {
      _isInitialised = true;
      if (_app != null) _app!.close();
      await _initDioBaseClient(token, logNetwork: logNetwork);
      _app = Alfred();

      webhook = controller.stream;

      _app!.get('/', (req, res) => "Landbot is Active on Dart");

      //a webhook endpoint for Listening to Landbot Webhooks
      _app!.post('/$webHookEndPoint', (req, res) async {
        Map<String, dynamic>? data = await req.body as Map<String, dynamic>?;

        ///Send Data to `Webhook Stream`
        if (data != null) {
          MessageData messageData = MessageData.fromJson(data['messages'][0]);

          ///Filtering `Agents` to avoid loops of Messages
          if (messageData.author_type != 'agent') {
            controller.add(messageData);
          }
        }
        //Send a Success response Back
        return {'success': true};
      });

      final server = await _app!.listen(webPort);
      String status = 'Server Started => ${server.address.host}:${server.port}';
      print('-----------------------------------------------------');
      print(status);
      print(
          'Landbot Webhook Listening at => ${server.address.host}:${server.port}/$webHookEndPoint');
      print('-----------------------------------------------------');

      if (onSuccess != null) {
        onSuccess(status);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// For `Getting Customers Data`
  Future<Customer?> getCustomer({
    required int id,
  }) async {
    try {
      if (!_isInitialised) {
        throw Exception('Landbot is not initialised');
      }
      var response = await dio.get('customers/$id/');
      Customer customer = Customer.fromJson(response.data['customer']);
      return customer;
    } catch (e) {
      rethrow;
    }
  }

  /// For `Sending Message`
  sendMessage(
      {required int customerID,
      String message = 'AutoReply by Landbot'}) async {
    try {
      if (!_isInitialised) {
        throw Exception('Landbot is not initialised');
      }

      var payload = {
        "message": message,
      };
      var response = await dio.post('customers/$customerID/send_text/',
          data: json.encode(payload));

      print(response);
    } catch (e) {
      rethrow;
    }
  }

  ///To Deinitialise the `Alfred` Library
  deInitialise() async {
    _isInitialised = false;
    if (_app != null) _app!.close();
    _app = null;
  }
}
