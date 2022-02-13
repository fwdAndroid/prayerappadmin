import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../providers/idprovider.dart';
import '../utils/constant.dart';
import '../widgets/customdialog.dart';
class AddSolutions extends StatefulWidget {
  String? question,id;
  String? sol1,sol2,sol3;

   AddSolutions({ Key? key,this.question,this.sol1,this.sol2,this.sol3,this.id }) : super(key: key);

  @override
  _AddSolutionsState createState() => _AddSolutionsState();
}

class _AddSolutionsState extends State<AddSolutions> {
  String audioLink="";
  File? audioUrl;
  PlatformFile? myfile;
  TextEditingController questionController=TextEditingController();
  TextEditingController sol1Controller=TextEditingController();
  TextEditingController sol2Controller=TextEditingController();
  TextEditingController sol3Controller=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
  print(Provider.of<IdProvider>(context,listen: false).id
  );
  super.initState();
  }  @override
  Widget build(BuildContext context) {
questionController.text=widget.question??"";
sol1Controller.text=widget.sol1??"";
sol2Controller.text=widget.sol2??"";
sol3Controller.text=widget.sol3??"";
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.green,
        title:widget.question==null? Text('Add Solution'):Text('Update Solution'),
       
             
       
      ),

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
                controller: questionController,
                //  textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: ' Enter Question',
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
                  // focusedBorder:OutlineInputBorder(
                  //   // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  //   borderRadius: BorderRadius.circular(25.0),
                  // hintTextDirection: HitTestDispatcher.,
                ),
              )),

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
                controller: sol1Controller,
                //  textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: ' Enter Solutions One',
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
                  // focusedBorder:OutlineInputBorder(
                  //   // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  //   borderRadius: BorderRadius.circular(25.0),
                  // hintTextDirection: HitTestDispatcher.,
                ),
              )),
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
                controller: sol2Controller,
                //  textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: ' Enter Solution Two',
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
                  // focusedBorder:OutlineInputBorder(
                  //   // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  //   borderRadius: BorderRadius.circular(25.0),
                  // hintTextDirection: HitTestDispatcher.,
                ),
              )),
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
                controller: sol3Controller,
                //  textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: ' Enter Solution Three',
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
                height: 10,
              ),
          widget.question==null?OutlinedButton(
      onPressed: () async{
        // debugPrint('Received click');
    if(myfile==null)
        {
                final result =
                    await FilePicker.platform.pickFiles(type: FileType.audio);
                if (result == null) return;
                var fileName = result.files.single;
// myfile=fileName;
                setState(() {
myfile=fileName;
                });
              }
    else{
      openFile(myfile!);
    }
            },
      child: myfile==null? Text('Add Audio'):Text(myfile!.name.toString()),
    ):Container(),

              SizedBox(height: 20,),
               ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff00722d),
                minimumSize: Size(240, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () async{
                 if(questionController.text.isEmpty&&sol1Controller.text.isEmpty&&sol2Controller.text.isEmpty
                &&sol3Controller.text.isEmpty
                ){
                   Customdialog().showInSnackBar("All fields are required", context);

                 }
               else if(questionController.text.isEmpty){
                  Customdialog().showInSnackBar("Please enter Question", context);
                }
                else if(sol1Controller.text.isEmpty){
                  Customdialog().showInSnackBar("Please add Solution One", context);
                }
                else if(sol2Controller.text.isEmpty){
                  Customdialog().showInSnackBar("Please add Solution Two", context);
                }
                else if(sol3Controller.text.isEmpty){
                  Customdialog().showInSnackBar("Please add Solution Three", context);
                }
                else if(questionController.text.isNotEmpty&&sol1Controller.text.isNotEmpty&&sol2Controller.text.isNotEmpty
                &&sol3Controller.text.isNotEmpty
                ) {
              if(widget.id==null){
                Customdialog.showDialogBox(context);
           await     uploadAudioToFirebase().then((value){
                  firebaseFirestore.collection("topics").doc(Provider.of<IdProvider>(context,listen: false).id).
                  collection("questions").add({
                    // "imageLink": imageLink,
                    "Question": questionController.text.trim(),
                    "Answer1": sol1Controller.text.trim(),
                    "Answer2": sol2Controller.text.trim(),
                    "Answer3": sol3Controller.text.trim(),
                    "Audio":audioLink
                  }).then((value) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Customdialog().showInSnackBar("Added New Question", context);
                  });
                });

              }
              else{
                Customdialog.showDialogBox(context);

                firebaseFirestore.collection("topics").doc(Provider.of<IdProvider>(context,listen: false).id).collection("questions").
                doc(widget.id
                ).update({
                  // "imageLink": imageLink,
                  "Question": questionController.text.trim(),
                  "Answer1": sol1Controller.text.trim(),
                  "Answer2": sol2Controller.text.trim(),
                  "Answer3": sol3Controller.text.trim(),
                }).then((value) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Customdialog().showInSnackBar("Update Question", context);
                });

              }
                }
              },
              child:widget.question==null? Text(
                'Add',
                style: TextStyle(fontSize: 20),
              ):Text(
                'Update',
                style: TextStyle(fontSize: 20),
              ),
            ),
      
        ],
      ),
    );
  }
  openFile(PlatformFile file)async{
   await OpenFile.open(file.path!);
  }
//   uploadAudio(){
//   if(audioUrl==null)return;
//   final fileName=audioUrl!.path;
// final destination="files/$fileName";
// uploadAudioToFirebase();
// }
  Future uploadAudioToFirebase() async {
    File fileName =File(myfile!.path!);
    var uuid = Uuid();
    firebase_storage.Reference firebaseStorageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('topic/audios+${uuid.v4()}');
    firebase_storage.UploadTask uploadTask =
    firebaseStorageRef.putFile(fileName);
    firebase_storage.TaskSnapshot taskSnapshot =
    await uploadTask.whenComplete(() async {
      print(fileName);
      String audio = await uploadTask.snapshot.ref.getDownloadURL();
      setState(() {
        audioLink = audio;
      });
    });
  }
}