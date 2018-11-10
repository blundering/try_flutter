import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
	@override
	Widget build(
		BuildContext context
		) {
		return GridView.count(
			crossAxisCount: 2,
			padding: EdgeInsets.all(16.0
			),
			childAspectRatio: 8.0 / 9.0,
			children: <Widget>[
				Card(
					child:Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							AspectRatio (
								aspectRatio: 18.0/11.0,
								child:Image.asset("assets/cat1.jpg"),
							),
							Padding(
								padding: EdgeInsets.fromLTRB(16.0, 22.0, 16.0, 8.0),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										Text("title"),
										SizedBox(height: 8.0,),
										Text("subTitle"),
									],
								),
							)
						],
					),
				),
				Card(),
				Card(),
				Card(),
			],
		);
	}
}
