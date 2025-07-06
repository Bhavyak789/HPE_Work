import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:hpe_work/widgets.dart/ui_colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class chatbot extends StatefulWidget {
  const chatbot({super.key});
  @override
  State<chatbot> createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {
  String chatUrl = 'bbs-fairy-ghost-raw.trycloudflare.com';
  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'You',
    //lastName: 'Name',
  );

  final ChatUser _chatBot = ChatUser(
    id: '2',
    firstName: 'Chatbot',
    //lastName: 'Name',
  );

  final List<ChatMessage> _messages = <ChatMessage>[];

  void _chat(ChatMessage msg) async {
    final url = Uri.http(chatUrl, 'chat'); //  '/chat response'

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'requestMsg': msg.text}),
    );

    // print('Fetching data from URL: $url');
    // print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    //final response = await http.get(url);

    final String _Tempdata = json.decode(response.body);
    print('Response data: $_Tempdata');
    setState(() {
      _messages.insert(
        0,
        ChatMessage(
          user: _chatBot,
          createdAt: DateTime.now(),
          text: _Tempdata, // Replace with the actual response text
        ),
      );
    });

    //final List<LogData2> _LoadChat = [];

    // for (final item in _Tempdata) {
    //   _LoadChat.add(

    //     ),
    //   );
    // }

    // setState(() {
    //   _data3 = _Loaddata;
    //   //initState();
    // });
  }

  @override
  void initState() {
    super.initState();
    _messages.add(
      ChatMessage(
        user: _chatBot,
        createdAt: DateTime.now(),
        text: "Hi!\nHow may I assist you today?",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child:
        // _messages.isEmpty
        //     ? Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         const Text(
        //           'No messages yet',
        //           style: TextStyle(fontSize: 20),
        //         ),
        //       ],
        //     )
        //     :
        DashChat(
          messageOptions: MessageOptions(
            // top: ,
            maxWidth: 650,
            // showTime: true,
            // timeFormat: DateFormat('hh:mm a'),
            containerColor: AppColors.primary,
            currentUserContainerColor: AppColors.primary2,
            textColor: AppColors.secondary,
          ),
          inputOptions: InputOptions(
            inputTextStyle: TextStyle(fontSize: 18),
            sendOnEnter: true,
            alwaysShowSend: false,

            inputDecoration: InputDecoration(
              hintText: 'Ask anything',
              hintStyle: TextStyle(color: Colors.grey),
              //suffixIcon: Icon(Icons.message, color: AppColors.primary2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.primary2),
              ),
            ),
          ),
          currentUser: _currentUser,
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },

          messages: _messages,
        ),
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    print(m.text);
    setState(() {
      _messages.insert(0, m);
      _chat(m);
    });
  }
}
