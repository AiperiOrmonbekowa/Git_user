import 'package:flutter/material.dart';
import 'package:git_hub_users/constants/app_colors.dart';
import 'package:git_hub_users/constants/app_text_styles.dart';
import 'package:git_hub_users/models/model.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key, required this.user});
    final GitHubUser user;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.bgColor,
        appBar: AppBar(automaticallyImplyLeading: false,
           backgroundColor: AppColors.bgColor,
        title:  Text('User Detail',  style: GoogleFonts.cormorant(textStyle: AppTextStyles.apBarTextStyle)),
        centerTitle: true,
      ),
      body: ListView(
        padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Text(
          user.login,
            style: GoogleFonts.dancingScript(textStyle: TextStyle(fontSize: 50, color: Colors.red)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
           Text("ID number: ${user.id.toString()}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
           ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Image.network(user.avatarURL,),
          ),
          Text(
            user.htmlURL,
             textAlign: TextAlign.center,
            style: AppTextStyles.textStyle
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('to get back',style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17 ),))
         ],
      ),
    );
  }
}