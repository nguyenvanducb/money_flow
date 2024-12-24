import 'package:money_flow/repository/apis/http_manager.dart';
import 'package:money_flow/repository/apis/urls.dart';

class APISetting {
  HTTPManager httpManager;
  APISetting(
    this.httpManager,
  );
  Future<dynamic> saveMe(data) async {
    return httpManager.post(
        url: REACT_APP_AUTHENTICATION_API_URL + URL_SAVE_ME, data: data);
  }
}
