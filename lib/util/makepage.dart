import 'package:flutter/material.dart';

import 'package:rubin_app/product_grid.dart';

class MakePage extends StatelessWidget
{
    final Widget body;
    MakePage({this.body});
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text("hello"),
                leading: IconButton(
                    icon: Icon(
                        Icons.menu,
                        semanticLabel: "菜单",
                    ),
                    onPressed: () {
                        print("菜单");
                    }
                ),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(
                            Icons.shopping_cart,
                            semanticLabel: "商城",
                        ),
                        onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                    builder: (context) => MakePage(body: ProductGrid(),)
                            )
                            );
                        },
                    ),
                    IconButton(
                        icon: Icon(
                            Icons.search,
                            semanticLabel: "搜索",
                        ),
                        onPressed: () {
                            print("搜索");
                        },
                    ),
                    IconButton(
                        icon:Icon(
                            Icons.home,
                            semanticLabel: "首页",
                        ),
                        onPressed: () {
                            print("首页");
                        },
                    ),
                ],
            ),
            body: body,
        );
    }
}
