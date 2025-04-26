import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/bottom_nav_bar.dart';
import 'package:k3carcare/screens/signup_screen.dart';
import 'package:k3carcare/utils/colors.dart';
import 'package:k3carcare/widgets/curved_edges.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: KCustomCurvedEdges(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.75,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image:
                      Image.asset('assets/images/LoginSignup/login.png').image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    const Center(
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    /// Email
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 10),

                    /// Password
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: 'Password',
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    SizedBox(height: 10),

                    /// Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text('Remember Me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(color: KColors.primary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    /// Login Button
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: KColors.primary,
                          ),
                            onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                              builder: (context) => const NavigationMenu(),
                              ),
                              (route) => false,
                            );
                            },
                          child: const Text(
                            "LogIn",
                            style: TextStyle(
                              color: KColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    /// Create Account
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'New To K3 Car Care? Create Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: KColors.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
