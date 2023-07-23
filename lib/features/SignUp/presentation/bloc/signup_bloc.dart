// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce_app/core/errors/failurs.dart';
import 'package:ecommerce_app/features/SignUp/domain/entities/sign_up_entitie.dart';
import 'package:ecommerce_app/features/SignUp/domain/usecases/sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignUpUseCase signUp;
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  SignupBloc({required this.signUp}) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignUpNowEvent) {
        emit(SignUpLoadingState());
        final signUpOrFail = await signUp.call(
            name: name.text,
            phone: phone.text,
            email: email.text,
            password: password.text);
        signUpOrFail.fold(
            (failure) => {
                  emit(SignUpErrorState(
                      message: _MessageOfFail(failure: failure)))
                },
            (data) => {emit(SignUpSuccessState(entitie: data))});
      }
    });
  }
  String _MessageOfFail({required Failure failure}) {
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
