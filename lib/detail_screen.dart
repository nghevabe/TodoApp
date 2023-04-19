import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailScreenBody();
  }
  
}


class DetailScreenBody extends StatelessWidget {
  const DetailScreenBody();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(height: 36),
          Text("Detail Screen"),
          SvgPicture.asset('assets/ic_share.svg'),

        ],
      ),
    );
    
  }
}