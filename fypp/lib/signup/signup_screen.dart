import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fypp/login/login_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 110),
              const Text(
                'TherapyAI',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 80),
              const Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Enter your email to sign up for TherapyAI',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextField(hintText: 'example@domain.com'),
              const SizedBox(height: 20),
              const CustomTextField(hintText: '*********', isPassword: true),
              const SizedBox(height: 18),
              CustomButton(
                onNext: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CreatePasswordScreen(),
                  //   ),
                  // );
                },
                text: 'Sign up with Email',
                color: Colors.black,
                googleButton: false,
                textColor: Colors.white,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 23),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?   ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 17,
                  right: 17,
                  top: 20,
                  bottom: 25,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 1,
                      color: Colors.black12,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        'or continue with',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                onNext: () {},
                text: 'Google',
                color: Colors.grey.shade300,
                googleButton: true,
                textColor: Colors.black,
                icon: 'assets/image/google.png',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 23),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'By clicking Sign up, you agree to our  ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms of Service ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onNext;
  final String text;
  final Color color;
  final bool googleButton;
  final bool nextButton;
  final String? icon;
  final Color textColor;
  final Color? borderSideColor;
  final double? elevation;
  final int? height;
  final int? fontSize;

  const CustomButton({
    super.key,
    required this.onNext,
    required this.text,
    required this.color,
    required this.googleButton,
    this.icon,
    this.nextButton = false,
    required this.textColor,
    this.borderSideColor,
    this.elevation = 0.0,
    this.height,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          backgroundColor: color,
          shadowColor: Colors.grey,
          elevation: googleButton ? 0 : elevation,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: googleButton
                ? BorderSide(color: Colors.grey[300]!)
                : borderSideColor != null
                    ? BorderSide(color: borderSideColor!)
                    : const BorderSide(color: Colors.transparent),
          ),
        ),
        onPressed: onNext,
        child: googleButton
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Image.asset(icon!,
                        height: 25, width: 25, fit: BoxFit.cover),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor,
                        fontSize: fontSize!.toDouble(),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: nextButton
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize!.toDouble(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (nextButton)
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 22,
                    ),
                ],
              ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;

  final bool isPassword;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.controller,
    this.prefixIcon,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black54,
      textInputAction: TextInputAction.next,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? isObscure : false,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black26,
                ),
              )
            : null,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        labelStyle:
            const TextStyle(color: Colors.black38, fontWeight: FontWeight.w400),
        hintStyle:
            const TextStyle(color: Colors.black38, fontWeight: FontWeight.w400),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 15, right: 15),
      ),
    );
  }
}
