import 'package:flutter/material.dart';
import 'chatroom.dart';
import 'util/makepage.dart';

class LoginPage extends StatefulWidget {
    @override
    State<StatefulWidget> createState(
        ) => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    @override
    Widget build(
        BuildContext context
        ) {
        return new SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0
                ),
                children: <Widget>[
                    SizedBox(
                        height: 120.0,
                    ),
                    Column(
                        children: <Widget>[
                            Container(
                                constraints: new BoxConstraints.expand(
                                    width: 100.0,
                                    height: 100.0,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/rubin.png'
                                        ),
                                        fit: BoxFit.cover
                                    ),
                                    boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.grey[500],
                                            offset: Offset(4.0, 12.0),
                                            blurRadius: 6.0
                                        )
                                    ],
                                ),
                            ),
                            SizedBox(
                                height: 36.0,
                            ),
                            Text(
                                "Rubin's APP",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            SizedBox(
                                height: 70.0,
                            ),
                            TextField(
                                cursorRadius: Radius.circular(50.0),
                                controller: _usernameController,
                                decoration: InputDecoration(
                                    fillColor: Theme
                                        .of(context
                                    )
                                        .cardColor,
                                    filled: true,
                                    labelText: "用户名",
                                    hintText: "请输入您的用户名",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0
                                            )
                                        )
                                    ),
                                ),
                            ),
                            SizedBox(
                                height: 20.0,
                            ),
                            TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    fillColor: Theme.of(context).cardColor,
                                    filled: true,
                                    labelText: "密码",
                                    hintText: "请输入您的密码",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                        ),
                                    ),
                                ),
                                obscureText: true,

                            ),
                            ButtonBar(
                                children: <Widget>[
                                    FlatButton(
                                        child: Text("取消"
                                        ),
                                        onPressed: (
                                            ) {
                                            _usernameController.clear();
                                            _passwordController.clear();
                                        },
                                    ),
                                    RaisedButton(
                                        child: Text("确定"
                                        ),
                                        onPressed: (
                                            ) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => MakePage(body: ChatRoom(),),
                                                ),
                                            );
                                        },
                                    ),
                                ],
                            ),
                        ],
                    )
                ],
            )
        );
    }
}
