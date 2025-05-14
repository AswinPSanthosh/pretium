import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/auth_screens/login.dart';
import 'package:pretium/providers.dart';

class SignupPage extends ConsumerWidget {
  final double scaleFactor;
  const SignupPage({super.key, required this.scaleFactor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(obscureTextProvider);
    final terms = ref.watch(termsProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: scaleFactor * 0.35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: scaleFactor * 0.2),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: scaleFactor * 0.2,
                  ),
                ),
                SizedBox(height: scaleFactor * 0.3),
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: scaleFactor * 0.25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: scaleFactor * 0.1),
                Text(
                  'Simplify your crypto payments with us',
                  style: TextStyle(
                    fontSize: scaleFactor * 0.14,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: scaleFactor * 0.3),
                Container(
                  height: scaleFactor * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(scaleFactor * 0.062),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: scaleFactor * 0.15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Color(0xFF0B6766),
                          size: scaleFactor * 0.195,
                        ),
                        SizedBox(width: scaleFactor * 0.1),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                fontSize: scaleFactor * 0.13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: scaleFactor * 0.2),
                Container(
                  height: scaleFactor * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(scaleFactor * 0.062),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: scaleFactor * 0.15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Color(0xFF0B6766),
                          size: scaleFactor * 0.195,
                        ),
                        SizedBox(width: scaleFactor * 0.1),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                fontSize: scaleFactor * 0.13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: scaleFactor * 0.2),
                Container(
                  height: scaleFactor * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(scaleFactor * 0.062),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: scaleFactor * 0.15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Color(0xFF0B6766),
                          size: scaleFactor * 0.195,
                        ),
                        SizedBox(width: scaleFactor * 0.1),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontSize: scaleFactor * 0.13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: scaleFactor * 0.2),
                Container(
                  height: scaleFactor * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(scaleFactor * 0.062),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: scaleFactor * 0.15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock_outline,
                          color: Color(0xFF0B6766),
                          size: scaleFactor * 0.195,
                        ),
                        SizedBox(width: scaleFactor * 0.1),
                        Expanded(
                          child: TextField(
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: scaleFactor * 0.13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(obscureTextProvider.notifier).state =
                                !obscureText;
                          },
                          child: Icon(
                            obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                            size: scaleFactor * 0.195,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: scaleFactor * 0.25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: scaleFactor * 0.2,
                      height: scaleFactor * 0.2,
                      child: Transform.scale(
                        scale: 1.0,
                        child: Checkbox(
                          value: terms,
                          onChanged: (value) {
                            ref.read(termsProvider.notifier).state =
                                value ?? false;
                          },
                          side: BorderSide(color: Colors.grey.shade400),
                          activeColor: Color(0xFF0B6766),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ),
                    SizedBox(width: scaleFactor * 0.05),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: scaleFactor * 0.02),
                        child: Text.rich(
                          TextSpan(
                            text: 'Accept ',
                            style: TextStyle(
                              fontSize: scaleFactor * 0.12,
                              color: Color(0xFF0B6766),
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(
                                  fontSize: scaleFactor * 0.12,
                                  color: Color(0xFF0B6766),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: scaleFactor * 0.3),
                SizedBox(
                  width: double.infinity,
                  height: scaleFactor * 0.55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0B6766),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(scaleFactor * 0.068),
                      ),
                    ),
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: scaleFactor * 0.145,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: scaleFactor * 0.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: scaleFactor * 0.12,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LoginPage(scaleFactor: scaleFactor)),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: scaleFactor * 0.12,
                          color: Color(0xFF0B6766),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: scaleFactor * 0.2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
