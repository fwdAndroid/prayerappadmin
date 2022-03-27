import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:prayerappadmin/utils/constant.dart';
import 'package:prayerappadmin/widgets/customdialog.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProduct extends StatefulWidget {
  String? productId;
  UpdateProduct({ Key? key,this.productId }) : super(key: key);

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
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
        title: Text('Shopping Portal'),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: firebaseFirestore.collection("Products").doc(widget.productId).get(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              var ds= snapshot.data!;
              productNameController.text=ds.get("productName");
              productPriceController.text=ds.get("productPrice");
              productDescriptionController.text=ds.get("productDescription");
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap:addImage,
                        child: Center(child:imageUrl==null? Image.network(ds.get("imageLink"),height: 150,):Image.file(imageUrl!,height: 150,

                        ))),
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(left: 30,right: 30,top: 30),

                      //  padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff06A864),
                          width: 1,
                        ),
                        borderRadius: new BorderRadius.circular(20),
                      ),
                      // border: Border.all(color: Colors.grey,width: 0.5)

                      child: TextFormField(
                        controller: productNameController,
                        style: TextStyle(color: Colors.black),
                        //  textAlign: TextAlign.start,
                        decoration: InputDecoration(

                          hintText: 'Product Name',
                          contentPadding: EdgeInsets.only(top: 20, left: 20),
                          border: InputBorder.none,


                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(left: 30,right: 30,top: 10),

                      //  padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff06A864),
                          width: 1,
                        ),
                        borderRadius: new BorderRadius.circular(20),
                      ),
                      // border: Border.all(color: Colors.grey,width: 0.5)

                      child: TextFormField(
                        controller: productDescriptionController,
                        style: TextStyle(color: Colors.black),
                        //  textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: 'Product Description',

                          border: InputBorder.none,


                        ),
                      ),
                    ),
                    Container(
                      height:60,
                      margin: EdgeInsets.only(left: 30,right: 30,top: 10),

                      //  padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff06A864),
                          width: 1,
                        ),
                        borderRadius: new BorderRadius.circular(20),
                      ),
                      // border: Border.all(color: Colors.grey,width: 0.5)

                      child: TextFormField(
                        controller: productPriceController,
                        style: TextStyle(color: Colors.black),
                        //  textAlign: TextAlign.start,
                        decoration: InputDecoration(

                          hintText: 'Product Prie',
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none,


                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(onPressed: (){
                        Customdialog.showDialogBox(context);
                       imageUrl==null?firebaseFirestore.collection("Products").doc(widget.productId).update({
                         "productName":productNameController.text.trim(),
                         "productDescription":productDescriptionController.text.trim(),
                         "productPrice":productPriceController.text.trim()
                       }).then((value) {
                         Navigator.pop(context);
                         Navigator.pop(context);                            Navigator.pop(context);
                         Customdialog().showInSnackBar("Product updated", context);
                       }): uploadImageToFirebase().then((value){
                          firebaseFirestore.collection("Products").doc(widget.productId).update({
                            "imageLink":imageLink,
                            "productName":productNameController.text.trim(),
                            "productDescription":productDescriptionController.text.trim(),
                            "productPrice":productPriceController.text.trim()
                          }).then((value) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Customdialog().showInSnackBar("Product Updated", context);
                          });

                        });

                      }, child: Text('Update Product'),style: ElevatedButton.styleFrom(
                          fixedSize: Size(250, 60)
                      ),),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return CircularProgressIndicator();
            }
          }),
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