import 'package:flutter/material.dart';
import '../theme.dart';

class PointAudio extends StatefulWidget {
  final String title;
  final Widget nextpage;
  final Icon icon;

  const PointAudio({
    required this.title,
    required this.icon,
    required this.nextpage,
    super.key,
    required int index,
  });

  @override
  State<PointAudio> createState() => _PointAudioState();
}

class _PointAudioState extends State<PointAudio> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Material(
        color: Colors.transparent,
        child: InkResponse(
          //LIST
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: bg_blue2,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              title: Text(
                widget.title,
                style: regular.copyWith(
                    color: ft_orange, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: widget.icon,
                color: bg_orange,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widget.nextpage),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
