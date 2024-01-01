
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/image_helper.dart';

class CustomRating extends StatefulWidget {
  final double? height;
   CustomRating({super.key,  this.height});

  @override
  State<CustomRating> createState() => _CustomRatingState();
}

class _CustomRatingState extends State<CustomRating> {
  int _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
                onTap: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
                child: index < _rating
                    ? SvgPicture.asset(
                  ImagesHelper.starIcon,
                  height:widget.height?? 20,
                )
                    : SvgPicture.asset(
                  ImagesHelper.starIcon,
                  color: Colors.grey,
                  height:widget.height?? 20,
                )),
          );
        }),
      ),
    );
  }
}
