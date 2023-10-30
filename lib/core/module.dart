abstract class Module {
  void init();

  static void initAll(List<Module> modules) {
    for (final module in modules) {
      module.init();
    }
  }
}
