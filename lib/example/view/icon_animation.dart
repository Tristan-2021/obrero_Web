import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const movent = 50.0;
const resttIcon = 5.0;

class CustomContainer extends StatefulWidget {
  final String url, redScoial;
  final IconData name;
  final Color color;
  const CustomContainer(
      {required Key key,
      required this.redScoial,
      required this.name,
      required this.color,
      required this.url})
      : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation itemIcon;
  late Animation itemIconOut;
  bool _colorBolano = false;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2200));

    itemIcon =
        CurveTween(curve: const Interval(0.1, 0.6, curve: Curves.elasticOut))
            .animate(_controller);

    itemIconOut =
        CurveTween(curve: const Interval(0.6, 1.0, curve: Curves.decelerate))
            .animate(_controller);

    super.initState();
  }

  void _launchURL() async => await canLaunch(widget.url)
      ? await launch(widget.url)
      : throw 'Could not launch $widget.url';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wtihSize = MediaQuery.of(context).size.height;
    const wtihSize1 = 75.0;
    const sizeIcon = 34.0;

    double currentHeig = wtihSize1;
    double currentsizeIcon = sizeIcon;
    return MouseRegion(
      onEnter: (value) {
        _controller.forward(from: 0.0);
        setState(() {
          _colorBolano = true;
        });
      },
      onExit: (value) {
        setState(() {
          _colorBolano = false;
        });
      },
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            currentHeig = wtihSize1 - (movent * itemIcon.value);
            currentsizeIcon = sizeIcon +
                (resttIcon * itemIconOut.value) -
                (resttIcon * itemIcon.value);

            return SizedBox(
              width: 75.0,
              height: 75,
              child: IconButton(
                visualDensity: VisualDensity.comfortable,
                tooltip: widget.redScoial,
                //Alignment(-1.0, -0.5) centerleft
                alignment: _colorBolano
                    ? const Alignment(-1.0, -0.5)
                    : Alignment.center,
                onPressed: _launchURL,
                icon: FaIcon(
                  widget.name,
                  color: _colorBolano ? widget.color : Colors.black,
                ),
                iconSize: currentsizeIcon,
              ),
            );
          }),
    );
  }
}
