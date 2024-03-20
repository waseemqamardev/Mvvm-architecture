import 'package:flutter/material.dart';
import 'package:mvvmpractice/Utils/Routes/Routesname.dart';
import 'package:mvvmpractice/View_Model/user_view_model.dart';
import 'package:mvvmpractice/View_Model/userlist_provider.dart';
import 'package:mvvmpractice/data/response/status.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserListProvider userListProvider=UserListProvider();

@override
  void initState() {
    // TODO: implement initState
    Provider.of<UserListProvider>(context, listen: false).fetchuserlist();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userPreference=Provider.of<UserViewModel>(context);
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
     title: Text("home"),
     leading: IconButton(onPressed: (){
 Navigator.pushNamed(context, RoutesName.create);
     }, icon: Icon(Icons.next_plan)),
     centerTitle: true,
     actions: [
       Padding(
         padding: const EdgeInsets.only(right: 20),
         child: InkWell(
           onTap: (){
             userPreference.remove().then((value) {
               Navigator.pushNamed(context, RoutesName.login);

             });
           },
           child: Center(child: Text("logout"))),
       ),

     ],
     ),
      body: Consumer<UserListProvider>(builder: (context,userListProvider,child){
        switch(userListProvider.userlist.status){
          case Status.LOADING: return Center(child: CircularProgressIndicator());
          case Status.ERROR: return Center(child: Text(userListProvider.userlist.message.toString()),);
          case Status.COMPLETED: return ListView.builder(
              itemCount: userListProvider.userlist.data!.data!.length,
              itemBuilder: (context,index){
                final data=userListProvider.userlist.data!.data![index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: ListTile(
                title: Text(data.firstName.toString()),
                subtitle: Text(data.email.toString()),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data.avatar.toString()),
                ),
              ),
            );
          });
              default:
        }
        return SizedBox();
      },),
    );
  }
}
