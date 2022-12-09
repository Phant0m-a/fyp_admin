import 'dart:developer';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fypadmin/services/firebase_services.dart';
import 'package:fypadmin/views/home/home.dart';

import '../../constants/style.dart';
import '../../widgets/textformfeild.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const id = 'login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

 bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  var _usernameTextController = TextEditingController();
  var _passwordTextController = TextEditingController();

  Future doc() {
    return FirebaseFirestore.instance
        .collection('messages')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.data());
            }));
  }

  @override
  void initState() {
    doc();

    super.initState();
  }

  final Services _services = Services();

  //login method
  // _login(context) async {
  //   print('in servcies');
  //   _services
  //       .getAdminCredentials()
  //       .then((snapshot) => snapshot.docs.forEach((doc) async {
  //             if (doc.get('name') == username) {
  //               print(doc.get('name'));
  //               print(doc.get('password'));
  //               if (doc.get('password') == password) {
  //                 print(doc.get('password'));
  //                 // production commits
  //                 //
  //                 UserCredential userCredential =
  //                     await FirebaseAuth.instance.signInAnonymously();
  //                 print(userCredential.user.toString());
  //                 if (userCredential.user!.uid != null) {
  //                   // FirebaseAuth.instance.signInAnonymously()
  //                   Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) => const HomeScreen()));
  //                   return;
  //                 } else {
  //                   // ignore: use_build_context_synchronously
  //                   _showDialog(context, 'Login error', 'Login Error');
  //                   print('bruh ... uid is not null');
  //                 }
  //               } else {
  //                 _showDialog(context, 'incorrect password', 'Login Error');
  //                 print('invalid password');
  //               }
  //             } else {
  //               _showDialog(context, 'user not found', 'Login Error');
  //               print('user not found lol!');
  //             }
  //           }));
  // }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    //new auth
   Future<void> _auth_admin({ username, password})async{
     // progressDialog.show();
     setState(() {
       isLoading = true;
     });
     _services.getAdminCredentials(username).then((value)async{
       if(value.exists){
         if(value['username'] == username && value['password'] == password){
           print('hello!,'+ value['username']);

           //do auth if record of user is found
           try{
             UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
             if(userCredential != null){
               //if success go to home screen!
               setState(() {
                 isLoading = false;
               });
                Navigator.pushReplacementNamed(context, HomeScreen.id);
             }


             // if failure
           }catch(e){  _showDialog(context, e.toString(),'Login Failed');}

           // progressDialog.dismiss();
           setState(() {
             isLoading = false;
           });
           return;
         }else{
           _showDialog(context, 'invalid Username or Password', 'Login Error');
           return;
         }

       }
     });
   }




    // auth end

    return Scaffold(
      // key: _formKey,
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
        primaryColors: [
          primary,
          secondary.withOpacity(0.1),
          Colors.white,
        ],
        secondaryColors: [
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
                // key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //image
                      // Image.asset(
                      //   'assets/apple-logo.png',
                      // ),
                      Visibility(visible: isLoading, child: CircularProgressIndicator())

                      ,

                      Text(
                        "Admin App",
                        style: MyTextStyles.headingLargePrimary,
                      ),
                      Column(
                        children: [
                          CustomTextFormField(
                            // onChange: (value) {
                            //   setState(() {
                            //     print(username);
                            //     username = value;
                            //   });
                            // },
                            controller: _usernameTextController,
                            validator: "Enter user Name",
                            maxLines: 1,
                            labelText: "User Name",
                            obscureText: false,
                            icon: Icon(Icons.person_outline),
                          ),
                          CustomTextFormField(
                            // onChange: (value) {
                            //   setState(() {
                            //     print(password);
                            //     password = value;
                            //   });
                            // },
                            controller: _passwordTextController,
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
                              child: MaterialButton(
                            onPressed: () async {
                              print('inlogin');
                              await _auth_admin(username: _usernameTextController.text,password: _passwordTextController.text);


                              // login(context);
                              // if (_formKey.currentState?.validate()) {
                              // } else {
                              //   print('not validated');
                              // }
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

// future dialog but
void _showDialog(BuildContext context, String message, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text(title),
        content: new Text(message),
        actions: <Widget>[
          MaterialButton(
            child: new Text("Try Again"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
