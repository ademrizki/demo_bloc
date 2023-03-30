import 'package:demo_bloc/screens/contact_form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(
              child: Text('Contact is empty'),
            );
          } else if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: state.contacts.length,
              itemBuilder: (context, index) {
                final contact = state.contacts[index];
                return ListTile(
                  tileColor: Colors.purple.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      contact['name'][0],
                    ),
                  ),
                  title: Text(
                    contact['name'],
                  ),
                  subtitle: Text(
                    contact['phone_number'],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Text('Ada error, coba lagi nanti'),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create Contact',
        child: const Icon(
          Icons.contact_page_outlined,
        ),
        onPressed: () async => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ContactFormScreen(),
          ),
        ),
      ),
    );
  }
}
