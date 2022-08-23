import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/branch_model.dart';
import 'package:meta/meta.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc() : super(BranchInitial()) {
    on<BranchEvent>(
      (event, emit) {
        if (event is GetBranchEvent) {
          emit(LoadingBranchState());
          try {
            List<BranchModel> branchModel = [
              BranchModel(
                branchName: 'БЦ Олимп',
              ),
              BranchModel(
                branchName: 'БЦ Avrora',
              ),
              BranchModel(
                branchName: 'БЦ Tash Rabat',
              ),
              BranchModel(
                branchName: 'БЦ Feliz',
              ),
              BranchModel(
                branchName: 'Novatel',
              ),
            ];
            emit(LoadedBranchState(branchModel: branchModel),);
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
