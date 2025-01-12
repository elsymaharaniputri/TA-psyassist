part of 'register_bloc.dart';
//State adalah "keadaan" aplikasi pada waktu tertentu. State menggambarkan apa yang dilihat oleh pengguna pada layar.
//Model diinisiasi untuk menangkap data dari state ini .
//Dijalankan dalam fungsi loaded artinya data sudah ditangkap dan siap dipakai

@immutable
abstract class RegisterState {}
//saat awal jalankan screen register
class RegisterInitial extends RegisterState {}

// State ini menandakan bahwa proses registrasi sedang berlangsung
class RegisterLoading extends RegisterState {}

//Loaded adalah state yang menunjukkan bahwa proses yang sebelumnya sedang berlangsung telah selesai dengan sukses, 
//dan data atau hasil yang diinginkan telah berhasil dimuat
class RegisterLoaded extends RegisterState {
  
  final RegisterResponseModel model;
  RegisterLoaded({
    required this.model,
  });
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError({required this.message}); // Named parameter
}
