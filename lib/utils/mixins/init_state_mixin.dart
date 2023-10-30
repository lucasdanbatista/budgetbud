import 'package:flutter/widgets.dart';

mixin InitStateMixin on StatelessWidget {
  void initState();

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (_) => initState(),
    );
    return const _NullWidget();
  }
}

class _NullWidget extends StatelessWidget {
  const _NullWidget();

  @override
  Widget build(BuildContext context) {
    throw FlutterError(
      'Widgets that mix InitStateMixin must call super.build() but must ignore '
      'the return value of the superclass.',
    );
  }
}
