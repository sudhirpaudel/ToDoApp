// ignore_for_file: depend_on_referenced_packages
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<UpdatePic>(_onUpdatePic);
  }

  void _onUpdatePic(UpdatePic event, Emitter<SettingsState> emit) {
    emit(
      SettingsInitial(image: event.image),
    );
  }
}
