import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BuyMenu_Optionbuy2Component extends StatefulWidget {
  int quantity;
  Function fun;
  BuyMenu_Optionbuy2Component({@required this.quantity, @required this.fun});
  @override
  _BuyMenu_Optionbuy2ComponentState createState() =>
      _BuyMenu_Optionbuy2ComponentState();
}

class _BuyMenu_Optionbuy2ComponentState
    extends State<BuyMenu_Optionbuy2Component> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      height: weight_screen * 0.2,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonModel(
            icon: Icons.remove,
            fun: this.widget.fun,
            status: -1,
          ),
          Container(
            child: Text(
              "${this.widget.quantity}",
              style: TextStyle(
                  fontSize: weight_screen * 0.1, fontWeight: FontWeight.w800),
            ),
          ),
          ButtonModel(
            icon: Icons.add,
            fun: this.widget.fun,
            status: 1,
          )
        ],
      ),
    );
  }
}

class ButtonModel extends StatefulWidget {
  IconData icon;
  Function fun;
  int status;
  ButtonModel({@required this.icon, @required this.fun, @required this.status});
  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  Color color = Color(0xfffa897b);
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.white;
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Color(0xfffa897b);
        });
        this.widget.fun(this.widget.status);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(weight_screen * 0.02),
            color: color),
        child: Icon(
          this.widget.icon,
          size: weight_screen * 0.11,
        ),
      ),
    );
  }
}
