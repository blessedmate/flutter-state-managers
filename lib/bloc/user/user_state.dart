part of 'user_bloc.dart';

// Data handling
@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  const UserState({this.existUser = false, this.user});
}

class UserInitialState extends UserState {
  // const UserInitialState(): super(existUser: false,user: null);
  const UserInitialState() : super();
}

class UserActiveState extends UserState {
  final User newUser;
  const UserActiveState(this.newUser) : super(existUser: true, user: newUser);
}
