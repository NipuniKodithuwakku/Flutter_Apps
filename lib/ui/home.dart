import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioValue = 0;
  double _finalResult=0.0;

  final TextEditingController _weightController=new TextEditingController();
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResult=calculateWeight(_weightController.text,0.06);
          break;
        case 1:
          _finalResult=calculateWeight(_weightController.text,0.38);
          break;
        case 3:
          _finalResult=calculateWeight(_weightController.text,0.91);
          break;


      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Weight on Planet x"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent.shade400),
      backgroundColor: Colors.grey.shade100,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              "images/planet.png",
              height: 200.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: "in pounds",
                        labelText: "Your Weight on Earth",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                          activeColor: Colors.blueGrey,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.black),
                      ),
                      new Radio(
                          activeColor: Colors.blueGrey,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.black),
                      ),
                      new Radio(
                          activeColor: Colors.blueGrey,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.4)),
                  new Text(
                    "$_finalResult",
                    style: new TextStyle(
                        fontSize: 19.6,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightBlue),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  double calculateWeight(String weight,double multiplier){
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      return int.parse(weight)*multiplier;
    }else{
      print("wrong");
      return int.parse("180")*0.38;
    }

  }

}
