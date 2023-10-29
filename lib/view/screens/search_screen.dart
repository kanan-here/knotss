import 'package:flutter/material.dart';
import 'package:untitled2/controller/searchUser_controller.dart';
import 'package:untitled2/model/user.dart';
import 'package:untitled2/view/screens/profile_screen.dart';
import 'package:untitled2/view/widgets/text_input.dart';
import 'package:get/get.dart';
import 'package:flutter/src/material/search_anchor.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchQuery = TextEditingController();

  final SearcheController searchController = Get.put(SearcheController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(

          title: TextFormField(
            decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Search Username"
            )
            ,controller: searchQuery , onFieldSubmitted: (value){
            searchController.searchUser(value);
          },),


        ),
        body:  searchController.searchedUsers.isEmpty ?   Center(
          child: Text("Search Users!"),
        ) :
        ListView.builder(
            itemCount: searchController.searchedUsers.length,
            itemBuilder: (context, index){
              myUser user = searchController.searchedUsers[index];

              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(uid: user.uid)));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(

                      user.profilePhoto
                  ),
                ),

                title: Text(user.name),

              );
            })
        ,
      );
    }
    );
  }
}
