import 'package:booking_clinics/core/constant/extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/custom_button.dart';
import '../../../../core/constant/const_string.dart';
import '../../../../data/models/chat_model.dart';
import '../../../../data/models/doctor_model.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Chat with doctor",
      onTap: () async {
        String userId = FirebaseAuth.instance.currentUser!.uid;
        // Create a unique chatId
        String chatId = "${userId}_${doctor.id}";
        // Check if a chat already exists between the user and doctor
        DocumentSnapshot existingChat = await FirebaseFirestore.instance
            .collection('chats')
            .doc(chatId)
            .get();

        // If no chat exists, create a new one
        if (!existingChat.exists) {
          await FirebaseFirestore.instance.collection('chats').doc(chatId).set({
            'participants': [userId, doctor.id],
            'lastMessage': '',
            'lastMessageTime': FieldValue.serverTimestamp(),
          });
        }

        // Pass the unique chatId to the ChatDetailsScreen
        ChatModel chatModel = ChatModel(
          chatId: chatId,
          chatPartnerName: doctor.name,
          chatPartnerId: doctor.id,
        );

        context.nav.pushNamed(Routes.chatDetailsRoute, arguments: chatModel);
      },
    );
  }
}