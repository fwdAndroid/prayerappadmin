import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({ Key? key }) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Color(0xff00722d),
        title: Text('Payment details'),
        centerTitle: true,
        
        ),
        body: 
         ListView.builder(itemCount: 5,
        itemBuilder: (BuildContext context,int index){ return Container(
             margin: EdgeInsets.symmetric(horizontal: 30),
             child: Card(
               elevation: 5,
                 child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                 
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                   
                  Center(child: Text('22-Dec-2022',style: TextStyle(color: Colors.grey),))
                  ],
                ),
              ],
                 ),
               ),
           );
          })
          ) 
         );
    
  }
}