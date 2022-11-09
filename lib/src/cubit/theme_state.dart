part of 'theme_cubit.dart';

@immutable
abstract class ThemeState extends Equatable {
  const ThemeState(this.mode);

  final ThemeMode mode;

  @override
  List<ThemeMode> get props => [mode];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.mode);
}
