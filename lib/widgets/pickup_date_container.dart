import 'package:flutter/material.dart';


class PickupDateContainer extends StatelessWidget {
  final String? day;
  final String? date;
  final VoidCallback? onTap;
  final bool selected;
  final Color? color;
  const PickupDateContainer({Key? key, this.day, this.date, this.onTap,required this.selected, this.color = Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black12)

          ),
        child: Column(
          children: [
            Container(
              height: 50,
              color:selected ? Colors.blue : Colors.grey,

              child: Center(
                child: Text(day!,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
              ),


            ),
            Container(
              height: 70,
              child: Center(
                child: Text(date!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
