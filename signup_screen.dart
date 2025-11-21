import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static const Color grad1 = Color(0xFF489FEE);
  static const Color grad2 = Color(0xFF235EA2);
  static const Color fieldColor = Color(0xFFEBDDF9);
  static const Color iconBlue = Color(0xFF5391E3);
  static const Color actionBlue = Color(0xFF1C69BD);

  final TextEditingController fullNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double formWidth = screenWidth < 420 ? screenWidth * 0.92 : 380;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [grad1, grad2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: formWidth,
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 26),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(40),
                ),

                child: Column(
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Fill the details to sign up",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(height: 26),

                    // Full Name
                    _inputField(
                      "Full Name",
                      Icons.person,
                      controller: fullNameCtrl,
                    ),
                    const SizedBox(height: 14),

                    // Email
                    _inputField(
                      "Email",
                      Icons.email,
                      controller: emailCtrl,
                    ),
                    const SizedBox(height: 14),

                    // Password field with eye icon
                    _inputField(
                      "Password",
                      Icons.lock,
                      controller: passCtrl,
                      obscure: !showPassword,
                      suffix: IconButton(
                        icon: Icon(
                          showPassword ? Icons.visibility : Icons.visibility_off,
                          color: iconBlue,
                        ),
                        onPressed: () {
                          setState(() => showPassword = !showPassword);
                        },
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Confirm Password
                    _inputField(
                      "Confirm Password",
                      Icons.lock_outline,
                      controller: confirmPassCtrl,
                      obscure: !showConfirmPassword,
                      suffix: IconButton(
                        icon: Icon(
                          showConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: iconBlue,
                        ),
                        onPressed: () {
                          setState(() => showConfirmPassword =
                          !showConfirmPassword);
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: actionBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    Row(
                      children: const [
                        Expanded(child: Divider(color: Colors.white38)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Or",
                              style: TextStyle(color: Colors.white70)),
                        ),
                        Expanded(child: Divider(color: Colors.white38)),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Google Button
                    Container(
                      width: double.infinity,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign in with Google",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(
      String hint,
      IconData icon, {
        bool obscure = false,
        TextEditingController? controller,
        Widget? suffix,
      }) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: iconBlue),
          suffixIcon: suffix,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black54),
          border: InputBorder.none,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        ),
      ),
    );
  }
}
