import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:psyassist_apk/data/dataresource/api_dataresource.dart';
import 'package:psyassist_apk/models/request/rq_register.dart';
import 'package:psyassist_apk/models/response/rp_register.dart';

part 'register_event.dart';
part 'register_state.dart';

//Bloc mendengarkan Event yang dikirim dari UI,
//memproses Event tersebut (dengan logika tertentu),
//lalu memancarkan (emit) State baru yang dapat dilihat oleh UI.


/*RegisterBloc
Kelas RegisterBloc adalah Bloc yang bertugas menangani semua logika terkait proses registrasi.
Kelas ini mengelola event (RegisterEvent) dan state (RegisterState) yang digunakan dalam fitur registrasi*/

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  //dipanggil dulu object dari api datasource yang disana ada link api 
  final ApiDataSource dataSource;

  RegisterBloc(this.dataSource) : super(RegisterInitial()) {
    //dijalankan saat UI SaveRegisterEvent 
    on<SaveRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final result = await dataSource.register(event.request);
        emit(RegisterLoaded(model: result));
      } catch (e) {
        emit(RegisterError(message: e.toString()));
      }
    });
  }
}
