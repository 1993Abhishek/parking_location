import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:parking_location/User/registration.dart';
import 'package:parking_location/theme/bottom_bar.dart';
import '../theme/top_bar.dart';
import 'dashboard.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _hasFingerPrintSupport = false;
  String _authorizedOrNot = "Not Authorized";
  @override
  void initState() {
// TODO: implement initState
    _getBiometricsSupport();
    //_getAvailableSupport();
    super.initState();
  }

  Future<void> _getBiometricsSupport() async {
    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _hasFingerPrintSupport = hasFingerPrintSupport;
    });
  }


  Future<void> _authenticateMe() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: "Authenticate for Testing", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
      setState(() {
        _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";
        if(_authorizedOrNot == "Authorized"){
          Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => new DashboardPage()));
        }
      });
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.blue.shade200,
            elevation: 0,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: Stack(
            children: <Widget>[
              Container(
                child: TopBar(),
              ),
              /*Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height-160
                  ),
                  child: BottomBar()
              ),*/
              Align(
                alignment: Alignment.center,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0,50,0,10),
                          height: 120,
                          width: 120,
                          color: Colors.transparent,
                          child: Image(
                              fit: BoxFit.fill,
                              image: ExactAssetImage("assets/images/parking.png"),
                            ),
                        ),
                        Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.only(top: 30.0,right: 32,left: 32),
                            child: Column(
                                children: <Widget>[
                                  Container(
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      //controller: _user_email,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                          borderSide: BorderSide(color: Colors.red.shade200, width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                          borderSide: BorderSide(color: Colors.red.shade200),
                                        ),
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                          color: Colors.grey[500],
                                        ),
                                        prefixIcon: Container(
                                            margin: const EdgeInsets.only(left: 20, right: 15),
                                            child: Icon(
                                              Icons.email,
                                              color: Colors.black,
                                            )
                                        ),
                                      ),
                                      autofocus: false,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                      child: TextField(
                                        //controller: _user_password,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                            borderSide: BorderSide(color: Colors.red.shade200, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                            borderSide: BorderSide(color: Colors.red.shade200),
                                          ),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                          prefixIcon: Container(
                                              margin: const EdgeInsets.only(left: 20, right: 15),
                                              child: Icon(
                                                Icons.vpn_key,
                                                color: Colors.black,
                                              )
                                          ),
                                        ),
                                        autofocus: false,
                                        obscureText: true,
                                        onChanged: (text) {
                                          setState(() {
                                            //password = text;
                                            //you can access nameController in its scope to get
                                            // the value of text entered as shown below
                                            //fullName = nameController.text;
                                          });
                                        },
                                      )
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    //padding: EdgeInsets.only(top: 5,right: 35),
                                      alignment: Alignment.centerRight,
                                      width: double.maxFinite,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push( context, MaterialPageRoute( builder: (context) => new ForgetPasswordPage()));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text('Forget Password?',textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.green.shade600),
                                          ),
                                        ),
                                      )
                                  ),
                                  SizedBox(
                                      height: 15
                                  ),
                                  Container(
                                    //margin: EdgeInsets.only(top: 50),
                                    width: double.maxFinite,
                                    height: 60,
                                    child: RaisedButton(
                                      padding: const EdgeInsets.all(8.0),
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.blue.shade400,
                                      onPressed: (){
                                        Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => new DashboardPage()));
                                      },
                                      child: new Text("Login",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),

                                    ),
                                  ),
                                  SizedBox(
                                      height: 15
                                  ),
                                  Container(
                                    //margin: EdgeInsets.only(top: 50),
                                    width: double.maxFinite,
                                    height: 60,
                                    child: RaisedButton(
                                      padding: const EdgeInsets.all(8.0),
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.blue.shade400,
                                      onPressed: (){
                                        _authenticateMe();
                                      },
                                      child: new Text("Fingerprint Login",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),

                                    ),
                                  ),
                                  SizedBox(
                                      height: 30
                                  ),
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        "CREATE ACCOUNT",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push( context, MaterialPageRoute( builder: (context) => new RegistrationPage()));
                                    },
                                  ),
                                  SizedBox(
                                      height: 5
                                  ),
                                ]
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}