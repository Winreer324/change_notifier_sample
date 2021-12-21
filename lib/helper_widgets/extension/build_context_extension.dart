part of '../helper_provider_widget.dart';

extension BuiltContextX on BuildContext {
  M provider<M>() => Provider.of<M>(this, listen: false);
}
