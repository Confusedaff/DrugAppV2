//import 'package:drugapp/Auth/auth_service.dart';
import 'package:drugapp/pages/chatpagehome.dart';
import 'package:drugapp/pages/mappage.dart';
import 'package:drugapp/pages/scanpage.dart';
import 'package:drugapp/services/Authf/auth_service.dart';
import 'package:drugapp/components/Navbar/bottomnavbar.dart';
import 'package:drugapp/pages/homepage.dart';
//import 'package:drugapp/pages/mappage.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {

//final authService = AuthService();


  //void logout() async {
//  await authService.signOut();
//}
void logout(){
  final auth = AuthService();
   auth.signOut();
}


  int selected = 0;

  void bottomnavigation(int index){
    setState(() { 
      selected = index ;
    });
  }

  final List<Widget> pages = [

   const Homepage(),

   const Mappage(),

    ScanPage(),

    Chatpagehome(),
  ];

  @override
  Widget build(BuildContext context) {

    return //SafeArea(
       Scaffold(

        backgroundColor:Theme.of(context).colorScheme.tertiary,
        bottomNavigationBar: Wrap(
      
          children: [
          SafeArea(
            child: Bottomnavbar(
            onTabChange:(index) => bottomnavigation(index),
              ),
          ),
          ],
          
        ),
      
          //backgroundColor: Colors.lightBlueAccent.shade400,
      
          body: pages[selected],

          appBar: AppBar(

            backgroundColor: Theme.of(context).colorScheme.tertiary,
            //backgroundColor: Colors.lightBlueAccent.shade400,
            leading: Builder(
              builder:(context) => IconButton(
                icon:Icon(
                  Icons.menu,
                  color: Theme.of(context).colorScheme.inversePrimary,),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
              )
              ),
              ),

              drawer:Drawer(
                
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                //backgroundColor: Colors.blue.shade400,

                
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  
                      DrawerHeader(
                        child:Image.asset(
                          'lib/Images/medicine.png',
                          ),
                          ),
                  
                  Padding(
                    padding: EdgeInsets.only(top:10.0),
                  
                    child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color:Theme.of(context).colorScheme.inversePrimary,
                      //size: 35,
                    ),
                    title: Text(
                      "My Account",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        //fontSize: 20,
                      ),
                      ),
                      
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context,'/drawer/accountpage');
                      },
                      ),
                      ),
                  
                     //Padding(
                      //padding:const EdgeInsets.only(top:10.0),
                       ListTile(
                        leading:Icon(
                          Icons.settings,
                          //size: 35,
                          color:Theme.of(context).colorScheme.inversePrimary,),
                        title:Text(
                          "Settings",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            //fontSize: 20
                            ),
                          ),
                  
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context,'/drawer/settingspage');
                          },
                        ),
                    //),
                  
                    // Padding(
                    //  padding:const EdgeInsets.only(top:10.0),
                     //// ListTile(
                       // leading:Icon(
                         // Icons.notifications,
                        //  //size: 35,
                        //  color: Theme.of(context).colorScheme.inversePrimary,),
                        //title:Text(
                         // "Messages",
                         // style: TextStyle(
                         //   color: Theme.of(context).colorScheme.inversePrimary,
                          //  //fontSize: 20
                        //    ),
                        //  ),
                  
                          // onTap: () {
                          //  Navigator.pop(context);
                          //  Navigator.pushNamed(context,'/drawer/messagepage');
                         // },
                      //  ),
                    //),
                  
                    // Padding(
                     // padding:const EdgeInsets.only(top:10.0),
                       ListTile(
                        leading:Icon(
                          Icons.medical_services,
                          //size: 35,
                          color: Theme.of(context).colorScheme.inversePrimary,),
                        title:Text(
                          "Doctors",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            //fontSize: 20
                            ),
                          ),
                  
                           onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context,'/drawer/doctorpage');
                          },
                        ),
                    //),
                  
                      //Padding(
                     // padding: EdgeInsets.only(top:10.0),
                       ListTile(
                        leading: Icon(
                          Icons.info_rounded,
                          //size: 35,
                          color:Theme.of(context).colorScheme.inversePrimary,),
                        title:Text(
                          "About Us",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            //fontSize: 20
                            ),
                          ),
                  
                           onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context,'/drawer/aboutuspage');
                          },
                        ),
                    //),
                    
                      
                      //Padding(
                       // padding:EdgeInsets.only(top:10.0),
                         ListTile(
                           leading: Icon(
                            Icons.logout,
                            //size: 35,
                            color:Theme.of(context).colorScheme.inversePrimary,),
                          title:Text(
                            "Logout",
                             style: TextStyle(
                             color: Theme.of(context).colorScheme.inversePrimary,
                              //fontSize: 20
                              ),
                            ),
                          
                            onTap: () {
                             logout();
                              Navigator.pop(context);
                            },
                            ),
                          //),
                    ],
                  ),
              ),
          
      );
  }
}