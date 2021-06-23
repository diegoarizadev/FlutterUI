import 'package:flutter/material.dart';

class HeaderSqare extends StatelessWidget {
  const HeaderSqare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.orange,
    );
  }
}

class HeadersRoundedEdges extends StatelessWidget {
  const HeadersRoundedEdges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}
