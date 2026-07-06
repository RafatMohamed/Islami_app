import 'package:flutter/material.dart';
import '../../../core/resources_app.dart';
import '../../../generated/assets.dart';
import '../../home/view/home_app_view.dart';

class BodySplashView extends StatefulWidget {
  const BodySplashView({super.key});

  @override
  State<BodySplashView> createState() => _BodySplashViewState();
}

class _BodySplashViewState extends State<BodySplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _brandingAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scaleAnimation = Tween<double>(
      begin: .7,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _brandingAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _rotationAnimation = Tween<double>(
      begin: -.05,
      end: .05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);

    goToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.images.pngImages.background.path,
          fit: BoxFit.fill,
          width: size.width,
          height: size.height,
        ),

        AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (_, child) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: Image.asset(
                      Assets.images.pngImages.glow2.path,
                      height: size.height * .3,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * .2,
                  left: 0,
                  child: Transform.translate(
                    offset: Offset(0, _rotationAnimation.value * 40),
                    child: Image.asset(
                      Assets.images.pngImages.shape07.path,
                      height: size.height * .2,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * .7,
                  right: 0,
                  child: Transform.translate(
                    offset: Offset(0, -_rotationAnimation.value * 40),
                    child: Image.asset(
                      Assets.images.pngImages.shape04.path,
                      height: size.height * .2,
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.images.pngImages.splashImage.path,
                  width: size.width * .5,
                ),
                const SizedBox(height: 16),
                const Text("Islami", style: AppTextStyle.textSplashStyle),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 20,
          child: SlideTransition(
            position: _brandingAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                Assets.images.pngImages.splashBranding.path,
                width: size.width * .7,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> goToHome() async {
    return await Future.delayed(const Duration(seconds: 5), () async {
      if (!mounted) return;
      await Navigator.pushReplacementNamed(context, HomeAppView.routeName);
    });
  }
}
