import 'package:cashback_app/global_blocs/user_id_bloc/user_id_provider.dart';
import 'package:cashback_app/models/user_id_model.dart';

class UserIdRepository {
  Future<UserIdModel> getUserId() {
    UserIdProvider provider = UserIdProvider();

    return provider.getUserId();
  }
}
