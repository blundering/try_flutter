import 'package:flutter/material.dart';
import 'login.dart';
import 'util/makepage.dart';

void main() => runApp(new RubinApp());

class RubinApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: "Hello World!",
			home: new HomePage(),
			theme: new ThemeData(
//				primaryColor: Colors.red,
				accentColor: Colors.green,
//				cardColor: Colors.grey[200],
			),
		);
	}
}

class HomePage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MakePage(body: new LoginPage(),);
	}
}
