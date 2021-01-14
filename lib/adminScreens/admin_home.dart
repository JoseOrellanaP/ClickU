import 'package:clikcus/adminScreens/add_products.dart';
import 'package:clikcus/adminScreens/app_orders.dart';
import 'package:clikcus/adminScreens/privileges.dart';
import 'package:clikcus/adminScreens/search_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_messages.dart';
import 'app_products.dart';
import 'app_users.dart';
import 'order_history.dart';

class adminHome extends StatefulWidget {
  @override
  _adminHomeState createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {

  Size screenSize;

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: new Text("App Admin"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => SearchData()
                        ));
                  },
                  child: CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        SizedBox(height: 10.0,),
                        Text("Search Data"),

                      ],
                    ),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => AppUsers()
                      )
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_search),
                        SizedBox(height: 10.0,),
                        Text("App Users"),

                      ],
                    ),

                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => AppOrders()
                      )
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.query_builder_sharp),
                        SizedBox(height: 10.0,),
                        Text("App Orders"),

                      ],
                    ),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => AppMesages()
                      )
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat),
                        SizedBox(height: 10.0,),
                        Text("App Messages"),

                      ],
                    ),

                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => AppProducts()
                      )
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shop),
                        SizedBox(height: 10.0,),
                        Text("App Products"),

                      ],
                    ),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => AddProducts()
                      )
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(height: 10.0,),
                        Text("App Products"),

                      ],
                    ),

                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => AppHistory()
                      )
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history),
                        SizedBox(height: 10.0,),
                        Text("App History"),

                      ],
                    ),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => privileges()
                      )
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.admin_panel_settings),
                        SizedBox(height: 10.0,),
                        Text("Privileges"),

                      ],
                    ),

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
