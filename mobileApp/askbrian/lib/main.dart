import 'package:flutter/material.dart';
import 'question_answering.dart';

void main(){ 
  runApp(HomePage());
}

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home:DefaultTabController( 
        length: 2,
        child: Scaffold(  
          appBar: AppBar(  
            title: Text("AskBrian"),
            backgroundColor: Colors.green[800],
            bottom: TabBar(tabs: [ 
              Tab(icon: Icon(Icons.question_answer), text:'Ask'),
              Tab(icon: Icon(Icons.info), text: 'About',)
            ],),
          ),
          body: TabBarView(children: [ 
            QuestionAnswering(),
            Text('About'),
          ],),
        ),
      ));
  }
}