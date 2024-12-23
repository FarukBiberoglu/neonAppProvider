import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astronot İletişim'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Consumer<CommunicationProvider>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.astronauts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${model.astronauts[index]}'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Mesaj Gönder"),
                              content: TextField(
                                controller: messageController,
                                decoration: InputDecoration(
                                  hintText: "Mesajınızı yazın",
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    model.sendMessage(
                                      model.astronauts[index],
                                      messageController.text,
                                    );
                                    messageController.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Text("Gönder"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),

          Expanded(
            flex: 2,
            child: Consumer<CommunicationProvider>(
              builder: (context, model, child) {
                if (model.messages.isEmpty) {
                  return Center(
                    child: Text("Henüz mesaj yok!"),
                  );
                }

                return ListView.builder(
                  itemCount: model.messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.messages[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
