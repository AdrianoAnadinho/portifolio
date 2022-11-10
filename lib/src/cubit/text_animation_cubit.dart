import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_animation_state.dart';

class TextAnimationCubit extends Cubit<bool> {
  TextAnimationCubit() : super(false);

  activateAnimation() {
    emit(true);
    // print(state);
  }

  deactivateAnimation() {
    emit(false);
    // print(state);
  }
}
