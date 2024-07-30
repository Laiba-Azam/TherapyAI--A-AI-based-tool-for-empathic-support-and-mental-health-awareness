import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fypp/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              const SizedBox(height: 60),
              const Text(
                'Sign in to your account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Enter your email to sign in to TherapyAI',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const CustomTextField(hintText: 'example@domain.com'),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                hintText: '**********',
                isPassword: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onNext: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const BusinessScreen(),
                  //   ),
                  // );
                },
                text: 'Sign in with Email',
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
                      text: 'Don\'n have an account?   ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
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
                    text: 'By continuing, you agree to our ',
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
























//  import 'package:flutter/material.dart';
// import 'package:fypp/services/functions/authFunctions.dart'; // Ensure this path is correct

// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();

//   String email = '';
//   String password = '';
//   String fullname = '';
//   bool login = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text('Login'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.all(14),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // ======== Full Name ========
//               if (!login) 
//                 TextFormField(
//                   key: ValueKey('fullname'),
//                   decoration: InputDecoration(
//                     hintText: 'Enter Full Name',
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter Full Name';
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (value) {
//                     setState(() {
//                       fullname = value!;
//                     });
//                   },
//                 ),

//               // ======== Email ========
//               TextFormField(
//                 key: ValueKey('email'),
//                 decoration: InputDecoration(
//                   hintText: 'Enter Email',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty || !value.contains('@')) {
//                     return 'Please Enter a valid Email';
//                   } else {
//                     return null;
//                   }
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     email = value!;
//                   });
//                 },
//               ),

//               // ======== Password ========
//               TextFormField(
//                 key: ValueKey('password'),
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Enter Password',
//                 ),
//                 validator: (value) {
//                   if (value!.length < 6) {
//                     return 'Please Enter a Password of min length 6';
//                   } else {
//                     return null;
//                   }
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     password = value!;
//                   });
//                 },
//               ),
              
//               SizedBox(height: 30),

//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     login
//                         ? AuthServices.signinUser(email, password, context)
//                         : AuthServices.signupUser(email, password, fullname, context);
//                   }
//                 },
//                 child: Text(login ? 'Login' : 'Signup'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 55),
//                 ),
//               ),

//               SizedBox(height: 10),

//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     login = !login;
//                   });
//                 },
//                 child: Text(login
//                     ? "Don't have an account? Signup"
//                     : "Already have an account? Login"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
