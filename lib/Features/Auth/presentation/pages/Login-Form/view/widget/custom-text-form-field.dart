import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.maxLines,
    required this.title,
    this.isPassword = false,
  });

  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final int? maxLines;
  final String title;
  final void Function(String?)? onSaved;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: widget.inputType,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword ? _isObscure : false,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.title,
        filled: true,
        fillColor: const Color(0xffF7FAF9),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromARGB(255, 231, 231, 231)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromARGB(255, 231, 231, 231)),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
      ),
    );
  }
}
