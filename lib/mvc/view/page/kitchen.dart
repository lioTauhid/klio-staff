
import 'package:flutter/material.dart';
import 'package:klio_staff/constant/color.dart';
import 'package:klio_staff/constant/value.dart';

import '../widget/custom_widget.dart';

class Kitchen extends StatelessWidget {
  const Kitchen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 40,
        childAspectRatio: (1.1 / 1.3),
        children: List.generate(9, (index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            shadowColor: Colors.black12,
            child: Container(
                child: Column(
                  children: [
                    topContainer(context),
                    for(int x = 1; x<=3;x++)...[
                      innerItemCard(context),
                    ],
                    footerCard()
                  ],
                ),
            ),
          );
        }),
      ),
    );
  }


  Widget topContainer(BuildContext context){
    return  Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft:Radius.circular(10.0),
        ),
      ),
      height: MediaQuery.of(context).size.height*0.1,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Invoice:", style: TextStyle(fontSize: fontVerySmall, color: white)),
                Text("26:33",style: TextStyle(fontSize: fontVerySmall, color: white)),
              ],
            ),
            Text("Table No:",style: TextStyle(fontSize: fontVerySmall, color: white)),
          ],
        ),
      ),
    );
  }
  Widget innerItemCard(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width:1.0,color: primaryBackground),
        ),
        color: white,
      ),
      height: MediaQuery.of(context).size.height*0.15,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Prawn Chowmin:", style: TextStyle(fontSize: fontVerySmall, color: black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Container(
                   child:Row(
                     children: [
                       Text("Quantity:", style: TextStyle(fontSize: fontVerySmall, color: black,fontWeight: FontWeight.w100)),
                       SizedBox(width: 10,),
                       Text("Size:", style: TextStyle(fontSize: fontVerySmall, color: black,fontWeight: FontWeight.w100)),
                     ],
                   )
                 ),
                roundTextButton(
                  Text("Pending",style: TextStyle(fontSize: fontSmall,color: secondaryRed,),),
                  borderRadius: 20,
                  backgroundColor: secondaryPurple,
                  onPressed: (){},
                ),
              ],
            ),
            roundTextButton(
              Text("Ice Cream",style: TextStyle(fontSize: fontSmall,color: accentColor,),),
              borderRadius: 20,
              backgroundColor: secondaryAccentColor,
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }

  Widget footerCard(){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        roundTextButton(
          Text("Select All",style: TextStyle(fontSize: fontSmall,color: black,),),
          borderRadius: 20,
        //  backgroundColor: secondaryAccentColor,
          borderSideColor: alternate,
          onPressed: (){},
        ),
        roundTextButton(
          Text("Unselect All",style: TextStyle(fontSize: fontSmall,color: black,),),
          borderRadius: 20,
         // backgroundColor: secondaryAccentColor,
          borderSideColor: alternate,
          onPressed: (){},
        ),
        roundTextButton(
          Text("Cook",style: TextStyle(fontSize: fontSmall,color: accentColor,),),
          borderRadius: 20,
        //  backgroundColor: secondaryAccentColor,
          borderSideColor: accentColor,
          onPressed: (){},
        ),
        roundTextButton(
          Text("Done",style: TextStyle(fontSize: fontSmall,color: white,),),
          borderRadius: 20,
          backgroundColor:primaryColor ,
          onPressed: (){},
        ),
      ],
    );
  }

}

