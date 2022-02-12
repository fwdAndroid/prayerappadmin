import 'package:flutter/material.dart';
import 'package:prayerappadmin/questionsection/add_solutions.dart';

class ViewSolutionwithAudio extends StatefulWidget {
  const ViewSolutionwithAudio({ Key? key }) : super(key: key);

  @override
  _ViewSolutionwithAudioState createState() => _ViewSolutionwithAudioState();
}

class _ViewSolutionwithAudioState extends State<ViewSolutionwithAudio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('View Solution'),
       

        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder) => AddSolutions()));
          }, child: Text('Add Solutions',style: TextStyle(color: Colors.white,fontSize: 15),))
        ],
      ),
      body:   ListView.builder(itemCount: 5,
        itemBuilder: (BuildContext context,int index){ return Container(
             margin: EdgeInsets.symmetric(horizontal: 30),
             child: Card(
               elevation: 5,
                 child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                 ListTile(
                  //When we Clicked I opened same page but here he can only view it or edit
                   onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (builder) => AddSolutions()));
        },
                  title: Text('Q1 The Enchanted Nightingale'),
                  trailing: Icon(Icons.edit,color: Colors.black,),
                  
                ),
                
              ],
                 ),
               ),
           );
          }),
      
      
    );
  }
}