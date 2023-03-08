import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'home_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80'),
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'welcome',
                    style: TextStyle(
                      color: Color.fromARGB(255, 54, 52, 52),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 150,
                ),
                const Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                TextFormField(
                  controller: namecontroller,
                  validator: (value) {
                    if (namecontroller.text.isEmpty) {
                      return "name can't be empty";
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'name',
                    prefixIcon: Icon(Icons.person,
// ignore: non_constant_identifier_names
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (emailcontroller.text.isEmpty) {
                      return "Email can't be empty";
                    }
                    if (emailcontroller.text.trim().length < 8) {
                      return 'input gimal.com';
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'email',
                    prefixIcon: Icon(Icons.email,
// ignore: non_constant_identifier_names
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  validator: (value) {
                    if (passwordcontroller.text.isEmpty) {
                      return "Password can't be empty";
                    }
                    if (passwordcontroller.text.trim().length < 6) {
                      return 'weakpassword';
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                    prefixIcon: Icon(Icons.password,
// ignore: non_constant_identifier_names
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      print('valed');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              Homepage(username: emailcontroller.text),
                        ),
                      );
                    } else {
                      print('notvaled');
                    }
                  },
                  child: Text(
                    '         login         ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 2,
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'forgot password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
