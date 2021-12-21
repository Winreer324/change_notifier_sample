import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_sample/services/cart_service.dart';
import 'auth_sample/services/greeting_service.dart';
import 'auth_sample/services/user_services.dart';
import 'auth_sample/ui/pages/login_page.dart';
import 'counter/ui/counter_page.dart';
import 'counter/ui/multi_counter_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const title = 'Change Notifier';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          Provider<UserService>(
            create: (context) => UserService(),
          ),
          ProxyProvider<UserService, GreetingService>(
            update: (BuildContext context, UserService userService, GreetingService? greetingService) =>
                GreetingService(
              userService: userService,
            ),
          ),
          ProxyProvider2<UserService, GreetingService, CartService>(
            update: (
              BuildContext context,
              UserService userService,
              GreetingService greetingService,
              CartService? cartService,
            ) =>
                CartService(
              userService: userService,
              greetingService: greetingService,
            ),
          ),

          /// вот тут сделать инициальзаци | CounterPage второй вариан вызова
          // ChangeNotifierProvider<CounterNotifier>(
          //   create: (context) => CounterNotifier(),
          // ),
        ],
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(title),
              bottom: const TabBar(
                tabs: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('Counter'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('Multi Counter'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('Auth'),
                  ),
                ],
                padding: EdgeInsets.only(bottom: 10),
              ),
            ),
            body: const TabBarView(
              children: [
                CounterPage(),
                MultiCounterPage(),
                LoginPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
