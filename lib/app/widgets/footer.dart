import 'package:flutter/material.dart';
import 'package:evisa/changes/links.dart';
import 'package:evisa/core/util/constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      child: const Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Copyright "),
            InkWell(
              // onTap: () => openURL(gitHub),
              child: Text(
                "© 2023 Government of Guyana. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text("All rights reserved."),
          ],
        ),
      ),
    );
  }
}
