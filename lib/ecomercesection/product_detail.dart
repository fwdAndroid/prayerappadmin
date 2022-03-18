import 'package:flutter/material.dart';
import 'package:prayerappadmin/ecomercesection/add_product.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({ Key? key }) : super(key: key);

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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder) => AddProduct()));
              },
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.edit),
                      ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.delete),
          ),
         
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Image.asset('assets/laptop.png'),
        SizedBox(
          height: 40,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text('Laptop')),
        SizedBox(
          height: 40,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text('Product Description')),
        SizedBox(
          height: 40,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text('Product Price')),
      ]),
      
    );
  }
}