// ignore_for_file: must_be_immutable
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldsWidget extends StatefulWidget {
  String name;
  TextEditingController controller;
  bool ispass;
  bool isEmail;
  bool isShow;
  TextFormFieldsWidget(
      {super.key,
      required this.isEmail,
      required this.isShow,
      required this.name,
      required this.controller,
      required this.ispass});

  @override
  State<TextFormFieldsWidget> createState() => _TextFormFieldsWidgetState();
}

class _TextFormFieldsWidgetState extends State<TextFormFieldsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        context.height * 0.01,
      ),
      child: TextFormField(
        obscureText: widget.isShow,
        validator: (value) {
          if (widget.isEmail) {
            if (!EmailValidator.validate(value!)) {
              return 'please enter valid email';
            } else if (value.isEmpty) {
              return 'please enter ${widget.name}';
            }return null;
          } else {
            if (value!.isEmpty) {
              return 'please enter ${widget.name}';
            }else if(value.length <6){
              return 'password must be 6 words';
            }
            return null;
          }
        },
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon: Visibility(
              visible: widget.ispass,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isShow = !widget.isShow;
                    });
                  },
                  icon: Icon(widget.isShow
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined)),
            ),
            labelText: widget.name,
            hintText: '${widget.name}...',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
