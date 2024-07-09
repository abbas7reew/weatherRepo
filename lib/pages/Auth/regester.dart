import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather_app/pages/Auth/login.dart';

class RegesterPage extends StatefulWidget {
  const RegesterPage({super.key});

  @override
  State<RegesterPage> createState() => _RegesterState();
}

class _RegesterState extends State<RegesterPage> {

  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading=false;
  Future<void>  regester() async{
    try {
      UserCredential user =await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success"),),);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
               key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: SvgPicture.asset("asset/logo.svg",color: Colors.red,height: 150,width: 150,)),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:  CrossAxisAlignment.end,
                    children: [
                      Text("REGESTER",style: TextStyle(fontSize: 26,color: Colors.red,fontWeight: FontWeight.bold),),
                    ],),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (value){
                      email=value;
                    },
                     validator: (data) {
                       if (data!.isEmpty) {
                         return 'field is required';
                       }
                     },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
              
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
              
                  TextFormField(
                    onChanged: (value){
                      password=value;
                    },
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'field is required';
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.password),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
              
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
              
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.all(16),
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed:() async{
                              if(formKey.currentState!.validate()) {
                                isLoading=true;
                                setState(() {
                        
                                });
                                await regester();
                                isLoading=false;
                                setState(() {
                        
                                });
                              }
                            } , child: Text("REGEStER".toUpperCase(),
                          style: TextStyle(color: Colors.white),)),
                      ),
                    ],),
              
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
