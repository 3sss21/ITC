import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cash_box_event.dart';
part 'cash_box_state.dart';

class CashBoxBloc extends Bloc<CashBoxEvent, CashBoxState> {
  CashBoxBloc() : super(CashBoxInitial()) {
    on<CashBoxEvent>((event, emit) {
      if (event is GetCashBoxEvent) {
        emit(CashBoxLoadingState());
        try {
          
        } catch (e) {
          
        }
      }
    });
  }
}
