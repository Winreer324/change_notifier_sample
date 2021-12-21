import 'package:change_notifier_sample/auth_sample/services/cart_service.dart';
import 'package:change_notifier_sample/auth_sample/services/greeting_service.dart';
import 'package:change_notifier_sample/auth_sample/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<dynamic> routeTo(BuildContext context) => MaterialPageRoute(
        builder: (_) => MultiProvider(providers: [
          Provider.value(
            value: Provider.of<GreetingService>(context),
          ),
          Provider.value(
            value: Provider.of<CartService>(context),
          ),
          Provider.value(
            value: Provider.of<UserService>(context),
          ),
        ], child: const HomePage()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.read<UserService>().user?.username ?? 'N/A',
            ),
            Consumer<UserService>(
              builder: (_, user, child) {
                return Builder(builder: (context) {
                  return Center(child: Text(user.user?.username ?? 'N/A'));
                });
              },
            ),
            Text(
              context.watch<GreetingService>().greeting,
            ),
            Text(
              context.read<GreetingService>().greeting,
            ),
            Text(
              context.read<CartService>().cartGreeting,
              // Provider.of<CartService>(context).cartGreeting,
            ),
          ],
        ),
      ),
    );
  }
}
