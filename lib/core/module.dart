abstract class Module {
  Future<void> init();

  static Future<void> initAll(List<Module> modules) async {
    for (final module in modules) {
      await module.init();
    }
  }
}
