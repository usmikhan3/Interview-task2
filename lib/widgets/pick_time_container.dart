import 'package:flutter/material.dart';

class PickupTimeContainer extends StatelessWidget {
  final String? time;
  final VoidCallback? onTap;
  final bool selected;

  const PickupTimeContainer({
    Key? key,
    this.time,
    this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),

      height: 50,
        width: 100,
        decoration: BoxDecoration(
          color:selected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black12),),
        child: Center(
          child: Text(
            time!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
          ),
        ),
      ),
    );
  }
}
