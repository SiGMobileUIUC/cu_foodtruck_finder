import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void setToSignUpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const LoginPage()), //Change LoginPage to SignUp Page when able
    );
  }

  @override
  void dispose() {
    // Dispose of controllers when no longer needed to free up resources
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginActivated(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username != "" && password != "") { // Add login credentials check logic here
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginPage()), //Change LoginPage to Home Page when able
      );
    } else {
      setState(() {
        errorMessage = "Incorrect username or password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13294B),
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFE84A27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => loginActivated(context),
              child: const Text("Login"),
            ),
            const SizedBox(height: 10),
            const Text(
              "Don't have an account?",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () => setToSignUpPage(context),
              child: const Text(
                "Create one now",
                style: TextStyle(
                  color: Color(0xFFE84A27),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
