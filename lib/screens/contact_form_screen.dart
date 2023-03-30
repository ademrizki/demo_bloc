import 'package:demo_bloc/bloc/contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactFormScreen extends StatelessWidget {
  ContactFormScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            children: [
              /// Name Field
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) =>
                      value!.isEmpty ? "Name shouldn't be empty" : null,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'John Doe',
                    filled: true,
                    fillColor: Colors.purple.shade50,
                  ),
                ),
              ),

              /// Phone Field
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value!.isEmpty ? "Phone number shouldn't be empty" : null,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: '0812...',
                    filled: true,
                    fillColor: Colors.purple.shade50,
                  ),
                ),
              ),


              /// Submit Button
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    context.read<ContactBloc>().add(
                          AddContact(
                            name: nameController.text,
                            phoneNumber: phoneController.text,
                          ),
                        );

                    Navigator.pop(context);
                  }
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
