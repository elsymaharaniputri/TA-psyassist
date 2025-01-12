part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

//save register ini akan membawa data register model
class SaveLoginEvent extends LoginEvent {
//final TipeData namaProperti;
  final LoginRequestModel request;
  //ketika event ini dikirimkan dari UI, logika (membawa model data informasi dari proses regis) dalam fungsi ini akan dijalankan.
  SaveLoginEvent({
    required this.request, //request ini yg get data dari user
  });
}
