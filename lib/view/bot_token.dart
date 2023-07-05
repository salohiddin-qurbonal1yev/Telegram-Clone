// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unired_telegram/data/service/client_service.dart';

class BotToken extends StatefulWidget {
  const BotToken({Key? key}) : super(key: key);

  @override
  _BotTokenState createState() => _BotTokenState();
}

class _BotTokenState extends State<BotToken> {
  final botToken =
      "6111682390:AAEV-mnau61jkHnssnsiSNX8vJ9pA8EEJKg"; // bot token
  final apiId = 22810062; // api Id
  final apiHash = "545491b400fb786b89fc22dd9d664f81"; // api Hash

  // Variables
  String? _phoneNumber;
  String? _phoneCodeHash;
  String? _verificationCode;
  String? _authToken;

  // sendCode
  Future<void> _sendCode() async {
    final url =
        Uri.parse('https://api.telegram.org/bot$botToken/auth/sendCode');
    final response = await http.post(url, body: {
      'phone_number': "941636067",
      'api_id': apiId.toString(),
      'api_hash': apiHash,
    });
    debugPrint(response.body.toString());
    // final result = jsonDecode(response.body)['result'];
    // _phoneCodeHash = result['phone_code_hash'];
    // setState(() {});
  }

  // sign In
  void _signIn() async {
    final url = Uri.https('core.telegram.org', '/bot$botToken/auth/signIn');
    final response = await http.post(url, body: {
      'phone_number': _phoneNumber,
      'phone_code_hash': _phoneCodeHash,
      'phone_code': _verificationCode,
      'api_id': apiId.toString(),
      'api_hash': apiHash,
    });
    final result = jsonDecode(response.body)['result'];
    _authToken = result['auth_token'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telegram Auth'),
      ),
      body: Center(
        child: _authToken == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Phone number',
                    ),
                    onChanged: (value) => _phoneNumber = value,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _sendCode,
                    child: const Text('Send Code'),
                  ),
                  const SizedBox(height: 20),
                  if (_phoneCodeHash != null)
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Verification code',
                      ),
                      onChanged: (value) => _verificationCode = value,
                    ),
                  if (_phoneCodeHash != null) const SizedBox(height: 20),
                  if (_phoneCodeHash != null)
                    ElevatedButton(
                      onPressed: _signIn,
                      child: const Text('Sign In'),
                    ),
                ],
              )
            : Text(
                'You are authenticated! Auth token: $_authToken',
                style: const TextStyle(fontSize: 20),
              ),
      ),
      // Floating action button
      floatingActionButton: FloatingActionButton(
        // on Pressed
        onPressed: () async {
          await TelegramClient(
                  // chat Id
                  chatId: "5427926048",
                  // bot Token
                  botToken: "6111682390:AAEV-mnau61jkHnssnsiSNX8vJ9pA8EEJKg")
              .sendMessage("Hello this is Unired Telegram Bot!!");
        },
      ),
    );
  }
}
