import 'package:certify_frontend/app_theme.dart';
import 'package:certify_frontend/components/button.dart';
import 'package:certify_frontend/components/dash.dart';
import 'package:certify_frontend/components/filterbtn.dart';
import 'package:certify_frontend/components/not_finalized.dart';
import 'package:flutter/material.dart';

class EventTile extends StatefulWidget {
  final String id;
  final String name;
  final String? issueDt;

  const EventTile({
    required this.id,
    required this.name,
    this.issueDt,
    Key? key,
  }) : super(key: key);

  @override
  _EventTileState createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  Color containerColor = AppTheme.grey2;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          containerColor = AppTheme.grey4;
        });
      },
      onExit: (_) {
        setState(() {
          containerColor = AppTheme.grey2;
        });
      },
      child: GestureDetector(
        onTap: () {
          print("tapped");
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: containerColor,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.id,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.body().copyWith(
                      color: AppTheme.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.name,
                    style: TextStyles.body().copyWith(
                      color: AppTheme.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.issueDt == null
                        ? NotFinalizedWidget()
                        : Text(
                            widget.issueDt.toString(),
                            style: TextStyles.body().copyWith(
                              color: AppTheme.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventsPane extends StatelessWidget {
  const EventsPane({super.key});

  @override
  Widget build(BuildContext context) {
    var temp_list = [
      {
        "_id": "64f1f062b2ec1ad97d69486f",
        "name": "Event 1",
        "issueDt": "18-08-2022"
      },
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {
        "_id": "64f1f062b2ec1ad97d69486f",
        "name": "Event 1",
        "issueDt": "27-11-2022"
      },
      {
        "_id": "64f1f062b2ec1ad97d69486f",
        "name": "Event 1",
        "issueDt": "18-08-2022"
      },
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {
        "_id": "64f1f062b2ec1ad97d69486f",
        "name": "Event 1",
        "issueDt": "27-11-2022"
      },
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {
        "_id": "64f1f062b2ec1ad97d69486f",
        "name": "Event 1",
        "issueDt": "27-11-2022"
      },
      {
        "_id": "64f1f062b2ec1ad97d69486f",
        "name": "Event 1",
        "issueDt": "18-08-2022"
      },
    ];

    return Column(
      children: [
        Row(
          children: [
            Text("Events",
                style: TextStyles.h1().copyWith(
                    color: AppTheme.white, fontWeight: FontWeight.w600)),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    AppTheme.green, // Set the background color to light green
              ),
              child: Text(
                'Register',
                style: TextStyles.body().copyWith(
                    color: AppTheme.darkGreen,
                    fontWeight:
                        FontWeight.w600 // Set the text color to dark green
                    ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: AppTheme.grey1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                // search and filter row
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        height: 30,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Search',
                            filled: true,
                            fillColor: AppTheme.pBlack,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            labelStyle: TextStyles.body().copyWith(
                                color: AppTheme.grey4,
                                fontWeight: FontWeight.w600),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                      ),
                    ),
                    FilterButton(),
                  ],
                ),
                // Id name issue date headers . Sized Box with set of expand widgets in row
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: Text("Id",
                            style: TextStyles.body().copyWith(
                                color: AppTheme.white,
                                fontWeight: FontWeight.w500))),
                    Expanded(
                      flex: 5,
                      child: Text("Name",
                          style: TextStyles.body().copyWith(
                              color: AppTheme.white,
                              fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text("Issue Date",
                            style: TextStyles.body().copyWith(
                                color: AppTheme.white,
                                fontWeight: FontWeight.w500))),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MySeparator(color: AppTheme.grey4),
                ),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: EventTile(
                              id: temp_list[index]["_id"]!,
                              name: temp_list[index]["name"]!,
                              issueDt: temp_list[index]["issueDt"],
                            ),
                          );
                        })),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: CustomIconButton(
                            iconData: Icons.keyboard_double_arrow_left_rounded,
                            onPressed: () {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: CustomIconButton(
                            iconData: Icons.keyboard_arrow_left_rounded,
                            onPressed: () {}),
                      ),
                      SizedBox(
                        height: 35,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppTheme.pBlack),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.zero), // Remove default padding
                              ),
                              onPressed: () {},
                              child: Text(
                                "1/10",
                                style: TextStyles.body().copyWith(
                                    color: AppTheme.white,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: CustomIconButton(
                            iconData: Icons.keyboard_arrow_right_rounded,
                            onPressed: () {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CustomIconButton(
                            iconData: Icons.keyboard_double_arrow_right_rounded,
                            onPressed: () {}),
                      ),
                    ],
                  ),
                )
                // list of events from json response to be rendered
              ]),
            ),
          ),
        ),
      ],
    );
  }
}