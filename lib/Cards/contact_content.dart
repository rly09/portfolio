import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/section_header.dart';

class ContactContent extends StatefulWidget {
  const ContactContent({super.key});

  @override
  State<ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> sendEmail() async {
    const serviceId = 'service_5on02xb';
    const templateId = 'template_c7sebba';
    const userId = 'qKbrgkIldiHRZRm0a';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': _nameController.text,
          'email': _emailController.text,
          'title': _subjectController.text,
          'message': _messageController.text,
        }
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );
      _formKey.currentState?.reset();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send message. Try again!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: "Contact",
              iconPath: 'assets/icons/contact.png',
            ),
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                children: [
                  TextSpan(text: "Let's Work "),
                  TextSpan(text: 'Together', style: TextStyle(color: Color(0xFF00FF9F))),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'mailmeh@whatever.com',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 30),

            isMobile
                ? Column(
              children: [
                ContactField(controller: _nameController, label: 'Full Name *', hint: 'Enter Your Name'),
                ContactField(controller: _emailController, label: 'Email *', hint: 'Enter Your Email'),
                ContactField(controller: _subjectController, label: 'Subject *', hint: 'Enter Subject'),
                ContactField(controller: _messageController, label: 'Message', hint: 'Write your message...', maxLines: 6),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ContactField(controller: _nameController, label: 'Full Name *', hint: 'Enter Your Name'),
                      ContactField(controller: _emailController, label: 'Email *', hint: 'Enter Your Email'),
                      ContactField(controller: _subjectController, label: 'Subject *', hint: 'Enter Subject'),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: ContactField(controller: _messageController, label: 'Message', hint: 'Write your message...', maxLines: 10),
                ),
              ],
            ),

            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendEmail();
                  }
                },
                icon: const Icon(Icons.send_rounded, color: Colors.black),
                label: const Text('SEND', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final int maxLines;

  const ContactField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            style: const TextStyle(color: Colors.white),
            validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white54),
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
