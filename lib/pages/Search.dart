import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

// components
import 'package:e_commerce/components/SearchBar.dart';

// utils
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void speechToText() async {
    print('inside speech to text-');
    print(_isListening);
    if (!_isListening) {
      print('inside listening');
      bool available = await _speech.initialize(
          onStatus: (val) => print('onStatus $val'),
          onError: (val) => print('onError $val'));
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
            onResult: (val) => setState(() {
                  _text = val.recognizedWords;
                  if (val.hasConfidenceRating && val.confidence > 0) {
                    _confidence = val.confidence;
                    print('confidence--------- $_confidence');
                  }
                }));
        setState(() => _isListening = false);
      } else {
        setState(() => _isListening = false);
        _speech.stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        speechToText: speechToText,
        isListening: _isListening,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                _text,
                style: TextStyle(color: kBasicTextColor, fontSize: 30.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
