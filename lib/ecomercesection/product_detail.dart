import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prayerappadmin/ecomercesection/add_product.dart';
import 'package:prayerappadmin/ecomercesection/update_product.dart';
import 'package:prayerappadmin/utils/constant.dart';
import 'package:prayerappadmin/widgets/customdialog.dart';

class ProductDetail extends StatefulWidget {
  String productId;
  ProductDetail({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => UpdateProduct(
                    productId: widget.productId,
                  )));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.edit),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: ()async{
                  await firebaseFirestore.collection("Products").doc(widget.productId).delete().then((value) {
                    Navigator.pop(context);
                    Customdialog().showInSnackBar("Product deleted", context);
                  });

                },
                child: Icon(Icons.delete)),
          ),
        ],
      ),
      body: FutureBuilder(
          future: firebaseFirestore
              .collection("Products")
              .doc(widget.productId)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              var ds = snapshot.data!;
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(ds.get("imageLink"),height: 200,
                        width: double.infinity,
                        fit: BoxFit.scaleDown),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(ds.get("productName"))),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(ds.get('productDescription'))),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(ds.get('productPrice'))),
                  ]);
            } else if (snapshot.hasError) {
              return Center(child: Icon(Icons.error_outline));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
