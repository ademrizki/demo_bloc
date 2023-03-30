import 'package:demo_bloc/bloc/contact_bloc.dart';
import 'package:demo_bloc/screens/contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Demo Bloc App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const ContactsScreen(),
      ),
    );
  }
}
