import 'package:flutter/material.dart';
class SkipButton extends StatefulWidget {
  const SkipButton({super.key});

  @override
  State<SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
        Future.delayed(const Duration(seconds: 2), () {
      setState(() {
    _controller.forward();
      });
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: InkWell(
        onTap: () {},
        child: const Row(
          children: [
            Text('Skip'),
            Icon(Icons.arrow_forward, color: Colors.pink,size: 15,),
          ],
        ),
      ),
      
      );
  }
}