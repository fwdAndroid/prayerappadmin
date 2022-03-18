import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({ Key? key }) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Portal'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/add.png')),
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
                  child: ElevatedButton(onPressed: (){}, child: Text('Add Product'),style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 60)
                  ),),
                )
        ],
      ),
    );
  }
}