import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  // Function to check if the form is valid
  bool isFormValid() {
    return usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  // Function to sign the user in
  void signUserIn(BuildContext context) {
    if (isFormValid()) {
      // Add your sign-in logic here
      // If the form is valid, perform sign-in
      // ...
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // If the form is not valid, show an error message or handle it accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Both fields are required.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Make the scaffold background transparent
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'path_to_your_background_image.jpg'), // Set your background image path here
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Logo with animation
                  TweenAnimationBuilder(
                    duration: Duration(seconds: 1),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (_, double value, __) {
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.8),
                                spreadRadius: 25,
                                blurRadius: 0,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset(
                              'lib/icons/logo.png',
                              width: 65,
                              height: 65,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 80),

                  // Welcome back, you've been missed!
                  Text(
                    'Welcome back you\'ve  been\n missed!',
                    style: GoogleFonts.bebasNeue(
                      // Apply Poppins font
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 224, 222, 222),
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Username textfield
                  Container(
                    width: 330, // Adjust the width as needed
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.white, // White border color
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.white, // White border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.white, // White border color
                          ),
                        ),
                        labelStyle: GoogleFonts.poppins(
                          // Apply Poppins font
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(
                                255, 255, 255, 255), // White text color
                          ),
                        ),
                        hintStyle: GoogleFonts.poppins(
                          // Apply Poppins font
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(
                                255, 255, 255, 255), // White text color
                          ),
                        ),
                      ),
                      style: GoogleFonts.poppins(
                        // Apply Poppins font
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(
                              255, 255, 255, 255), // White text color
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Password textfield with visibility toggle
                  Container(
                    width: 330, // Adjust the width as needed
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.white, // White border color
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.white, // White border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.white, // White border color
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        labelStyle: GoogleFonts.poppins(
                          // Apply Poppins font
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(
                                255, 255, 255, 255), // White text color
                          ),
                        ),
                        hintStyle: GoogleFonts.poppins(
                          // Apply Poppins font
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(
                                255, 255, 255, 255), // White text color
                          ),
                        ),
                      ),
                      style: GoogleFonts.poppins(
                        // Apply Poppins font
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(
                              255, 255, 255, 255), // White text color
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Sign-in button with tap animation
                  InkWell(
                    onTap: () {
                      signUserIn(context);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 1, end: 0.95),
                      duration: Duration(milliseconds: 160),
                      builder: (_, double scale, __) {
                        return Transform.scale(
                          scale: scale,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 125),
                            decoration: BoxDecoration(
                              color: isFormValid()
                                  ? Color.fromARGB(255, 19, 19, 19)
                                  : const Color.fromARGB(255, 27, 27, 27),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check, // Checkmark icon
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Log In",
                                    style: GoogleFonts.poppins(
                                      // Apply Poppins font
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // "Made with love" icon and "by Yasser"
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Made by yasxEd',
                        style: GoogleFonts.poppins(
                          // Apply Poppins font
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 231, 231, 231),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.add_moderator,
                        color: Color.fromARGB(255, 232, 232, 232),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
