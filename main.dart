import 'dart:wasm';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lab1_rpp/numbers_to_word_dart.dart';
import 'package:lab1_rpp/numbers_helper.dart';
void main() => runApp(MaterialApp(
  home: Home(),
));
class Home extends StatefulWidget{
  @override
  _HomeState createState() =>
      _HomeState();
}
class _HomeState extends
    State<Home>{
  void first() async{
    await
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context){
        return Scaffold(
            appBar: new AppBar(
              title: new Text("Activity ",
                style: new TextStyle(color: Colors.white),),
            ),
          body:getListView()
        );
      }
      )
      );
    });
  }
  @override
  void initState(){
    super.initState();
    first();
  }
  @override
  Widget build(BuildContext context ){
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/jungkook.jpg'),
        ),
      ),
    );
  }
}
List<String> getListElement(){
  List<String> number = [];
  bool val = true;
  for(var j in number){
    number.remove('$j');
  }
  for(int i = 1; i<=1000000; i++){
    number.add('$i');
    if(i%2==0){
      val = true;
    } else{
      val = false;
    }
  }
  return number;
}
Widget getListView(){
  var listItems = getListElement();
  var i = int.parse(listItems.first);
  var j = listItems.length ;
  var listView = ListView.builder(itemBuilder: (context, index){
    if(j%2 ==0){
      j++;
      return Card(
        color:Colors.white,
        child: Row(
          children: <Widget>[
            Image.asset('assets/taehyung.jpg', width: 50,),
            Text(
              NumberToWords.convert(listItems[index],"en"),
              style: TextStyle(fontSize : 25.0),
            )
          ],
        ),
      );
    } else{
      j++;
      return Card(
        color:Colors.grey,
        child: Row(
          children: <Widget>[
            Image.asset('assets/taehyung.jpg', width: 50, ),
            Text(
              NumberToWords.convert(listItems[index],"en"),
              style: TextStyle(fontSize : 25.0),
            )
          ],
        ),
      );
    }
  });
  return listView;
}
