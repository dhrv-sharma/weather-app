import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';


class loadingactivity extends StatefulWidget {
  const loadingactivity({super.key});

  @override
  State<loadingactivity> createState() => _loadingState();
}

class _loadingState extends State<loadingactivity> {

  @override
  void initState() async {
    worker data=worker("New York");
    await data.getData();
    data.dataPrint();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // safe area show the the widget in application beyond the mobile bar 
      // body: SafeArea(child: Text("Loading Activity")),

    

      body: Column(
        children: <Widget>[
          SafeArea(
            // button creation we have mainly three types of buttons in flutter one is TextButton other is Outlined button and third is Elevated button
            child: ElevatedButton.icon(
              // this function will run when the that button is clicked in flutter you can express fucntion as (){ function body }
                onPressed: () {
                  
                  // Handle button press
                  Navigator.pushNamed(context, "/homescreen");
                },
                icon:const  Icon(Icons.add_to_home_screen),
                label:const  Text('Go Back To Home'),
              ),
          ),
        ],
      ),
    );
  }
}