import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_singleton/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

// Events handler: get event, emit state
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {});
  }
}
