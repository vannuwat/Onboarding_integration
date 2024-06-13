import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSelection extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    TextStyle selectedTextStyle = TextStyle(
    color: Colors.blue,
    decorationColor: Colors.blue,
    decoration: TextDecoration.underline
  );

  TextStyle unselectedTextStyle = TextStyle(
    color: Colors.grey,
    decorationColor: Colors.grey,
    decoration: TextDecoration.underline
  );
    
    return(
      Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            GestureDetector(
              onTap: (){                   
                context.setLocale(Locale('en')
                );
              },
              child: Text('EN', style: context.locale==Locale('en') ? selectedTextStyle : unselectedTextStyle),
            ),
            Text(' | '),
            GestureDetector(
              onTap: (){                    
                context.setLocale(Locale('th')
                );
              },
              child: Text('TH', style: context.locale==Locale('th') ? selectedTextStyle : unselectedTextStyle ),
            )
          ],
        ),
      )
    );
  }
}