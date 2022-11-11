import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_bar_visibility_state.dart';

class TabBarVisibilityCubit extends Cubit<bool> {
  TabBarVisibilityCubit() : super(false);

  changeVisibility() {
    if (state == false) {
      emit(true);
    } else {
      emit(false);
    }
  }
}
