part of 'user_bloc.dart';

// Events handling
@immutable
abstract class UserEvent {}

class ActivateUserEvent extends UserEvent {
  final User newUser;
  ActivateUserEvent(this.newUser);
}

class ChangeUserAgeEvent extends UserEvent {
  final int age;
  ChangeUserAgeEvent(this.age);
}

class AddUserProfessionEvent extends UserEvent {
  final String profession;
  AddUserProfessionEvent(this.profession);
}
