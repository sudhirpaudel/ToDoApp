part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

// ignore: must_be_immutable
class UpdatePic extends SettingsEvent {
  Uint8List? image;

  UpdatePic({this.image});
}
