import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_bar_visibility_state.dart';

class TabBarVisibilityCubit extends Cubit<TabBarVisibilityState> {
  TabBarVisibilityCubit() : super(TabBarVisibilityInitial());
}
