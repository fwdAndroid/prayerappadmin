import 'package:flutter/material.dart';
import 'package:prayerappadmin/questionsection/addTopic.dart';
import 'package:prayerappadmin/questionsection/viewsolutionswithaudio.dart';

class Questions extends StatefulWidget {
  const Questions({ Key? key }) : super(key: key);

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Question Topic'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          //Here We Add The Topic of Question
          Navigator.push(context, MaterialPageRoute(builder: (builder) => AddTopic()));

        },child: Icon(Icons.topic,),),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10.0),
        itemCount: 23,
        itemBuilder: (ctx, i) =>  Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              //Add Specific Questions  of each each topic admin can add multiple solutions if he wantd
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => ViewSolutionwithAudio()));
                },
                child: Container(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/namaz.png'),
                  ),
                ),
              ),
              Text('Namaz')
            ],
          ),
        )
        ),
     
    
            ),
                  ],
        ),
      ),
    );
  }
}