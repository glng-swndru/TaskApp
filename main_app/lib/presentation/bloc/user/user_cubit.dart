import 'package:main_app/data/models/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<User> {
  UserCubit() : super(User());

  update(User n) => emit(n);
}
