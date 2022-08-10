import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/balance_model.dart';
import 'package:meta/meta.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  BalanceBloc() : super(BalanceInitial()) {
    on<BalanceEvent>((event, emit) {
      if (event is GetBalanceEvent) {
        emit(LoadingBalanceState());
        try {
          List<BalanceModel> balanceModel = [
            BalanceModel(
              dateTime: '30.06.2021',
              listOfProducts: [
                'КОФЕ “КАПУЧИНО”',
                'Ice Tea',
                'Сэндвич',
                'Круассаны',
              ],
              listOfPoints: [
                20,
                40,
                0,
                30,
              ],
            )
          ];
          emit(LoadedBalanceState(balanceModel: balanceModel));
        } catch (e) {
          emit(ErrorBalanceState(message: CatchException.convertException(e)));
        }
      }
    });
  }
}
