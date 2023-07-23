part of 'signin_bloc.dart';

abstract class SigninState {}

class SigninInitial extends SigninState {}

class LoadingSingInStates extends SigninState{}


class LogInSuccessState extends SigninState{
  LogInEntitie logInModel;
  LogInSuccessState({required this.logInModel});
}

class LogInFailStates extends SigninState{
  String message;
  LogInFailStates({required this.message});
}
