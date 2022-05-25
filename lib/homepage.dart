import 'package:egistic_ui_test/ticks/blue_tick_view.dart';
import 'package:egistic_ui_test/ticks/green_tick_view.dart';
import 'package:egistic_ui_test/ticks/yellow_tick_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _yellowController, _greenController, _blueController;
  //bool _isCompletedY = false;
  int _value = 200;

  @override
  void initState() {
    super.initState();
    _yellowController = AnimationController(
        duration: Duration(milliseconds: _value), vsync: this);

    _greenController = AnimationController(
        duration: Duration(milliseconds: _value), vsync: this);

    _blueController = AnimationController(
        duration: Duration(milliseconds: _value), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 350, 15, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: yellowTap,
                    child: MySizedBox(
                      painter: YellowTickPainter(_yellowController.view),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: greenTap,
                    child: MySizedBox(
                      painter: GreenTickPainter(_greenController.view),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: blueTap,
                    child: MySizedBox(
                      painter: BlueTickPainter(_blueController.view),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: yellowTap,
                    child: MySizedBox(
                      painter: YellowTickPainter(_yellowController.view),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: greenTap,
                    child: MySizedBox(
                      painter: GreenTickPainter(_greenController.view),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: blueTap,
                    child: MySizedBox(
                      painter: BlueTickPainter(_blueController.view),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: yellowTap,
                    child: MySizedBox(
                      painter: YellowTickPainter(_yellowController.view),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: greenTap,
                    child: MySizedBox(
                      painter: GreenTickPainter(_greenController.view),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: blueTap,
                    child: MySizedBox(
                      painter: BlueTickPainter(_blueController.view),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Slider(
                min: 200,
                max: 2000,
                activeColor: Colors.black54,
                inactiveColor: Colors.black12,
                thumbColor: Colors.black,
                value: _value.toDouble(),
                onChanged: (value) {
                  _yellowController.duration =
                      Duration(milliseconds: value.round());
                  _greenController.duration =
                      Duration(milliseconds: value.round());
                  _blueController.duration =
                      Duration(milliseconds: value.round());
                  _value = value.round();
                  setState(() {});
                },
              ),
              Text(
                '$_value ms',
                style: const TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }

  void yellowTap() {
    // if (_isCompletedY == false) {
    //   _yellowController.forward();
    //   _isCompletedY = true;
    // } else if (_isCompletedY == true) {
    //   _yellowController.reverse();
    //   _isCompletedY = false;
    // }
    switch (_yellowController.status) {
      case AnimationStatus.completed:
        _yellowController.reverse();
        break;
      case AnimationStatus.dismissed:
        _yellowController.forward();
        break;
      default:
    }
  }

  void greenTap() {
    switch (_greenController.status) {
      case AnimationStatus.completed:
        _greenController.reverse();
        break;
      case AnimationStatus.dismissed:
        _greenController.forward();
        break;
      default:
    }
  }

  void blueTap() {
    switch (_blueController.status) {
      case AnimationStatus.completed:
        _blueController.reverse();
        break;
      case AnimationStatus.dismissed:
        _blueController.forward();
        break;
      default:
    }
  }

  @override
  void dispose() {
    _yellowController.dispose();
    _greenController.dispose();
    _blueController.dispose();
    super.dispose();
  }
}

// ignore: must_be_immutable
class MySizedBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var painter;

  MySizedBox({Key? key, required this.painter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: CustomPaint(
        painter: painter,
      ),
    );
  }
}
