import 'package:money_flow/repository/apis/http_manager.dart';
import 'package:money_flow/repository/apis/urls.dart';

class APIHOME {
  HTTPManager httpManager;
  APIHOME(
    this.httpManager,
  );
  Future<dynamic> indicator(data) async {
    return httpManager.post(
        url: 'https://iboard-query.ssi.com.vn/exchange-index/multiple',
        data: data);
  }
}
