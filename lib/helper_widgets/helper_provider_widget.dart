import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

part 'extension/build_context_extension.dart';

mixin HelperProviderStatefulWidget<M, T extends StatefulWidget> on State<T> {
  M get provider => Provider.of<M>(context, listen: false);

  M providerByContext(BuildContext context) => Provider.of<M>(context, listen: false);
}

abstract class HelperProviderStatelessWidget<M, T extends StatelessWidget> {
  M provider(BuildContext context) => Provider.of<M>(context, listen: false);
}

