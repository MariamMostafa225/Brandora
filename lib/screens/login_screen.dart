import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  final Color primaryColor = const Color(0xFF3F51B5);
  final Color backgroundColor = const Color(0xFFF6F8FB);
  final Color textColor = const Color(0xFF1E232C);
  final Color greyTextColor = const Color(0xFF8391A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(//دي علشان السكرول لما الكيبورد يفتح
            padding: const EdgeInsets.symmetric(//ده بيعمل مسافات من فوق وتحت ويمين وشمال
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,//تخلي العناصر تمتد بعرض الشاشة
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.campaign,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Brandora',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Login to your Brandora account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: greyTextColor),
                ),
                const SizedBox(height: 40),

                Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                _buildTextField(
                  hintText: 'name@example.com',
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(height: 20),

                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                _buildTextField(
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 32),

                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR CONTINUE WITH',
                        style: TextStyle(
                          color: greyTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: _buildSocialButton(
                        icon: Icons.g_mobiledata,
                        label: 'Google',
                        iconColor: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSocialButton(
                        icon: Icons.apple,
                        label: 'Apple',
                        iconColor: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: greyTextColor),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: primaryColor,
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

  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword ? _obscurePassword : false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: Icon(prefixIcon, color: Colors.grey.shade500, size: 22),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.shade500,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color iconColor,
  }) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: textColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      icon: Icon(icon, color: iconColor, size: 24),
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}
