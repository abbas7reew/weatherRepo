import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather_app/Cubit/weatherCubit/weather_cubit.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/pages/Auth/regester.dart';

import 'package:weather_app/pages/weather_page/home.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;
  bool isLoading=false;
  GlobalKey<FormState> formKey = GlobalKey();
  Future<void>  LogIn() async{
    try {
      UserCredential user= await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!,
          password: password!
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("success"),),
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherPage(),));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: (){
                    BlocProvider.of<WeatherCubit>(context).changeMode();
                    BlocProvider.of<WeatherCubit>(context).changeIcon();
                  },
                  icon: Icon(BlocProvider.of<WeatherCubit>(context).iconBool?
                  BlocProvider.of<WeatherCubit>(context).lightIcon:BlocProvider.of<WeatherCubit>(context).darkIcon),
                  label: Text("Mood") ,
                ),
              ),
            ),

            actions: [
              TextButton(onPressed:()=>BlocProvider.of<WeatherCubit>(context).changeLanguage('ar'),
                  child: Text('Arabic')),
              SizedBox(width: 20,),
              TextButton(onPressed:()=> BlocProvider.of<WeatherCubit>(context).changeLanguage('en'), child: Text('English')),
            ],
          ),
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
                      Text(S.of(context).log,style: TextStyle(fontSize: 26,color: Colors.red,fontWeight: FontWeight.bold),),
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
                        fillColor:BlocProvider
                            .of<WeatherCubit>(context)
                            .isLight ? Colors.white : Colors.black,
        
                        filled: true,
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
        
                          borderSide: BorderSide(color: Colors.red),
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
                      obscureText: true,
                      onChanged: (value){
                        password=value;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'field is required';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: BlocProvider
                            .of<WeatherCubit>(context)
                            .isLight ? Colors.white : Colors.black,
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
                          await  LogIn();
                      isLoading=false;
                      setState(() {
                
                      });
                                }
                            } , child: Text(S.of(context).log.toUpperCase(),
                          style: TextStyle(color: Colors.white),)),
                      ),
                    ],),
                    SizedBox(height: 20,),
                
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("do not have an account"),
                          SizedBox(width: 20,),
                        GestureDetector(
                          onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegesterPage(),));
                          },
                            child: Text(S.of(context).regester,style: TextStyle(color: Colors.red),)),
                      ],),
                    ),
                
                
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
