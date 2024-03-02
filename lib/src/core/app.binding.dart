import 'package:get/get.dart';

abstract class Binding extends Bindings {
  void exports() {
    throw UnimplementedError();
  }
}

class AppBinding extends Binding {
  @override
  void dependencies() {}
}
