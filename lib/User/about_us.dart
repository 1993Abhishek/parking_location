import 'package:flutter/material.dart';

class AboutUS extends StatefulWidget{
  const AboutUS({Key? key}) : super(key: key);

  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text("About Us"),
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
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text("Parking App", textAlign: TextAlign.center, style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,letterSpacing: 0.3),),
                ),
                SizedBox(height: 10,),
                Text(
                  "Headquartered in London’s Canary Wharf, YourParkingSpace is the UK’s most trusted online parking platform. Starting from the simple belief that parking could – and should – be easier, YourParkingSpace has been striving to make parking better since its foundation in 2013. Think of how you booked your last flight, rented a flat, booked a hotel, bought car insurance, or even found a date. Businesses like Skyscanner, Rightmove, Booking.com, MoneySupermarket and Match.com all spring to mind. These online businesses have only been around for a few years. They’re relatively new and yet they’re brands you recognise. Our aim is for YourParkingSpace to be the online business that springs to mind next time you want to park your car. The YourParkingSpace platform connects drivers with over 350,000 privately owned and commercially operated parking spaces across the UK, available to book hourly, daily, or monthly basis. Drivers can book parking on-demand through our website and mobile applications.",
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 0.3, color: Colors.grey[700],height: 1.3),),
                SizedBox(height: 30,),
                Text("Version: 1.0", textAlign: TextAlign.left, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,letterSpacing: 0.3),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
