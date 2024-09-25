import 'package:flutter/material.dart';
import 'package:spacex_mobile/app.dart';
import 'injection.dart' as di;

void main() {
  runApp(const MyApp());

  di.init();
}


/*
query Dragons {
  # dragons {
  #   id
  #   type
  #   wikipedia
  # }
  rockets {
    name
  }
  # ships {
  #   name
  #   model
  #   url
  # }
  launches {
    mission_id
    rocket {
      rocket_name
    }
    details
  }
}

*/