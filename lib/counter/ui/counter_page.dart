import 'package:change_notifier_sample/counter/model/counter_notifier.dart';
import 'package:change_notifier_sample/helper_widgets/helper_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage>
    with HelperProviderStatefulWidget<CounterNotifier, CounterPage>, AutomaticKeepAliveClientMixin<CounterPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<CounterNotifier>(
      create: (_) => CounterNotifier(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Consumer<CounterNotifier>(
              builder: (context, counter, child) {
                return Center(child: Text("count: ${counter.counter}"));
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                /// если не провайдить выше по дереву модель, то нужно будет вызывать через контекст helper
                /// если провайдить выше по дереву модель => provider.increment();
                /// или можно вызвать через extension
                /// => context.provider<CounterNotifier>().increment();
                ///
                providerByContext(context).increment();
                /// можно так это extension с пакета provider
                /// ()=>  context.read<CounterNotifier>().increment();
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
