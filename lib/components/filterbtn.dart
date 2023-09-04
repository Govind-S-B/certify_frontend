import 'package:certify_frontend/app_theme.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (overlayEntry != null) {
          overlayEntry!.remove();
          overlayEntry = null;
        } else {
          final RenderBox button = context.findRenderObject() as RenderBox;
          final RenderBox overlay =
              Overlay.of(context).context.findRenderObject() as RenderBox;
          final RelativeRect position = RelativeRect.fromRect(
            Rect.fromPoints(
              button.localToGlobal(Offset.zero, ancestor: overlay),
              button.localToGlobal(button.size.bottomRight(Offset.zero),
                  ancestor: overlay),
            ),
            Offset.zero & overlay.size,
          );
          overlayEntry = _createOverlayEntry(position);
          Overlay.of(context).insert(overlayEntry!);
        }
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppTheme.pBlack,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          Icons.filter_alt,
          color: Colors.white,
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry(RelativeRect position) {
    return OverlayEntry(
      builder: (context) {
        final width = 200.0;
        final height = 150.0;
        return GestureDetector(
          onTap: () {
            overlayEntry!.remove();
            overlayEntry = null;
          },
          child: Stack(
            children: [
              Positioned(
                top: position.top,
                left: position.left,
                width: width,
                height: height,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppTheme.pBlack,
                    ),
                    child: Center(
                      child: Text("Filter Options"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
