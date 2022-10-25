import '../../../models/confirm_model.dart';
import '../../buyer/buyer_navigation_widget.dart/user_id_bloc/bloc/user_id_provider.dart';
import 'confirm_code_provider.dart';

// class ConfirmRepository {
//   Future<ConfirmModel> getConfirm() {
//    confirmCode({
//     required String code,

//   }) {
//     ConfirmProvider provider = ConfirmProvider();
//     provider.getConfirm(

//     );
//     return "";
//   }
//   }
// }

class ConfirmRepository {
  confirmCode({
    required String code,
    required String email,
  }) {
    ConfirmProvider provider = ConfirmProvider();
    provider.getConfirm(
      code: code,
      email: email,
    );
    return '';
  }
}
