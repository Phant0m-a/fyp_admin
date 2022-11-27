import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

import '../../constants/style.dart';
import '../../widgets/textformfeild.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        centerTitle: true,
        elevation: 0,
      ),
      body: AnimateGradient(
        duration: const Duration(seconds: 15),
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors:  [
          primary,
          secondary.withOpacity(0.1),
          Colors.white,
        ],
        secondaryColors:  [
          primary.withOpacity(0.5),
          Colors.white,
          secondary.withOpacity(0.3),

        ],
        child: Center(
          child: Container(
            width: size.width / 3,
            height: size.width / 3,
            child: Card(
              elevation: 6,
              shape: Border.all(
                color: secondary,
                width: 1,
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //image
                      Image.asset('assets/apple-logo.png', width: 60,height: 60),
                      
                      Text("Admin App", style: MyTextStyles.headingLargePrimary,),
                      Column(
                        children: const [

                           CustomTextFormField(
                             validator: "Enter user Name",
                            maxLines: 1,
                            labelText: "User Name",
                            obscureText: false,
                             icon: Icon(Icons.person_outline),
                          ),
                           CustomTextFormField(

                            maxLines: 1,
                            labelText: "Password",
                             icon: Icon(Icons.vpn_key_outlined),
                            obscureText: true,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {

                            },
                            child: const Text('Login'),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
