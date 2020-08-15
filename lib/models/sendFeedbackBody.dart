import 'package:flutter/material.dart';

class SendFeedbackBody {
  SendFeedbackBody({
    @required this.name,
    @required this.email,
    @required this.body,
  
    @required this.phone,
    
  });

  String name;
  String email;
 
  String body;
  String phone;
  
}
