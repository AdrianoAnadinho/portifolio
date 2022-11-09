import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_icon_state.dart';

class ThemeIconCubit extends Cubit<ThemeIconState> {
  ThemeIconCubit() : super(ThemeIconLight());

  changeIcon() {
    // print("${state.hashCode} == ${Icon(Icons.light_mode).hashCode}");
    if (state == ThemeIconDark()) {
      emit(ThemeIconLight());
    } else {
      emit(ThemeIconDark());
    }
  }
}
