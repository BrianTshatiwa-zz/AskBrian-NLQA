import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class QuestionAnswering extends StatefulWidget {
  @override
  _QuestionAnsweringState createState() => _QuestionAnsweringState();
}

class _QuestionAnsweringState extends State<QuestionAnswering> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: SingleChildScrollView(  
        child: Center(  
          child: Column(  
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              SizedBox(height: 50,),
              Center(  
                child: _loading ? Container(  
                  width: 180,
                  height: 180,
                  child: Image.asset('assets/scan.jpg'),
                  decoration: BoxDecoration( 
                    color: Color.fromRGBO(196, 196, 196, 1)
                  ),
                ) : Container(  
                  width: 200,
                  height: 200,
                  child: Image.file(_image),
                  decoration: BoxDecoration(  
                    color: Color.fromRGBO(196, 196, 196, 1)
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(children: [
                SizedBox(width: 10,),
                Expanded(child: RaisedButton( 
                color: Colors.green[800],
                child: Text('Upload a doc photo'),
                onPressed: (){
                  print("pressed");
                },
              )
              ),
              SizedBox(width: 10,),
              ]
              )
            ],
          ),
        ),
      ),
    );
  }
}