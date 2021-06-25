import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            // height: 200,
            // width: double.infinity,
            color: Colors.green,
          )),
          Expanded(
              child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                    child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.blue,
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
