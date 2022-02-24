import 'package:flutter/material.dart';
import 'package:prayerappadmin/utils/constant.dart';
import 'package:prayerappadmin/widgets/customdialog.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({ Key? key }) : super(key: key);

  @override
  _AddNotificationState createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  TextEditingController notificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
         
        backgroundColor: Colors.green,
        title: Text('Add Notifications'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 30),

              //  padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(15.0),
                  topRight: const Radius.circular(15.0),
                  bottomLeft: const Radius.circular(15.0),
                  bottomRight: const Radius.circular(15.0),
                ),
                // border: Border.all(color: Colors.grey,width: 0.5)
              ),
              child: TextField(
                controller: notificationController,
                //  textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: 'Add Notification',
                  contentPadding: new EdgeInsets.fromLTRB(15, 15, 15, 15),
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: new BorderSide(),
                  ),
                  fillColor: Colors.white,
                  hintStyle: TextStyle(
                    color: Color(0xff8D8989), // <-- Change this
                    fontSize: null,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),

                ),
              )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff00722d),
                minimumSize: Size(240, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              

              
                
              
              onPressed: () {
                if(notificationController.text.isEmpty){}else{
                  try{
                    Customdialog.showDialogBox(context);
                    firebaseFirestore.collection("notifications").add({
                      "content":notificationController.text,
                      "time":DateTime.now()
                    }).whenComplete(() {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Customdialog().showInSnackBar("Notification Added", context);
                    }).catchError((e){
                      throw e;
                    });
                  }catch(e){
                    Navigator.pop(context);
                    Customdialog.showBox(context, e.toString());
                  }
                }
              },
              child:Text(
                'Add',
                style: TextStyle(fontSize: 20),
              )
            ),
      
        ],
      ),
    );
  }
}