import 'package:flutter/cupertino.dart';

class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;

  const NotifierProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.widget;

    return widget is NotifierProvider<Model> ? widget.model : null;
  }
}

class MyProvider<Model> extends InheritedNotifier {
  final Model model;

  const MyProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static Model? watch<Model>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyProvider<Model>>()?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<MyProvider<Model>>()
        ?.widget;

    return widget is MyProvider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(MyProvider oldWidget) {
    return model != oldWidget.model;
  }
}
