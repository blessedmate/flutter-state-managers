part of 'user_bloc.dart';

// Events handling
@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User newUser;
  ActivateUser(this.newUser);
}
