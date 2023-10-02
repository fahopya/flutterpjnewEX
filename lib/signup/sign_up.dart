// import 'package:flutter/material.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_iconbutton.dart';
import 'package:onboarding_screen/component/my_textbutton.dart';
//import 'package:onboarding_screen/component/my_textbutton.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code:${e.code}');
      print(e.message);

      if (e.code == 'invalid-email') {
        print('No user found for that email.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTAILS') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signUpuser() async {
    if (emailController.text != "" && passwordController.text != "") {
      print("It's ok");
    } else {
      print("Please input your email ad password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "Welcome to register!",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please sign up with your email and password.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  controller: nameController,
                  HintText: 'Please input your name',
                  LabelText: 'Name',
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: emailController,
                  HintText: 'Enter your email',
                  LabelText: 'Email',
                  obscureText: false),
              const SizedBox(height: 25),
              MyTextField(
                  controller: passwordController,
                  HintText: 'Enter your password',
                  LabelText: 'Password',
                  obscureText: true),
              const SizedBox(height: 25),
              MyTextField(
                  controller: passwordController,
                  HintText: 'Confirm your password',
                  LabelText: 'confirm your password',
                  obscureText: true),
              const SizedBox(height: 25),
              // const MyTextButton(
              //   labelText: 'Forgot password?',
              //   pageRoute: 'Forgot',
              // ),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                  onTap: createUserWithEmailAndPassword, hintText: 'Sign Up'),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'already have member',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyIconButton(imagePath: 'assets/image/2.png'),
                  SizedBox(
                    width: 10,
                  ),
                  MyIconButton(imagePath: 'assets/image/3.webp')
                ],
              ),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextButton(
                      labelText: 'Sign in',
                      pageRoute: 'SignIn',
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
