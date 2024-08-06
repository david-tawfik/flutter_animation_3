import 'package:flutter/material.dart';
import 'credentials_text_field.dart';
import 'custom_elevated_button.dart';

class CredentialsBlock extends StatefulWidget {
  const CredentialsBlock({
    super.key,
  });

  @override
  State<CredentialsBlock> createState() => _CredentialsBlockState();
}

class _CredentialsBlockState extends State<CredentialsBlock>
    with TickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _logoAnimation;
  late AnimationController _slideController;
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;
  late Animation<Offset> _firstLogoAnimation;
  bool _isLoaded = false;
  double _opacity = 0.5;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));


    _progressController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.linear,
    ));
    _firstLogoAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    _loadAnimation();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  Future<void> _loadAnimation() async {
    await _progressController.forward();
    setState(() {
      _isLoaded = true;
    });
    _slideController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       SlideTransition(
         position: _logoAnimation,
         child: Stack(
           children: [
             Image.asset('assets/images/splash.png', width: 240,),
             Positioned(
                 top: 25,
                 left: 0,
                 right: 0,
                 bottom: 0,
               child: SlideTransition(
                 position: _firstLogoAnimation,
                 child: AnimatedOpacity(
                   duration: const Duration(seconds: 1),
                   opacity: _opacity,
                   child: Image.asset('assets/images/instock.png',width: 50)),
               )),
           ],
         ),
       ),
       _isLoaded
           ? SlideTransition(
               position: _slideAnimation,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   const CredentialsTextFIeld(
                     hintText: 'Email Address',
                     prefixIcon: Icons.person_3_outlined,
                     obscureText: false,
                   ),
                   const SizedBox(height: 20),
                   const CredentialsTextFIeld(
                     hintText: 'Password',
                     prefixIcon: Icons.key,
                     obscureText: true,
                     suffixIcon: Icons.visibility_off_outlined,
                   ),
                   const SizedBox(height: 20),
                   CustomElevatedButton(
                     foregroundColor: Colors.white,
                     backgroundColor: Colors.purple.shade900,
                     borderColor: Colors.purple.shade900,
                     text: 'Login',
                   ),
                   const SizedBox(height: 20),
                   const Text(
                     'Forgot Password?',
                     style: TextStyle(
                       color: Colors.pink,
                       fontSize: 14,
                       decoration: TextDecoration.underline,
                     ),
                   ),
                   const SizedBox(height: 70),
                   Text(
                     'You don\'t have an account?',
                     style: TextStyle(
                       color: Colors.grey.shade800,
                       fontSize: 13,
                     ),
                   ),
                   const SizedBox(height: 20),
                   const CustomElevatedButton(
                       foregroundColor: Colors.pink,
                       backgroundColor: Colors.white,
                       borderColor: Colors.pink,
                       text: 'Create new account'),
                   const SizedBox(height: 50),
                 ],
               ),
             )
           : AnimatedBuilder(
               animation: _progressAnimation,
               builder: (context, child) {
                 return SizedBox(
                  width:200,
                   child: LinearProgressIndicator(
                     value: _progressAnimation.value,
                     backgroundColor: Colors.grey[300],
                     valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
                   ),
                 );
               },
             )
     ],
          );
  }
}
