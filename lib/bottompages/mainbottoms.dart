import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayerappadmin/BottomPagesclass/payment.dart';
import 'package:prayerappadmin/BottomPagesclass/question.dart';

class MainBottom extends StatefulWidget {
     PageController? pageController;


  @override
  _MainBottomState createState() => _MainBottomState();
}

class _MainBottomState extends State<MainBottom> {
        int _pages = 0;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
   widget.pageController = PageController();
  }
 @override
 void dispose(){
   super.dispose();
   widget.pageController!.dispose();
 }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
          CupertinoTabBar(backgroundColor: Colors.white, 
          onTap: navigateTapped,
          
          items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.payment,
              color: _pages == 0 ? Colors.green : Colors.black,
            ),
            label: '',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer,
              color: _pages == 1 ? Colors.green : Colors.black,
            ),
            label: '',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(

            icon: Icon(
              Icons.add_circle,
              color: _pages == 2 ? Colors.green : Colors.black,
            ),
            label: '',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _pages == 3 ? Colors.green : Colors.black,
            ),
            label: '',
            backgroundColor: Colors.green),
       
      ]),
      body: PageView(
        children:[
          Payment(),
          Questions(),
          Payment(),
          Payment(),
        ],
        controller: widget.pageController,
        onPageChanged: onPageChanged,
      )
    );
  }

  void navigateTapped(int value) {
    widget.pageController!.jumpToPage(value);

  }

  void onPageChanged(int value) {
    setState(() {
      _pages = value;
   }
    );
  }
}