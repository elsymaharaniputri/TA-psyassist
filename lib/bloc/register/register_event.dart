part of 'register_bloc.dart';
//perubahan aplikasi saat sebuah tombol/pemicu dijalankan

@immutable
abstract class RegisterEvent {}

//save register ini akan membawa data register model
class SaveRegisterEvent extends RegisterEvent {
//final TipeData namaProperti;
  final RegisterModel request;
  //ketika event ini dikirimkan dari UI, logika (membawa model data informasi dari proses regis) dalam fungsi ini akan dijalankan.
  SaveRegisterEvent({
    required this.request, //request ini yg get data dari user 
  });
}
