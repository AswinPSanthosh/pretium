import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/auth_screens/sign_up.dart';
import 'package:pretium/providers.dart';

class LoginPage extends ConsumerWidget {
  final double scaleFactor;
  const LoginPage({super.key, required this.scaleFactor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscurePassword = ref.watch(obscureTextProvider);
    final rememberMe = ref.watch(rememberMeProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: scaleFactor * 0.35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: scaleFactor * 0.6,
                  height: scaleFactor * 0.6,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5F0ED),
                    borderRadius: BorderRadius.circular(scaleFactor * 0.15),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: Color(0xFF0B6766),
                      size: scaleFactor * 0.3,
                    ),
                  ),
                ),
                SizedBox(height: scaleFactor * 0.3),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: scaleFactor * 0.25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: scaleFactor * 0.1),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: scaleFactor * 0.15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: scaleFactor * 0.4),
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
                            obscureText: obscurePassword,
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
                                !obscurePassword;
                          },
                          child: Icon(
                            obscurePassword
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
                SizedBox(height: scaleFactor * 0.16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: scaleFactor * 0.2,
                          height: scaleFactor * 0.2,
                          child: Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              ref.read(rememberMeProvider.notifier).state =
                                  value ?? false;
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: BorderSide(color: Colors.grey.shade400),
                            activeColor: Color(0xFF0B6766),
                          ),
                        ),
                        SizedBox(width: scaleFactor * 0.05),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: scaleFactor * 0.12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: scaleFactor * 0.12,
                          color: Color(0xFF0B6766),
                          fontWeight: FontWeight.w500,
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
                      'Login',
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
                      'Don\'t have an account?',
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
                                  SignupPage(scaleFactor: scaleFactor)),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: scaleFactor * 0.12,
                          color: Color(0xFF0B6766),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
