
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final IconData icon;
  final String labelText;
  final bool isPassWord;
  final TextEditingController textEditingController;

  CustomPasswordField({required this.icon, required this.labelText,
    required this.isPassWord, required this.textEditingController});

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late bool _obscureText;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassWord;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(5.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.white,
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: widget.isPassWord?IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: _toggleVisibility,
        ):null,
      ),
      style: TextStyle(color: Colors.white),
      validator: (value){
        return "dsfsdf";
      },
    );
  }
}