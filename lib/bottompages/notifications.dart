import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayerappadmin/notifications/add_notification.dart';
import 'package:prayerappadmin/utils/constant.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
  var appSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.all(9),
              child: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => AddNotification()));
              }, icon: Icon(Icons.add)))
        ],
        backgroundColor: Colors.green,
        title: Text('Notifications'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: appSize.height,
        width: appSize.width,
        child: StreamBuilder(
            stream: firebaseFirestore.collection("notifications").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.docs==0?Text("Empty"):ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var ds=snapshot.data!.docs[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                               ListTile(
                                title: Text(
                                  ds['content'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(child: Icon(Icons.error_outline));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
