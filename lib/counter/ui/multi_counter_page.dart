import 'package:change_notifier_sample/counter/model/counter_notifier.dart';
import 'package:change_notifier_sample/helper_widgets/helper_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiCounterPage extends StatefulWidget {
  const MultiCounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<MultiCounterPage> with AutomaticKeepAliveClientMixin<MultiCounterPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChangeNotifierProvider<CounterNotifier>(
            create: (context) => CounterNotifier(),
            child: const _CounterItemExtension(),
          ),
          ChangeNotifierProvider<CounterNotifier>(
            create: (context) => CounterNotifier(),
            child: const _CounterItemWrapHelper(),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CounterItemExtension extends StatefulWidget {
  const _CounterItemExtension({Key? key}) : super(key: key);

  @override
  __CounterItemState createState() => __CounterItemState();
}

class __CounterItemState extends State<_CounterItemExtension> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CounterNotifier>(
          builder: (context, counter, child) {
            return Center(child: Text("count: ${counter.counter}"));
          },
        ),
        ElevatedButton(
          onPressed: () {
            context.provider<CounterNotifier>().increment();
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class _CounterItemWrapHelper extends StatefulWidget {
  const _CounterItemWrapHelper({Key? key}) : super(key: key);

  @override
  __CounterItemWrapHelper createState() => __CounterItemWrapHelper();
}

class __CounterItemWrapHelper extends State<_CounterItemWrapHelper>
    with HelperProviderStatefulWidget<CounterNotifier, _CounterItemWrapHelper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CounterNotifier>(
          builder: (context, counter, child) {
            return Center(child: Text("count: ${counter.counter}"));
          },
        ),
        ElevatedButton(
          onPressed: provider.increment,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
