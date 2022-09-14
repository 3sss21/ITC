import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/branch_model.dart';
import 'package:cashback_app/screens/buyer/screens/branch_screen/bloc/repository_branch.dart';
import 'package:meta/meta.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc() : super(BranchInitial()) {
    on<BranchEvent>(
      (event, emit) async {
        if (event is GetBranchEvent) {
          emit(LoadingBranchState());
          try {
            List<BranchModel> branchModelList  = await BranchRepository().getBranch();

            emit(
              LoadedBranchState(branchModelList: branchModelList),
            );
          } catch (e) {
            emit(
              ErrorBranchState(
                message: CatchException.convertException(e),
              ),
            );
          }
        }
      },
    );
  }
}
