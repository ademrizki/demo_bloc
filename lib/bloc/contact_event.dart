part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class AddContact extends ContactEvent {
  final String name;
  final String phoneNumber;

  AddContact({
    required this.name,
    required this.phoneNumber,
  });
}
