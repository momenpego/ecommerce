part of 'signup_bloc.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignUpLoadingState extends SignupState {}

class SignUpSuccessState extends SignupState {
  SignUpEntitie entitie;
  SignUpSuccessState({required this.entitie});
}

class SignUpErrorState extends SignupState {
  String message;
  SignUpErrorState({required this.message});
}
