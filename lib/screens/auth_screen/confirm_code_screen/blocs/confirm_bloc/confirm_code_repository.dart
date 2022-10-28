import 'package:cashback_app/models/confirm_response_model.dart';

import 'confirm_code_provider.dart';

class ConfirmRepository {
  Future<ConfirmResponseModel> confirmCode({
    required String code,
    required String email,
  }) {
    ConfirmProvider provider = ConfirmProvider();
    return provider.getConfirm(
      code: code,
      email: email,
    );
  }
}
