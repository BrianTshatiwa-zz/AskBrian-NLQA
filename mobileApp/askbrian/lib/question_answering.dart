import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'dart:io';

class QuestionAnswering extends StatefulWidget {
  @override
  _QuestionAnsweringState createState() => _QuestionAnsweringState();
}

class _QuestionAnsweringState extends State<QuestionAnswering> {
  bool _loading = true;
  String value = "";
  String answer = '';
  late File _image;
  late List _output;
  final picker = ImagePicker();

  getTextFromImage(File image) { 
    var context_text = FlutterTesseractOcr.extractText(image.path);
    print(context_text);
    setState(() {
      _loading = false;
    });
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    getTextFromImage(_image);
  }

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
                  width: 180,
                  height: 180,
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
                onPressed: pickGalleryImage,
              )
              ),
              SizedBox(width: 10,),
              ]
              ),
              SizedBox(height: 15,),
              Text(answer),
              SizedBox(height: 15,),
              _loading ? Text("upload an image and start asking questions"): Row(children: [
                Expanded(child: TextField(
              onChanged: (text) {
                value = text;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Query',
                hintText: 'Enter a question'))),
                SizedBox(width: 10,),
                Expanded(child:RaisedButton(
                child: Text("submit"),
                color: Colors.green[800],
                onPressed: () { 
                  print(value);
                  setState(() {
                    answer = "In a farmhouse";
                  });
                },
              ),
              ),
              ],
              )
              ],
          ),
        ),
      ),
    );
  }
}