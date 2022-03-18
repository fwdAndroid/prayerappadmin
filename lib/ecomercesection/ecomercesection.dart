import 'package:flutter/material.dart';
import 'package:prayerappadmin/ecomercesection/add_product.dart';
import 'package:prayerappadmin/ecomercesection/product_detail.dart';

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
              child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        itemCount: 2,
                        itemBuilder: (ctx, i) {
                          
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
                                                ProductDetail()));
                                  },
                                  child: Container(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage('assets/laptop.png'),
                                    ),
                                  ),
                                ),
                                Text("Laptop")
                              ],
                            ),
                          );
                        }))])));
                  }
                
              
    
  }