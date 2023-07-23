import 'package:ecommerce_app/core/Widgets/text_fieldes.dart';
import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:ecommerce_app/core/resources/route_manger.dart';
import 'package:ecommerce_app/core/utils/app_snakbars.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Widgets/bottom_widget.dart';
import '../bloc/signin_bloc.dart';
import 'package:ecommerce_app/injection_cont.dart' as di;

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<SigninBloc>(),
      child: Scaffold(appBar: AppBar(), body: _bulidBody()),
    );
  }
}

Widget _bulidBody() {
  return BlocConsumer<SigninBloc, SigninState>(
    listener: (context, state) {
      if (state is LogInFailStates) {
        AppSnakBarMessages.snakbarErrorMesage(
            context: context, message: state.message);
      } else if (state is LogInSuccessState) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.mainPage, (route) => false);
      }
    },
    builder: (context, state) {
      return SingleChildScrollView(
        child: Form(
          key: BlocProvider.of<SigninBloc>(context).myKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.3,
              ),
              FieldGeneralWidget(
                  isSecret: false,
                  val: (value) {
                    if(value.trim().isEmpty){
                      return context.translate(key1: 'entemail');
                    }else if(!EmailValidator.validate(value)){
                      return context.translate(key1: 'notemail');
                    }
                  },
                  name: context.translate(key1: 'email')!,
                  controller: BlocProvider.of<SigninBloc>(context).email,
                  ispass: false),
              FieldGeneralWidget(
                  isSecret: true,
                  val: (value) {
                    if(value.trim().isEmpty){
                      return context.translate(key1: 'entpass');
                    }else if(value.length <6){
                      return context.translate(key1: 'pss');
                    }
                  },
                  name: context.translate(key1: 'pass')!,
                  controller: BlocProvider.of<SigninBloc>(context).password,
                  ispass: true),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.translate(key1: 'donthave')!,
                    style: AppStyles.smallCaptions(height: context.height),
                  ),
                  SizedBox(
                    width: context.height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.signUp, (route) => false);
                    },
                    child: Text(
                      context.translate(key1: 'signup')!,
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
                isLoading: state is LoadingSingInStates,
                name: context.translate(key1: 'login')!,
                onTap: () {
                  if (BlocProvider.of<SigninBloc>(context)
                      .myKey
                      .currentState!
                      .validate()) {
                    BlocProvider.of<SigninBloc>(context).add(LogInNowEvent());
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
