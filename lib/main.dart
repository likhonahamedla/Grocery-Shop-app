import 'package:flutter/material.dart';
import 'cartProvider.dart';
import 'package:provider/provider.dart';

import 'myapp.dart';

main() {
  runApp(ChangeNotifierProvider(create: (_) => CartProvider(), child: MyApp()));
}
