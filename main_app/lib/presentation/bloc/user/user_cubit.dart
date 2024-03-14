 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_app/data/models/users.dart';

class UserCubit extends Cubit<User> {
  UserCubit() : super(User());

  update(User n) => emit(n);
}
