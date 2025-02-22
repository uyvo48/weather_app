part of '../../logger.dart';

abstract class LogOutput {
  Future<void> init() async {}

  void output(OutputEvent event);

  Future<void> destroy() async {}
}
