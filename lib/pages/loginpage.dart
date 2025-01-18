//import 'package:drugapp/Auth/auth_service.dart';
import 'package:drugapp/services/Authf/auth_service.dart';
import 'package:drugapp/components/loginpage/mytextfield.dart';
import 'package:drugapp/components/loginpage/signinbutton.dart';
import 'package:drugapp/components/loginpage/squaretile.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

final emailController = TextEditingController();

final passwordController = TextEditingController();

//final authService = AuthService();

void login(BuildContext context) async{

  final authService = AuthService();

  showDialog(
    context: context,
     builder: (context) {
      return const Center(child: CircularProgressIndicator());
     },
     );

  //final email  = emailController.text;
 // final password = passwordController.text;

  try{
    await authService.signInWithEmailPassword(
      emailController.text, 
      passwordController.text);
  }
  catch (e){
    showDialog(
      context: context,
       builder: (context) => AlertDialog(
        title: Text(e.toString()),
       )
       );
    
  }

 // try{
 //   await authService.signInWithEmailPassword(email, password);
 // } catch (e) {
   // if(mounted){
    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Error: $e")));
   // }
 // }

  Navigator.pop(context);

}
  @override
  Widget build(context) {

    //bool isUnderlined = true;

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
                size: 120,),
              ),

            const SizedBox(height:30,),

              Text("Welcome back !!!",
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

              const SizedBox(height:4,),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal:25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Text("Forgot password?"),
                  ],
                ),
              ),

              const SizedBox(height: 15,),

              Button(
                onTap:() => login(context)
              ),

              const SizedBox(height: 50,),

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
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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
                    Text("Not a member?"),
                    
                    SizedBox(width: 4,),

                    GestureDetector(

                      onTap: () {
                        Navigator.pushNamed(context, '/drawer/registerpage');
                      },

                     // onTapDown: (details) {
                      //  setState(() {
                        //  isUnderlined = true;
                       // });
                      //},

                      // onTapUp: (details) {
                     //   setState(() {
                       //   isUnderlined = false;
                       // });
                     //   Navigator.pushNamed(context,'/drawer/register_page');
                     // },

                      child: Text("Register Now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        //decorationThickness: 1
                         //decoration: isUnderlined ? TextDecoration.underline : TextDecoration.none,

                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}