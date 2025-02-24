import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

final crossAxisCount = kIsWeb ? 3 : 2;

double getTextMessageWidth(BuildContext context){
  return kIsWeb ? MediaQuery.of(context).size.width/2 : MediaQuery.of(context).size.width/1.3;
}