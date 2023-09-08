import 'package:certify_frontend/app_theme.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final eventpanestate;

  const FilterButton(this.eventpanestate, {Key? key}) : super(key: key);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  OverlayEntry? overlayEntry;

  bool not_finalized_filter = true;

  @override
  void initState() {
    not_finalized_filter =
        widget.eventpanestate.queryparams.containsKey("not_finalized");
    super.initState();
  }

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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                "Filters",
                                style: TextStyles.body().copyWith(
                                    color: AppTheme.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero),
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all(AppTheme.red),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Clear",
                                    style: TextStyles.body().copyWith(
                                        color: AppTheme.darkRed,
                                        fontWeight: FontWeight.w600),
                                  ))
                            ]),
                            SizedBox(height: 10),
                            // FILTERS
                            ElevatedButton(
                              style: ButtonStyle(
                                  visualDensity: VisualDensity(
                                    horizontal: -4,
                                    vertical: -4,
                                  ),
                                  backgroundColor: not_finalized_filter
                                      ? MaterialStateProperty.all(
                                          AppTheme.white)
                                      : MaterialStateProperty.all(
                                          AppTheme.grey1)),
                              child: Text(
                                "Not Finalized",
                                style: TextStyles.body().copyWith(
                                    color: not_finalized_filter
                                        ? AppTheme.pBlack
                                        : AppTheme.grey4,
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: () {
                                // needs to be passed parameter state variable with listen as false

                                widget.eventpanestate
                                    .notFinalizedFilterModify(context);

                                setState(() {});
                                not_finalized_filter = !not_finalized_filter;
                              },
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
