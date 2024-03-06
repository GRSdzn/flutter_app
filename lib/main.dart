import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrienciesListApp());
}

class CryptoCurrienciesListApp extends StatelessWidget {
  const CryptoCurrienciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        primarySwatch: Colors.yellow,
        dividerColor: Colors.white10,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          // iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 255, 136, 0),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
      ),
      routes: {
        '/': (context) => const CryptoListScreen(),
        '/coin': (context) => const CryptoCoinScreen(),
      },
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn dart'),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Data';
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/cat.svg',
              height: 30,
              width: 30,
            ),
            title: Text(
              coinName,
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              '200000\$',
              style: theme.textTheme.labelSmall,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/coin',
                arguments: coinName,
              );
            },
          );
        },
      ),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      return log('you must provide args');
    }
    if (args is! String) {
      return log('you must provide String args');
    }
    coinName = args;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'), // передаем значение из стейта
      ),
    );
  }
}
