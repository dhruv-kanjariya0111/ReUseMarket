import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ReUseMarket/controller/chat/send_message_function.dart';
import 'package:ReUseMarket/model/chatmodel/chat_mobx.dart';
import 'package:ReUseMarket/view/core/appbar_widget.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/widgets.dart';

class MessageScreen extends StatelessWidget {
  final String recieverEmail;
  final String? recieverName;
  final String? senderName;
   MessageScreen(
      {super.key,
      required this.recieverEmail,
      this.recieverName,
      this.senderName});
   final ChatModel chatModel = ChatModel();
   final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarWidget(title: recieverName ?? "name"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              
                stream: FirebaseFirestore.instance
                    .collection("chat")
                    .doc(getChatId(
                        FirebaseAuth.instance.currentUser!.email.toString(),
                        recieverEmail))
                    .collection("messages")
                    .orderBy('dateTimeNow', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot? querySnapshot = snapshot.data;
                    List<QueryDocumentSnapshot> documents = querySnapshot!.docs;
                    List<Map<String, dynamic>> items = documents
                        .map((e) => e.data() as Map<String, dynamic>)
                        .toList();
                    if (items.isEmpty) {
                      return const Center(
                        child: Text("No messages yet"),
                      );
                    }

                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final messageField = items[index];
                        return messagesCard(messageField['senderEmail'],
                            messageField["message"], messageField["time"]);
                      },
                    );
                  }
                  return const Center(
                    child: Text("No messages yet"),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(62, 84, 84, 84),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: TextFormField(
                      controller: chatModel.sendMessageController,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                kwidth10,
                FloatingActionButton(
                  backgroundColor: Color(0xFF07A3B2),
                  child: const Icon(
                    Icons.send,
                    color: kwhiteColor,
                  ),
                  onPressed: () async {
                    if (chatModel.sendMessageController.text.isEmpty) {
                      return;
                    }
                    await sendMessage(
                        receiverEmail: recieverEmail,
                        message: chatModel.sendMessageController.text,
                        recieverName: recieverName!,
                        senderName: senderName!);
                    chatModel.sendMessageController.clear();
                    focusNode.unfocus();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget messagesCard(senderEmail, message, time) {
  bool check =
      FirebaseAuth.instance.currentUser!.email.toString() == senderEmail;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (check) const Spacer(),
        if (!check)
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 10,
            child: Icon(
              Icons.person,
              size: 13,
              color: Colors.white,
            ),
          ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            decoration: messagesCardStyle(check),
            child: Text(
              '$message\n\n$time',
              style: TextStyle(color: check ? Colors.white : Colors.black),
            ),
          ),
        ),
        if (check)
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 10,
            child: Icon(
              Icons.person,
              size: 13,
              color: Colors.white,
            ),
          ),
        if (!check) const Spacer(),
      ],
    ),
  );
}

messagesCardStyle(check) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: check ? Colors.blue.shade900 : Colors.grey.shade300,
  );
}
