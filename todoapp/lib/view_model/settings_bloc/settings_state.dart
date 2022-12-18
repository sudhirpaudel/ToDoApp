part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

// ignore: must_be_immutable
class SettingsInitial extends SettingsState {
  Uint8List? image;

  SettingsInitial({this.image});
}

