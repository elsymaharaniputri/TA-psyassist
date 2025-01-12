import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:psyassist_apk/data/dataresource/api_datalogin.dart';
import 'package:psyassist_apk/models/request/rq_login.dart';
import 'package:psyassist_apk/models/response/rp_login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //dipanggil dulu object dari api datasource yang disana ada link api
  final ApiDataLoginSource loginSource;

  LoginBloc(this.loginSource) : super(LoginInitial()) {
    //dijalankan saat UI SaveRegisterEvent
    print("Bisa jalan");
    on<SaveLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final result = await loginSource.login(event.request);
        emit(LoginLoaded(model: result));
      } catch (e) {
        emit(LoginError(message: e.toString()));
      }
    });
  }
}
