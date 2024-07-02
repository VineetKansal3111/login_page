import 'package:flutter/material.dart';
import 'secondPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  void _submitForm() {
    if (_formkey.currentState!.validate()) { Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecondPage()),
    );     }}
  bool isValidEmail(String value) {
    print("valid email text,${RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)}");
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Welcome to Login Page...',
         style: TextStyle(
         fontStyle: FontStyle.italic,
         ),
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
         child:Column(
         children:[
          const Padding(
          padding: EdgeInsets.only(top: 100, bottom: 50),
         child: Text('Login Page', style: TextStyle(
         fontWeight: FontWeight.w600,
         fontSize: 28,
         color: Colors.pinkAccent,
               ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Name',
                        hintText: 'Enter Your Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
                      } else {
                        return null;
                      }
                    }),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Email',
                        hintText: 'Enter Your Email'
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Email';
                      }
                      else if( !isValidEmail(value)){
                        return 'Enter Valid Email';}
                      else {
                        return null;
                      }
                    }
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter password',
                        hintText: 'Enter Your password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      } else {
                        return null;
                      }}
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  onPressed: () {
                     _submitForm();
                    print('Login successfully');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}