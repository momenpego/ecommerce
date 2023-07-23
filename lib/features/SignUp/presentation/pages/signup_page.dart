import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:ecommerce_app/core/utils/app_snakbars.dart';
import 'package:ecommerce_app/features/SignUp/presentation/bloc/signup_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/injection_cont.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Widgets/bottom_widget.dart';
import '../../../../core/Widgets/text_fieldes.dart';
import '../../../../core/resources/app_styles.dart';
import '../../../../core/resources/route_manger.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<SignupBloc>(),
      child: Scaffold(
        appBar: AppBar(),
        body: _bulidBody(),
      ),
    );
  }

  Widget _bulidBody() {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          AppSnakBarMessages.snakbarSuccessMesage(
              context: context, message: 'Success');
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.logIn, (route) => false);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.logIn, (route) => false);
        } else if (state is SignUpErrorState) {
          AppSnakBarMessages.snakbarErrorMesage(
              context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: context.read<SignupBloc>().mykey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.2,
                ),
                FieldGeneralWidget(
                  isSecret: false,
                  val: (value) {
                    if (value.trim().isEmpty) {
                      return context.translate(key1: 'entname');
                    }
                  },
                  name: context.translate(key1: 'name')!,
                  ispass: false,
                  controller: context.read<SignupBloc>().name,
                ),
                FieldGeneralWidget(
                  isSecret: false,
                  val: (value) {
                    if (value.trim().isEmpty) {
                      return context.translate(key1: 'entemail');
                    } else if (!EmailValidator.validate(value)) {
                      return context.translate(key1: 'notemail');
                    }
                  },
                  name: context.translate(key1: 'email')!,
                  ispass: false,
                  controller: context.read<SignupBloc>().email,
                ),
                FieldGeneralWidget(
                  isSecret: false,
                  val: (value) {
                    if (value.trim().isEmpty) {
                      return context.translate(key1: 'entphone');
                    }
                  },
                  name: context.translate(key1: 'num')!,
                  ispass: false,
                  controller: context.read<SignupBloc>().phone,
                ),
                FieldGeneralWidget(
                  isSecret: true,
                  val: (value) {
                    if (value.trim().isEmpty) {
                      return context.translate(key1: 'entpass');
                    } else if (value.trim().length < 6) {
                      return context.translate(key1: 'pss');
                    }
                  },
                  name: context.translate(key1: 'pass')!,
                  ispass: true,
                  controller: context.read<SignupBloc>().password,
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.translate(key1: 'haveacc')!,
                      style: AppStyles.smallCaptions(height: context.height),
                    ),
                    SizedBox(
                      width: context.height * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.logIn, (route) => false);
                      },
                      child: Text(
                        context.translate(key1: 'login')!,
                        style: AppStyles.smallCaptions(
                            height: context.height, color: Colors.blue),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                BottomWidget(
                  isLoading: state is SignUpLoadingState,
                  name: context.translate(key1: 'signup')!,
                  onTap: () {
                    if (context
                        .read<SignupBloc>()
                        .mykey
                        .currentState!
                        .validate()) {
                      context.read<SignupBloc>().add(SignUpNowEvent());
                    } else {}
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
