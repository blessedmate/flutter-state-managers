import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_singleton/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  // Emit a new state
  void selectUser(User user) {
    emit(UserActive(user));
  }

  void changeAge(int age) {
    final currentState = state;
    if (currentState is UserActive) {
      // Idea is not to mutate previous state
      final newUser = currentState.user.copyWith(age: age);
      emit(UserActive(newUser));
    }
  }

  void addProfession() {
    final currentState = state;
    if (currentState is UserActive) {
      // Idea is not to mutate previous state
      final professionsList = currentState.user.professions;
      professionsList.add('Profession # ${professionsList.length + 1}');

      final newUser = currentState.user.copyWith(professions: professionsList);
      emit(UserActive(newUser));
    }
  }

  void deleteUser() {
    emit(UserInitial());
  }
}
