import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/screens/signup_screen.dart';
import 'package:k3carcare/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 234, 231),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: KColors.grey),
                child: Image(image: Image.asset('assets/images/LoginSignup/login.png').image, fit: BoxFit.cover,),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.9,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: 10,
                  ),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 183, 183, 183),
                  ),
                  child: Column(
                    children: [
                      const Text("Welcome Back", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      const Text("We know you care about your Car,\nthat's why you're HERE.", style: TextStyle(color: Color.fromARGB(255, 88, 88, 88) ,fontSize: 13, fontWeight: FontWeight.w500),textAlign: TextAlign.center, ),
                      const LogInForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 8),
    
            /// Password
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: 'Password',
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: 8),
    
            /// Remember me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text('Remember Me'),
                  ],
                ),
    
                /// Forget Password
                TextButton(
                  onPressed: () {},
                  //  => Get.to(() => const ForgotPassword()),
                  child: Text('Forget Password', style: TextStyle(color: KColors.primary),),
                ),
              ],
            ),
    
            /// Sign In Button
            SizedBox(
              width: MediaQuery.of(context).size.width/2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: KColors.primary),
                onPressed:
                    () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_)=> const NavigationMenu()));
                    },
                child: const Text("LogIn", style: TextStyle(color: KColors.white, fontWeight: FontWeight.bold, fontSize: 15),),
              ),
            ),
    
            /// Create Account Button
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignupScreen()));
              },
              child: Text('New to K3 Car Care? Create Account', textAlign: TextAlign.center, style: TextStyle(color: KColors.primary),),
            ),
          ],
        ),
      ),
    );
  }
}
