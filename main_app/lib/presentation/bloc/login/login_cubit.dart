import 'package:d_session/d_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_app/common/enums.dart';
import 'package:main_app/data/source/user_source.dart';

import '../../../data/models/users.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState(null, RequestStatus.init));

  clickLogin(String email,String password) async {
    User? result = await UserSource.login(email, password);
    if(result==null) {
      emit(LoginState(null, RequestStatus.failed));
    } else {
      DSession.setUser(result.toJson());
      emit(LoginState(result, RequestStatus.success));
    }
  }
}
