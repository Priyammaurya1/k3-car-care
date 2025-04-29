import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/bottom_nav_bar.dart';
import 'package:k3carcare/screens/login_screen.dart';
import 'package:k3carcare/utils/colors.dart';
import 'package:k3carcare/widgets/curved_edges.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                      Image.asset('assets/images/LoginSignup/signup.png').image,
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
                        "Register",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // const SizedBox(height: ),

                    /// Name
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.personalcard),
                        labelText: 'Name',
                      ),
                    ),
                    // const SizedBox(height: 10),

                    /// Email
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: 'Email',
                      ),
                    ),
                    // const SizedBox(height: 16),

                    /// Phone Number
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.call),
                        labelText: 'Phone Number',
                        counterText: '',
                      ),
                    ),
                    // const SizedBox(height: 16),

                    /// Password
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: 'Password',
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: 16),

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
                            "SignIn",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Create Account
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Already have an account? Login',
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
