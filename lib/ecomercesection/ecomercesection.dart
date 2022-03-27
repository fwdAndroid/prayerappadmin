import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prayerappadmin/ecomercesection/add_product.dart';
import 'package:prayerappadmin/ecomercesection/product_detail.dart';
import 'package:prayerappadmin/utils/constant.dart';

class EcommerceSection extends StatefulWidget {
  const EcommerceSection({ Key? key }) : super(key: key);

  @override
  State<EcommerceSection> createState() => _EcommerceSectionState();
}

class _EcommerceSectionState extends State<EcommerceSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Prayer App Shopping Catelog'),
         centerTitle: true,        
         
      ),
       floatingActionButton: FloatingActionButton(onPressed: (() {
         Navigator.push(context, MaterialPageRoute(builder: (builder) => AddProduct()));
       }),
       child: Icon(Icons.add),
       ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                  stream: firebaseFirestore.collection("Products").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {

                      return snapshot.data!.docs.length==0?Center(child: Text("No Products")): GridView.builder(
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
                            var ds=snapshot.data!.docs[i];
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  ProductDetail(
                                                    productId: ds.id,
                                                  )));
                                    },
                                    child: Container(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 50,
                                        // backgroundImage:
                                        // NetworkImage(ds['imageLink']),
                                      child: CachedNetworkImage(
                                        imageUrl: ds['imageLink'],
                                        imageBuilder: (context,
                                            imageProvider) =>
                                            Container(
                                              decoration:
                                              BoxDecoration(
                                                shape:
                                                BoxShape.circle,
                                                image:
                                                DecorationImage(
                                                  image:
                                                  imageProvider,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                        placeholder: (context,
                                            url) =>
                                            Center(
                                                child: CircleAvatar(
                                                  radius: 50,
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: AssetImage("assets/infinity.gif"),
                                                )),
                                        errorWidget: (context,
                                            url, error) =>
                                            Center(
                                                child: Icon(
                                                    Icons.error)),
                                      ),
                                      ),
                                    ),
                                  ),
                                  Text(ds['productName'])
                                ],
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(child: Icon(Icons.error_outline));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }))])));
                  }
                
              
    
  }