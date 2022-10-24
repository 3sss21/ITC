import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/screens/buyer/screens/QR_code_screen/bloc/qr_code_repository.dart';
import 'package:meta/meta.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(QrCodeInitial()) {
    on<QrCodeEvent>((event, emit) async {
      if (event is GetQrCodeEvent) {
        try {
          await QrCodeRepository().getQrCode(
              email: event.email,
              username: event.username,
              phoneNumber: event.phoneNumber,
              qrCode: event.qrCode,
              isSeller: event.isSeller,
              cashbackAll: event.cashbackAll,
              isActive: event.isActive);
          emit(QrCodeLoadedState());
        } catch (e) {
          emit(
            QrCodeErrorState(
              message: CatchException.convertException(e),
            ),
          );
        }
      }
    });
  }
}

