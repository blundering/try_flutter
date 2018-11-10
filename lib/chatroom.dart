import 'package:flutter/material.dart';

const String _name = "{{_Name_}}";

class ChatRoom extends StatefulWidget {
	@override
	State<StatefulWidget> createState() => ChatRoomState();
}

class ChatRoomState extends State<ChatRoom> with TickerProviderStateMixin {
	final TextEditingController _textController = new TextEditingController();
	final List<ChatMessage> _messages = <ChatMessage>[];
	bool _isComposing = false;

	void _handleSubmitted(String text) {
		_textController.clear();
		ChatMessage message = new ChatMessage(
			text: text,
			animationController: AnimationController(
					vsync: this, duration: new Duration(milliseconds: 500)),
		);

		setState(() {
			_isComposing = false;
			_messages.insert(0, message);
		});

		message.animationController.forward();
	}

	@override
	Widget build(BuildContext context) {
		return new Column(
			children: <Widget>[
				new Flexible(
					child: new ListView.builder(
						padding: new EdgeInsets.all(8.0),
						reverse: true,
						itemBuilder: (_, int index) => _messages[index],
						itemCount: _messages.length,
					),
				),
				new Divider(
					height: 1.0,
				),
				new Container(
					decoration: new BoxDecoration(color: Theme.of(context).cardColor),
					child: _buildTextComposer(),
				),
			],
		);
	}

	Widget _buildTextComposer() {
		return new IconTheme(
				data: new IconThemeData(color: Theme.of(context).primaryColor),
				child: new Container(
						margin: const EdgeInsets.symmetric(horizontal: 16.0),
						child: new Row(
							children: <Widget>[
								new Flexible(
									child: new TextField(
										controller: _textController,
										onSubmitted: _handleSubmitted,
										onChanged: (String text) {
											setState(() {
												_isComposing = text.length > 0;
											});
										},
										decoration: InputDecoration.collapsed(
												hintText: "Send a message..."),
									),
								),
								new Container(
									margin: new EdgeInsets.symmetric(horizontal: 4.0),
									child: new IconButton(
										icon: new Icon(Icons.send),
										onPressed: _isComposing
												? () => _handleSubmitted(_textController.text)
												: null,
									),
								),
							],
						)));
	}

	@override
	void dispose() {
		for (ChatMessage message in _messages) {
			message.animationController.dispose();
		}
		super.dispose();
	}
}

class ChatMessage extends StatelessWidget {
	final String text;
	final AnimationController animationController;

	ChatMessage({this.text, this.animationController});

	@override
	Widget build(BuildContext context) {
		return new SizeTransition(
			sizeFactor: new CurvedAnimation(
					parent: animationController, curve: Curves.easeInOut),
			axisAlignment: 0.0,
			child: new Container(
				margin: const EdgeInsets.symmetric(vertical: 10.0),
				child: new Row(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						new Container(
							margin: const EdgeInsets.only(right: 16.0),
							child: new CircleAvatar(
								child: new Text(_name[0]),
							),
						),
						new Expanded(
							child: new Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
									new Text(
										_name,
										style: Theme.of(context).textTheme.subhead,
									),
									new Container(
										margin: const EdgeInsets.only(top: 5.0),
										child: new Text(text),
									),
								],
							),
						),
					],
				),
			),
		);
	}
}
