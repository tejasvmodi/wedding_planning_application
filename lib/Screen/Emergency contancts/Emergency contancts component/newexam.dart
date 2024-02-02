import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallFlutterW extends StatefulWidget {
  const CallFlutterW({super.key});

  @override
  State<CallFlutterW> createState() => _CallFlutterWState();
}

class _CallFlutterWState extends State<CallFlutterW> {
  
  Uri dialnumber =Uri(scheme: 'tel',path: '8140800864');

  directcall()async{
    await FlutterPhoneDirectCaller.callNumber('8140800864');
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is for the example'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(onPressed: () {
          directcall();
          
        }, icon: Icon(Icons.call), label: Text('call')),
      ),
    );
  }
}