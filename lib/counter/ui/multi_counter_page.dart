import 'package:change_notifier_sample/counter/model/counter_notifier.dart';
import 'package:change_notifier_sample/helper_widgets/helper_provider_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiCounterPage extends StatefulWidget {
  const MultiCounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<MultiCounterPage> with AutomaticKeepAliveClientMixin<MultiCounterPage> {
  final _counterValueListenableProvider = ValueNotifier(0);

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
          ChangeNotifierProvider<CounterNotifier>(
            create: (context) => CounterNotifier(),
            child: const SelectorCounterWidget(),
          ),
          ValueListenableProviderWidget(
            counter: _counterValueListenableProvider,
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
            return Center(child: Text("count (Consumer): ${counter.counter}"));
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
            return Center(child: Text("count (Consumer): ${counter.counter}"));
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

class SelectorCounterWidget extends StatefulWidget {
  const SelectorCounterWidget({Key? key}) : super(key: key);

  @override
  _SelectorCounterWidgetState createState() => _SelectorCounterWidgetState();
}

class _SelectorCounterWidgetState extends State<SelectorCounterWidget>
    with HelperProviderStatefulWidget<CounterNotifier, SelectorCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Selector<CounterNotifier, String>(
          builder: (context, counter, child) {
            return Center(child: Text("count (Selector): $counter"));
          },
          selector: (BuildContext context, CounterNotifier counter) => counter.counter.toString(),
        ),
        ElevatedButton(
          onPressed: provider.increment,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class ValueListenableProviderWidget extends StatefulWidget {
  final ValueNotifier<int> counter;

  const ValueListenableProviderWidget({Key? key, required this.counter}) : super(key: key);

  @override
  _ValueListenableProviderWidgetState createState() => _ValueListenableProviderWidgetState();
}

class _ValueListenableProviderWidgetState extends State<ValueListenableProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableProvider<int>.value(
          value: widget.counter,
          child: Text('counter value listenable provider ${widget.counter.value}'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.counter.value++;
            setState(() {});
          },
          child: const Text('value listenable provider'),
        )
      ],
    );
  }
}
