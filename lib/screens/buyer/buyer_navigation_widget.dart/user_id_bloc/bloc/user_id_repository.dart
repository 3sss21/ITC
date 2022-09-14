import 'package:cashback_app/models/user_id_model.dart';
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/user_id_bloc/bloc/user_id_provider.dart';

class UserIdRepository {
  Future<UserIdModel> getUserId() {
    UserIdProvider provider = UserIdProvider();

    return provider.getUserId();
  }
}
