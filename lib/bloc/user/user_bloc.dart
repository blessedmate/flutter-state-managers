import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_singleton/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

// Events handler: get event, emit state
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUserEvent>(
        (event, emit) => emit(UserActiveState(event.newUser)));

    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.existUser) return;
      emit(UserActiveState(state.user!.copyWith(age: event.age)));
    });

    on<AddUserProfessionEvent>((event, emit) {
      if (!state.existUser) return;

      final professionsList = [...state.user!.professions, event.profession];

      emit(UserActiveState(state.user!.copyWith(professions: professionsList)));
    });
  }
}
