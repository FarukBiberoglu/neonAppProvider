import 'package:flutter/material.dart';

class CommunicationProvider with ChangeNotifier {
  List<String> astronauts = ["Neil Armstrong", "Buzz Aldrin", "Yuri Gagarin"];

  List<String> messages = [];

  void sendMessage(String astronautt, String message) {
    messages.add("$astronautt 'un Gönderdiği mesaj : '$message'");
    notifyListeners();
  }
}
