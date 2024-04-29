import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyExerciseTimer extends StatefulWidget {
  @override
  _MyExerciseTimerState createState() => _MyExerciseTimerState();
}

class _MyExerciseTimerState extends State<MyExerciseTimer> {
  int _secondsElapsed = 0;
  late Timer _timer;
  bool _isTimerRunning = false;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void _toggleTimer() {
    setState(() {
      _isTimerRunning = !_isTimerRunning;
      if (_isTimerRunning) {
        _startTimer();
      } else {
        _timer.cancel();
      }
    });
  }

  void _restartTimer() {
    _timer.cancel();
    setState(() {
      _secondsElapsed = 0;
      _isTimerRunning = false;
    });
  }

  String _formattedTime() {
    final minutes = _secondsElapsed ~/ 60;
    final seconds = _secondsElapsed % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.black.withOpacity(0.7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Time Elapsed: ${_formattedTime()}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _toggleTimer,
                icon: FaIcon(_isTimerRunning ? FontAwesomeIcons.pause : FontAwesomeIcons.play),
                color: Colors.black,
                iconSize: 40,
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: _restartTimer,
                icon: FaIcon(FontAwesomeIcons.undo),
                color: Colors.black,
                iconSize: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: MyExerciseTimer(),
      ),
    ),
  ));
}
