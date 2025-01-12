import 'package:flutter/material.dart';
import '../theme.dart';

class PointPanduan extends StatefulWidget {
  final String title;
  final String nomor;
  final Icon icon;
  final Widget nextpage;

  const PointPanduan({
    required this.title,
    required this.nomor,
    required this.nextpage,
    required this.icon,
    super.key,
    required int index,
  });

  @override
  State<PointPanduan> createState() => _PointPanduanState();
}

class _PointPanduanState extends State<PointPanduan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Material(
        color: Colors.transparent,
        child: InkResponse(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.nextpage),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: bg_blue2,
              borderRadius: BorderRadius.circular(15),
            ),
            // TEXT
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),

              leading: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: bg_orange2),
                child: Text(
                  widget.nomor,
                  style: regular.copyWith(
                      color: black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              title: Text(
                widget.title,
                style:
                    regular.copyWith(color: black, fontWeight: FontWeight.bold),
              ),
              // ICON
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
