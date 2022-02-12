import 'package:flutter/material.dart';

class AddSolutions extends StatefulWidget {
  const AddSolutions({ Key? key }) : super(key: key);

  @override
  _AddSolutionsState createState() => _AddSolutionsState();
}

class _AddSolutionsState extends State<AddSolutions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Add Solution'),
       
             
       
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
              child: TextFormField(
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
              child: TextFormField(
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
              child: TextFormField(
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
              child: TextFormField(
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
                  // focusedBorder:OutlineInputBorder(
                  //   // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  //   borderRadius: BorderRadius.circular(25.0),
                  // hintTextDirection: HitTestDispatcher.,
                ),
              )),
    

              SizedBox(
                height: 10,
              ),
OutlinedButton(
      onPressed: () {
        debugPrint('Received click');
      },
      child: const Text('Add Audio'),
    ),

              SizedBox(height: 20,),
               ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff00722d),
                minimumSize: Size(240, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                //  Navigator.push(context,
                //    MaterialPageRoute(builder: (context) =>MainBottom()));
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20),
              ),
            ),
      
        ],
      ),
    );
  }
}