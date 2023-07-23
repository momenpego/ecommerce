// ignore_for_file: must_be_immutable
import 'package:ecommerce_app/core/resources/extentions.dart';

import 'package:flutter/material.dart';

class FieldGeneralWidget extends StatefulWidget {
  bool ispass;
  bool isSecret;
  int? maxlines;
  String name;
  Function(String value) val;
  TextEditingController controller;
   FieldGeneralWidget(
      {super.key,
      required this.controller,
      required this.isSecret,
      required this.ispass,
      this.maxlines,
      required this.name,
      required this.val});

  @override
  State<FieldGeneralWidget> createState() => _FieldGeneralWidgetState();
}

class _FieldGeneralWidgetState extends State<FieldGeneralWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: context.height * 0.015, horizontal: context.height * 0.01),
      child: TextFormField(
        obscureText: widget.ispass,
        controller: widget.controller,
        validator: (value) {
          return widget.val(value!);
        },
        minLines: 1,
        maxLines: widget.maxlines ?? 1,
        decoration: InputDecoration(
          hintText: '${widget.name}..',
          label: Text(widget.name),
          suffixIcon: Visibility(
            visible: widget.isSecret,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.ispass = !widget.ispass;
                  });
                },
                icon: Icon(widget.ispass
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined)),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
