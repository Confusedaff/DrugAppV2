//import 'package:drugapp/Auth/auth_service.dart';
import 'package:drugapp/services/Authf/auth_service.dart';
import 'package:drugapp/components/loginpage/mytextfield.dart';
import 'package:drugapp/components/loginpage/signupbutton.dart';
import 'package:drugapp/components/loginpage/squaretile.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {

//final authService = AuthService();

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

bool? ischecked = false;
bool? ischecked1 = false;

bool obscure = true;
bool obscure1 = true;
IconData eyeButton = Icons.visibility;
IconData eyeButton1 = Icons.visibility;

void signUp(BuildContext context) async{

 //final email = emailController.text;
  final password = passwordController.text;
  final confirmPassword = confirmPasswordController.text;

  final auth = AuthService();
  try{
     auth.signUpWithEmailPassword(
    emailController.text,
    passwordController.text);
    Navigator.pop(context);
  }catch(e){
    if(mounted){
   ScaffoldMessenger.of(context).showSnackBar
    (SnackBar(content: Text("Error: $e")));
   }
  }
 
  
  if (password != confirmPassword){
    ScaffoldMessenger.of(context).showSnackBar
    (const SnackBar(content: Text("Passwords dont match")));
    return;
  }

 // try{
  //  await authService.signUpWithEmailPassword(email,password);
  //  Navigator.pop(context);
  //}catch(e){
   // if(mounted){
   //    ScaffoldMessenger.of(context).showSnackBar
    //(SnackBar(content: Text("Error: $e")));
   // }
 // }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Theme.of(context).colorScheme.tertiary, //Colors.grey[300],
      
      body:SafeArea(

        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
          
            const SizedBox(height: 10,),
          
            const Center(
                child: Icon(Icons.lock,
                size:  90,),
              ),

            const SizedBox(height:10,),

              Text("Let's make an account for you.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
              ),),

              const SizedBox(height: 25,),
          
              Mytextfield(
              controller: emailController,
              hinttext: 'Email',
              obscuretext: false,
              focusNode: null,
             ),

              const SizedBox(height: 10,),

              Mytextfield(
              controller: passwordController,
              hinttext: 'Password',
              obscuretext:true ,
              focusNode: null,
              ),

              const SizedBox(height: 10,),

              Mytextfield(
              controller: confirmPasswordController,
              hinttext: 'Confirm Password',
              obscuretext:true ,
              focusNode: null,
              ),

              const SizedBox(height:4,),

             // const Padding(
            //    padding: EdgeInsets.symmetric(horizontal:25.0),
             //   child: Row(
             //     mainAxisAlignment: MainAxisAlignment.end,
              //    children: [
              //       Text("Forgot password?"),
              //    ],
              //  ),
              //),

              const SizedBox(height: 15,),

              Signupbutton(
                onTap:()=> signUp(context)
              ),

              const SizedBox(height:10,),
              
          //  Column(
              
             // children: [
              //  Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               //   children: [
                //    Padding(
                 //     padding: const EdgeInsets.only(left: 50.0),
                 //     child: Checkbox(value: ischecked,
                 //      onChanged: (newbool){
                 //       setState(() {
                 //         ischecked=newbool;
                  //      });
                  //     }
                   //    ),
                   // ),

                  //   Text("Public",
                    // style: TextStyle(fontSize: 18),),

                     //Padding(
                      // padding: const EdgeInsets.only(left: 60.0),
                      // child: Checkbox(value: ischecked1,
                     //  onChanged: (newbool1){
                     //   setState(() {
                     //     ischecked1=newbool1;
                     //   });
                     //  }
                     //  ),
                    // ),

                   //  Text("Authority",
                    // style: TextStyle(fontSize: 18,),
                    // ),
                  //],
                //)
              //],
            //),

              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 10),
                      child:Center(child:
                      Text("or continue with",
                      style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),),
                      ),
                    ),
                
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25,),

              const Row(

                mainAxisAlignment: MainAxisAlignment.center,

               children: [

                SquareTile(
                imagepath: 'lib/Images/g.png',
                ),

                const SizedBox(width: 10,),

                SquareTile(
                imagepath: 'lib/Images/f.png',
                )
                ],
              ),

                const SizedBox(height: 25,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member?"),
                    
                    SizedBox(width: 4,),

                    GestureDetector(

                      onTap: () {
                        Navigator.pushNamed(context, '/loginpage');
                       },
                      child: Text("Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
    
              )))
              ]
              )
          ]
          )
        )
      )
    );
  }
}