import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<ScaffoldState> contactus_key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: contactus_key,
      backgroundColor: Color(0xFFf5f5f5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text("Contact Us"),
          backgroundColor: Colors.blue[600],
          elevation: 0,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.fromLTRB(0,50,0,10),
              height: 120,
              width: 120,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  fit: BoxFit.fill,
                  image: ExactAssetImage("assets/images/parking.png"),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.mail_outline, color: Colors.blue[900]), SizedBox(width: 10,),
                    Text("example@example.com", textAlign: TextAlign.left, style: TextStyle(color: Colors.blue[900], fontSize: 18,fontWeight: FontWeight.w600,letterSpacing: 0.3),),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.blue[900]), SizedBox(width: 10,),
                    Flexible(child:Text("Studio 4, Import Building, 2 Clove Cres, London, United Kingdom.", textAlign: TextAlign.left, style: TextStyle(color: Colors.blue[900], fontSize: 18,fontWeight: FontWeight.w600,letterSpacing: 0.3),),)
                  ],
                )
              ],
            ),
          ),
          // ============= Request Form Container ========================
          Container(
            margin: EdgeInsets.only(left:8, right:8, top: 26),
            padding: EdgeInsets.only(left:8, right:8),
            child: Text(
              "SEND YOUR QUERY",
              style: TextStyle(color: Colors.blue[900], letterSpacing: 1, fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: TextFormField(
              cursorColor: Colors.blue[900],
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: "John Rainner",
                labelStyle: TextStyle(color: Colors.blue[400]),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide(color: Colors.red.shade200, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide(color: Colors.red.shade200),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 2,)
                ),
              ),
              //validator: (String value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            padding: EdgeInsets.all(8),
            child: TextFormField(
              cursorColor: Colors.blue[900],
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                hintText: "something@something.com",
                labelStyle: TextStyle(color: Colors.blue[400]),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide(color: Colors.red.shade200, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide(color: Colors.red.shade200),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 2,)
                ),
              ),
              //validator: (String value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            padding: EdgeInsets.all(8),
            child: TextFormField(
              cursorColor: Colors.blue[900],
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Add your message',
                hintText: "Example...",
                labelStyle: TextStyle(color: Colors.blue[400]),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide(color: Colors.red.shade200, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  borderSide: BorderSide(color: Colors.red.shade200),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 2,)
                ),
              ),
              //validator: (String value) {},
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              height: 40,
              width: 200,
              child: RaisedButton(
                child: Text("SEND", style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.w700),),
                onPressed: _confirm_feedback,
                color: Colors.blue[400],
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.black45,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
              ),
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }

  _confirm_feedback(){

    Fluttertoast.showToast(
        msg: 'Your query successfully submitted.');
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pop();
      });
    });

  }

}