import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetFuc;

  Result(this.resultScore, this.resetFuc);
  //Getter used here
  String get resword {
    var resText;
    if (resultScore <= 3) {
      resText = "You\'re a Good Person!!";
    } else if (resultScore <= 6) {
      resText = "Not a Bad Person!!";
    } else if (resultScore <= 9) {
      resText = "Think about it Man!!";
    } else {
      resText = "Come-on be serious Man!!";
    }
    return resText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              Text(
                resword,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              TextButton(onPressed: resetFuc, child: Text('Restart'))
            ],
          ),
        ],
      ),
    );
  }
}
