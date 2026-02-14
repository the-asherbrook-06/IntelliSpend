// packages
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:flutter/material.dart';

// Services
import 'package:intellispend/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscurePassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness == Brightness.light
        ? 'light'
        : 'dark';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(HugeIconsStroke.arrowLeft01),
        ),
        title: Text("Login", style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: false,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20),
              SvgPicture.asset('assets/$brightness/login.svg', width: 240),
              SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(HugeIconsStroke.mail01),
                  hintText: "Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                ),
                validator: (value) {
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!emailRegex.hasMatch(value)) {
                    return "Enter a valid email address";
                  }

                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(HugeIconsStroke.lockPassword),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: obscurePassword
                        ? Icon(HugeIconsStroke.view)
                        : Icon(HugeIconsStroke.viewOffSlash),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password should be atleast 6 characters";
                  }

                  return null;
                },
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(width: 4),
                  Text("Don't have an Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/signup');
                    },
                    child: Text("Signup"),
                  ),
                ],
              ),
              SizedBox(height: 12),
              SizedBox(
                height: kToolbarHeight * 0.9,
                width: double.infinity,
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        child: Text("Login"),
                        onPressed: () async {
                          if (!(_formKey.currentState as FormState).validate()) {
                            return;
                          }

                          try {
                            setState(() {
                              isLoading = !isLoading;
                            });

                            await AuthService().signInWithEmailAndPassword(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );

                            if (!mounted) return;
                            Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
                          } catch (e) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(e.toString())));
                          } finally {
                            setState(() {
                              isLoading = !isLoading;
                            });
                          }
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(40)),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Text("or Login with", textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoading = !isLoading;
                        });

                        await AuthService().signInWithGoogle();

                        if (!mounted) return;
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AuthService().getErrorMessage(e.toString())),
                            showCloseIcon: true,
                          ),
                        );
                      } finally {
                        setState(() {
                          isLoading = !isLoading;
                        });
                      }
                    },
                    icon: Icon(HugeIconsStroke.google),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(HugeIconsStroke.apple)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
