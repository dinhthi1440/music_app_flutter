import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_app/data/provider/app_provider.dart';
import 'package:provider/provider.dart';

class DiskSpin extends StatefulWidget {
  final String image;
  const DiskSpin({super.key, required this.image});
  @override
  _DiskSpinState createState() => _DiskSpinState();
}

class _DiskSpinState extends State<DiskSpin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<AppProvider>().isPause?_controller.stop():_controller.repeat();
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.14159,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade700,
                      offset: Offset.zero,
                      blurRadius: 150.0,
                      spreadRadius: 10.0,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200,
                width: 200,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}