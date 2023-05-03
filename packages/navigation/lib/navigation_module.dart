import 'package:get_it/get_it.dart';
import 'injection.dart' as injection;

class NavigationModule {
  Future<void> call(GetIt di) async {
    injection.di = di;
  }
}
