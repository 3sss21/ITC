import 'package:cashback_app/models/branch_model.dart';
import 'package:cashback_app/screens/buyer/screens/branch_screen/bloc/provider_branch.dart';

class BranchRepository {
  Future<List<BranchModel>> getBranch() {
    BranchProvider branchProvider = BranchProvider();

    return branchProvider.getBranch();
  }
}
