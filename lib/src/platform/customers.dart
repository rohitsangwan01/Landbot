import 'package:landbot/landbot.dart';
import 'package:landbot/src/model/CustomerModel.dart';

mixin Customers on Landbot {

   Future<Customer?> getCustomerData({
    required int id,
  }) async {
    try {
      if (!isInit) {
        throw Exception('Landbot is not initialised');
      }
      var response = await dio.get('customers/$id/');

      Customer customer = Customer.fromJson(response.data);
      return customer;
    } catch (e) {
      rethrow;
    }
  }
}
