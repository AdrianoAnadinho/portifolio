part of 'theme_icon_cubit.dart';

abstract class ThemeIconState extends Equatable {}

class ThemeIconDark extends ThemeIconState {
  final Icon icon = const Icon(Icons.dark_mode);
  @override
  List<Object?> get props => [icon];
}

class ThemeIconLight extends ThemeIconState {
  final Icon icon = const Icon(Icons.light_mode);
  @override
  List<Object?> get props => [icon];
}
