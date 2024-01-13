import 'package:flutter/material.dart';

class ActiveAvatar extends StatelessWidget {
  final bool isSessions;

  const ActiveAvatar({
    super.key,
    this.isSessions = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage('assets/images/219986.png'),
         ),
        // isSessions
        //     ? const SizedBox()
        //     : Positioned(
        //         bottom: 0,
        //         right: 6,
        //         child: CircleAvatar(
        //           radius: 6,
        //           backgroundColor: Colors.green.withOpacity(.5),
        //           child: const CircleAvatar(
        //               radius: 5, backgroundColor: Colors.green),
        //         ),
        //       )
      ],
    );
  }
}
