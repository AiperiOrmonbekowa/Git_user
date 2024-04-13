import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_hub_users/constants/api_const.dart';
import 'package:git_hub_users/constants/app_colors.dart';
import 'package:git_hub_users/constants/app_text_styles.dart';
import 'package:git_hub_users/models/model.dart';
import 'package:git_hub_users/pages/user_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}
 class _UserListState extends State<UserList> {
  
   final String apiUrl = ApiConst.apiUsers;
   late List<GitHubUser> users;

  @override
  void initState() {
    super.initState();
    fetchGitHubUsers();
   }
 

  Future<List<GitHubUser>> fetchGitHubUsers() async {

  final response = await http.get(Uri.parse(apiUrl),);
 if (response.statusCode == 200) {
  List<dynamic> responseData = jsonDecode(response.body);
      return users = responseData.map((json) => GitHubUser.fromJson(json)).toList();
       } else {
      // Handle non-successful status codes
     throw Exception('Failed to load GitHub users: ${response.statusCode}');
  } 
}
 @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:AppColors.bgColor,
        appBar: AppBar(  
           backgroundColor:AppColors.bgColor, 
          title:  Text('GitHub Users', style: GoogleFonts.cormorant(textStyle: AppTextStyles.apBarTextStyle)),
          centerTitle: true, 
          actions:  [ 
           IconButton(onPressed: (){
           },
            icon: const Icon(Icons.more_vert),
           ),
          ],
        ), 
        body: FutureBuilder<List<GitHubUser>>(
          future: fetchGitHubUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Center(child: Text('Сизде интернет байланышы жок'),
              ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.whiteColor,
                   child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data![index].avatarURL),
                      ),
                      title: Text(snapshot.data![index].login,style: GoogleFonts.cormorant(textStyle: AppTextStyles.loginStyle)),
                      subtitle: Text(snapshot.data![index].htmlURL,style: GoogleFonts.cormorant(textStyle: AppTextStyles.urlStyle,)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>UserDetail(user: users[index],),
                        ),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      
    );
   
  }
}


