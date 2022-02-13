import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prayerappadmin/BottomPagesclass/question.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:prayerappadmin/utils/constant.dart';
import 'package:prayerappadmin/widgets/customdialog.dart';
import 'package:uuid/uuid.dart';

class AddTopic extends StatefulWidget {
  const AddTopic({Key? key}) : super(key: key);

  @override
  _AddTopicState createState() => _AddTopicState();
}

class _AddTopicState extends State<AddTopic> {
TextEditingController topicController=TextEditingController();
  File? imageUrl;

  String? imageLink;

  final ImagePicker _picker = ImagePicker();

  void addImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Add Topic'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          if(topicController.text.isEmpty){
            Customdialog().showInSnackBar("Please enter title", context);
          }
         else if(imageUrl==null){
           Customdialog().showInSnackBar("Please add image", context);
          }
          else if(imageUrl !=null&&topicController.text.isNotEmpty) {
Customdialog.showDialogBox(context);
            uploadImageToFirebase().then((value) {
              firebaseFirestore.collection("topics").add({
                "imageLink": imageLink,
                "title": topicController.text.trim()
              }).then((value) {
                Navigator.pop(context);
                Navigator.pop(context);
                Customdialog().showInSnackBar("Added New Topic", context);
              });
            });
          }        },
        child: Icon(
          Icons.check,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: addImage,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child:imageUrl==null? CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/add.png'),
                ):CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(imageUrl!),
                ),
                radius: 72,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
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
              child: TextFormField(
                controller: topicController,
                //  textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: ' Enter Topic',
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
        ],
      ),
    );
  }

  Future uploadImageToFirebase() async {
    File? fileName = imageUrl;
    var uuid = Uuid();
    firebase_storage.Reference firebaseStorageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('cetagory/images+${uuid.v4()}');
    firebase_storage.UploadTask uploadTask =
        firebaseStorageRef.putFile(fileName!);
    firebase_storage.TaskSnapshot taskSnapshot =
        await uploadTask.whenComplete(() async {
      print(fileName);
      String img = await uploadTask.snapshot.ref.getDownloadURL();
      setState(() {
        imageLink = img;
      });
    });
  }
}
