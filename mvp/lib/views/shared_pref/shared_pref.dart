import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  String? username;
  final TextEditingController textEditingController = TextEditingController();

  setSharedPref(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", value);
  }

  getSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username");
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('SHARED PREF'),)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello ${username ?? "username"}!', style: TextStyle(fontSize: 20),),
          const SizedBox(width: 20,),
          TextField(
            controller: textEditingController,
          ),
          ElevatedButton(
            onPressed: (){
              if(textEditingController.text.isEmpty){
                SnackBar snackBar = (SnackBar(content: Text("Data Tidak Boleh Kosong")));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }else{
                setState(() {
                  username = textEditingController.text;
                  setSharedPref(username!);
                });
              }
            }, 
            child: const Text('Save')
          ),
        ],
      ),
    );
  }
}