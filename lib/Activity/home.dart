// this file tells about async and await function 

import 'package:flutter/material.dart';

// we are using the state full widget it ised where the data changes so that ui of an app can also change
// stful code snippet
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  String? username;

// async function -Function start but return in some delayed
// Future delayed -function start after some delayed 

  

  void getData() async {
    //  process
    // async and await are used simultaneously
    // here we have used await function hence now it will wait till this fuction,s line untill it does not get executed 
    await Future.delayed(const Duration(seconds: 4),(){
      username="dhruv sharma";
      return "dhruv sharma";

    });
 

    // print("$username logged in ");


    
  }

  void showData() async{
    // await getData();

    print("$username logged in ");
  }

// timer here is a user defined function
  void timer(){
    // process -  5 seconds 
    // future delayed function is a special type of function where you can run the program after some delay of time 
    // Future.delayed(Duration(seconds: 3),() {function you want to run  })
    // this function allows the compiler to move the and read the next code although it will execute in future time 
    Future.delayed(const Duration(seconds: 5),(){print("alarm is ringing");});
  }

  // asynchronous function is a function used to run in the background for fetching data from api and the database 
  // it does not runs on main thread
  // await stop the function in the main thread and wait till the async function till return the data 

  @override
  void initState() {
    //  this function runs when the whole widget is created
    // use this function when you hav eto pring data from api
    super.initState();
    timer();
    // showData();
    print("this is a init state");
  }

  @override
  void setState(VoidCallback fn) {
    // this function are run the build function instead of whole widget
    // this function try to use when the user interaction is there
    super.setState(fn);
    print("SetState Is called ");
  }

  @override
  void dispose() {
    
    // this function is called when that widget get destroyed  
    super.dispose();
    print("widget get destroyred");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Activty")),
        body: Column(
          children: <Widget>[
            TextButton(
            onPressed: () => setState(() {
                  counter += 1;
                }),
            child: const Text("Press me ")),
            Text("$counter")
          ],
        ));
  }
}
