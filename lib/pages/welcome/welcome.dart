import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearning/common/widgets/text_widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Container(
              color: Colors.amber,
              width: 400, 
              child: PageView(
                scrollDirection: Axis.vertical,
                children: [
                Column(
                  children: [
                    Image.asset("assets/images/reading.png",fit:BoxFit.fitWidth),

                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: text24Normal(text: "Hello"),),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: text16Normal(text: "forget about the paper all the data is in here learng aas much as you like"),
                      ),
                  ],
                ),
                
              ]),
            ),
            Positioned(
              child: Text("hello"),
              bottom: 100,
              left: 20,
            ),
            Positioned(
              child: Text("hello miya"),
              left: 200,
              bottom: 200,
            ),
          ],
        ));
  }
}
