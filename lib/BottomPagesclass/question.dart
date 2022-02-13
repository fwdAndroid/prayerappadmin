import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prayerappadmin/providers/idprovider.dart';
import 'package:prayerappadmin/questionsection/addTopic.dart';
import 'package:prayerappadmin/questionsection/viewsolutionswithaudio.dart';
import 'package:prayerappadmin/utils/constant.dart';
import 'package:provider/provider.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

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
        onPressed: () {
          //Here We Add The Topic of Question
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => AddTopic()));
        },
        child: Icon(
          Icons.topic,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: firebaseFirestore.collection("topics").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (ctx, i) {
                          var ds = snapshot.data!.docs[i];
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<IdProvider>().setValue(ds.id);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                ViewSolutionwithAudio()));
                                  },
                                  child: Container(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 50,
                                      backgroundImage:
                                          NetworkImage(ds['imageLink']),
                                    ),
                                  ),
                                ),
                                Text(ds['title'])
                              ],
                            ),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
