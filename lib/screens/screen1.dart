import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:interviewtask2/widgets/pick_time_container.dart';
import 'package:interviewtask2/widgets/pickup_date_container.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  String? _dropDownValue;
  String? _dropDown2Value;

  List<Map<String, dynamic>> datesList = <Map<String, dynamic>>[
    {'day': 'Fri', 'date': '25 Jun'},
    {'day': 'Sat', 'date': '26 Jun'},
    {'day': 'Sun', 'date': '27 Jun'},
  ];

  List<Map<String, dynamic>> timeList = <Map<String, dynamic>>[
    {'time': '7am  - 9am'},
    {'time': '10am  - 12pm'},
    {'time': '1pm  - 3pm'},

  ];

  int dateSelected = 0;
  int timeSelected = 0;

  void checkDateOption(int index) {
    setState(() {
      dateSelected = index;
    });
  }

  void checkTimeOption(int index) {
    setState(() {
      timeSelected = index;
    });
  }

  bool repeatedTogglevalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pickup Date"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Spacer(),
                Text(
                  "When would you like your pickup?",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
                Spacer(),
                Icon(
                  Icons.account_tree,
                  color: Colors.lightBlueAccent,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //TODO: PICK DATES
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < datesList.length; i++)
                PickupDateContainer(
                  day: datesList[i]['day'] as String,
                  date: datesList[i]['date'] as String,
                  onTap: () => checkDateOption(i + 1),
                  selected: i + 1 == dateSelected,
                )
            ],
          ),

          SizedBox(
            height: 20,
          ),


          Text(
            "Available Time Slots",
            style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontStyle: FontStyle.italic),
          ),

          SizedBox(
            height: 20,
          ),

          //TODO:// PICK TIME


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                for (int i = 0; i < timeList.length; i++)
                  PickupTimeContainer(
                    time: timeList[i]['time'],
                    selected: i + 1 == timeSelected,
                    onTap: () => checkTimeOption(i + 1),)
            ],
          ),
          SizedBox(
            height: 20,
          ),


          //TODO: repeat toggle
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(3,5),
                  spreadRadius: 2
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text("Repeat PickUp",style: TextStyle(color: Colors.grey,fontSize: 20,fontStyle: FontStyle.italic),),
                Container(
                  child: FlutterSwitch(
                    width: 70,
                    height: 30,
                    valueFontSize: 25.0,
                    toggleSize: 30,
                    value: repeatedTogglevalue,
                    borderRadius: 30.0,
                    padding: 8.0,
                    //showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        repeatedTogglevalue = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "How Often Repeat?",
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(3,5),
                      spreadRadius: 2
                  )
                ]
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: _dropDownValue,
              items: <String>['Every Week', 'Every Month', 'Every Day', 'Alternate'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (val) {
                setState(
                      () {
                    _dropDownValue = val;
                  },
                );
              },
            ),
          ),


          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "How many times?",
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(3,5),
                      spreadRadius: 2
                  )
                ]
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: _dropDown2Value,
              items: <String>['1', '2', '3', '4'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (val) {
                setState(
                      () {
                    _dropDown2Value = val;
                  },
                );
              },
            ),
          ),


          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(

                onPressed: (){}, child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18),),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),),),
            ),
          ),




        ],
      ),
    );
  }
}
