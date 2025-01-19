import 'package:drugapp/Themes/themeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,

      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.secondary,
          ),
         
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode"),
                CupertinoSwitch(
                  value: Provider.of<Themeprovider>(context,listen:false).isDarkMode, 
                  onChanged: (value) =>Provider.of<Themeprovider>(context,listen:false).toggleTheme(),
                  )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor:Theme.of(context).colorScheme.tertiary,
        title:const Text("                  Settings"),
      ),
    );
  }
}