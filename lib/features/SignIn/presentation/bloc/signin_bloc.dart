// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce_app/core/SharedPref/shared_helper.dart';
import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/SignIn/domain/entities/login_entitie.dart';
import 'package:ecommerce_app/features/SignIn/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  LogInUseCase logInUseCase;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> myKey = GlobalKey<FormState>();
  SigninBloc({required this.logInUseCase}) : super(SigninInitial()) {
    on<SigninEvent>((event, emit) async {
      if (event is LogInNowEvent) {
        emit(LoadingSingInStates());
        final logInOrFail =
            await logInUseCase.call(email: email.text, password: password.text);
        logInOrFail.fold(
            (failure) => {
                  emit(LogInFailStates(
                      message: _MessageOfFailure(failure: failure)))
                }, (logInModel) async {
          emit(LogInSuccessState(logInModel: logInModel));
          await SharedHelper.setstring(
              key: 'TOKEN', value: logInModel.data.token.toString());
        });
      }
    });
  }
  String _MessageOfFailure({required Failure failure}) {
    switch (failure.runtimeType) {
      case WrongDataFailure:
        return 'wrong data';
      case OfflineFailure:
        return 'check your internet';
      default:
        return 'try again later';
    }
  }
}
