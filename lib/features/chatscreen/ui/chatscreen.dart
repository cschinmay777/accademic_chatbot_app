import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  final List<String> _subjects = <String>["Dummy"];  
  int qno=0;

  void _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    // Simulating bot response
    await _getBotResponse(qno.toString(),text);
    qno+=1;
  }

  Future<String> CareerPrediction(List<String> inputData) async {
  // Define the API endpoint URL
  Uri url = Uri.parse('https://model-api-b6oz.onrender.com/predict'); // Replace with your actual URL

  // Encode the input data to JSON
  // String jsonData = json.encode(inputData);

  try {
    // Make the POST request
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(inputData),
    );

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Decode the response JSON string to a string
      // String outputString = json.decode(response.body);
      // Map<String, dynamic> jsonMap = json.decode(outputString);
      // print(jsonMap["result"]);
      // return jsonMap["result"];
      Map<String, dynamic> jsonMap = json.decode(response.body);
      print(jsonMap["result"]);
      return jsonMap["result"].toString();
    } else {
      // If the request was not successful, throw an error
      throw Exception('Failed to fetch data');
    }
  } 
  catch (error) {
    // Handle any errors that occurred during the request
    print('Error: $error');
    throw error;
  }
}

  Future<void> _getBotResponse(String questionno,String textmsg) async {
    String res=classifyResponse(textmsg);
    // print(textmsg);
    // print(res);
    if(res!="yes")
    {
      _subjects.removeLast();
    }
    String final_result="";
    if(questionno=="32")
    {
      print("Int the finals");
      print(questionno);
      print(qno);
      final_result=await CareerPrediction(_subjects);
      // await Future.delayed(Duration(seconds: 2), () {
      //         // Your code to be executed after the delay
      //         print("Loading");
      //       });
            print(final_result);
      
    }
    final apiUrl = Uri.parse('https://chat-api-lfwd.onrender.com/ask');
    String jsonBody = jsonEncode({"response": questionno});
    var response = await http.post( 
      apiUrl,
      headers: {'Content-Type': 'application/json'}, // Add headers specifying JSON content
    body: jsonBody,
      );

    if (response.statusCode == 200 || response.statusCode==201) {
      // Assuming the response contains the bot's message
      String botResponse = response.body;
      if(questionno=="32")
      {
        print(botResponse);
      }
      
      Map<String, dynamic> jsonMap = json.decode(botResponse);
  
  // Access individual entities
    String msg = jsonMap['question']; // Accessing value by key
    String sub = jsonMap['subject'];
    // print(msg);
    // print(sub);
    _subjects.add(sub);
      ChatMessage botMessage = ChatMessage(
        text:(questionno=="32")? msg+ "\n Career : "+final_result : msg,
        isUserMessage: false,
      );
      setState(() {
        _messages.insert(0, botMessage);
      });
    } else {
      print('Failed to fetch bot response: ${response.statusCode}');
      // Handle error here
    }
    print(_subjects);

  }

  String classifyResponse(String response) {
    String responseLower = response.toLowerCase();

    List<String> positiveKeywords = [
      'yes', 'like', 'love', 'enjoy', 'occasionally', 'holidays', 'definitely',
      'absolutely', 'frequently', 'often', 'always', 'often', 'fond of', 'great',
      'amazing', 'fun'
    ];

    List<String> negativeKeywords = [
      'no', 'not', 'dislike', 'hate', 'rarely', 'never', 'seldom', 'occasionally not',
      'infrequently', 'awful', 'terrible', 'disgust', 'not at all', 'uninterested', 'boring'
    ];

    for (String keyword in positiveKeywords) {
      if (responseLower.contains(keyword)) {
        return 'yes';
      }
    }

    for (String keyword in negativeKeywords) {
      if (responseLower.contains(keyword)) {
        return 'no';
      }
    }

    return 'unclear';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot',
        style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 2.0, // Specify border width here
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),

          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration:
                    
                        InputDecoration.collapsed(hintText: 'Send a message'),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(maxWidth: 200),
            decoration: BoxDecoration(
              color: isUserMessage
                  ? Theme.of(context).primaryColor
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white,
              fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
