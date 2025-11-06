import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lra/features/app/page_names.dart';
import 'package:lra/features/login/presentation/cubit/auth_cubit.dart';
import 'package:lra/features/login/presentation/cubit/auth_state.dart';

class RegisterPageScreen extends StatefulWidget {
  const RegisterPageScreen({super.key});

  @override
  State<RegisterPageScreen> createState() => _RegisterPageScreenState();
}

class _RegisterPageScreenState extends State<RegisterPageScreen> {
  final formKey2 = GlobalKey<FormState>();

  final blankFocusNode = FocusNode();
  String email = '';
  String password = '';
  String name = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register page'), centerTitle: true),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.user?.token != null) {
            context.goNamed(PageNames.homePage);
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text(
                    state.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(blankFocusNode);
            },
            child: Center(
              child: Form(
                key: formKey2,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          }
                          return RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                              ).hasMatch(value)
                              ? null
                              : 'Please enter a valid email';
                        },
                        builder: (FormFieldState<String> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: emailController,
                                onChanged: (emailValue) {
                                  field.didChange(emailValue);
                                  email = emailValue;
                                },
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Enter email',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  errorText: field.errorText,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      FormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          return value.length > 5
                              ? null
                              : 'Please enter a password of at least 6 characters';
                        },
                        builder: (FormFieldState<String> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: passwordController,
                                onChanged: (passwordValue) {
                                  field.didChange(passwordValue);
                                  password = passwordValue;
                                },
                                obscureText: true,
                                obscuringCharacter: '*',
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Enter password',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  errorText: field.errorText,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      FormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name cannot be empty';
                          }
                          return value.length > 2
                              ? null
                              : 'Please enter a name of at least 3 characters';
                        },
                        builder: (FormFieldState<String> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: nameController,
                                onChanged: (nameValue) {
                                  field.didChange(nameValue);
                                  name = nameValue;
                                },
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Enter name',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  errorText: field.errorText,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      state.loading
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                              backgroundColor: Colors.white,
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (formKey2.currentState!.validate()) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(blankFocusNode);
                                  context.read<AuthCubit>().register(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text,
                                    'EMAIL',
                                  );
                                  emailController.clear();
                                  passwordController.clear();
                                  nameController.clear();
                                  formKey2.currentState!.reset();
                                  email = '';
                                  password = '';
                                  name = '';
                                }
                              },
                              child: Text('Register'),
                            ),
                      GestureDetector(
                        onTap: () => context.goNamed(PageNames.loginPage),
                        child: Text(
                          'Already have an account? Log in',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
