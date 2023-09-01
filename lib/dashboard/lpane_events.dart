import 'package:certify_frontend/app_theme.dart';
import 'package:certify_frontend/components/dash.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(children: [
          Expanded(flex: 1, child: Text(id)),
          Expanded(
            flex: 5,
            child: Text(name),
          ),
          Expanded(
            flex: 1,
            child: Text(issueDt.toString()),
          ),
        ]),
      ),
    );
  }
}

class EventsPane extends StatelessWidget {
  const EventsPane({super.key});

  @override
  Widget build(BuildContext context) {
    var temp_list = [
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
      {"_id": "64f1f062b2ec1ad97d69486f", "name": "Event 1", "issueDt": null},
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
                // Id name issue date headers . Sized Box with set of expand widgets in row
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(children: [
                    Expanded(flex: 1, child: Text("Id")),
                    Expanded(
                      flex: 5,
                      child: Text("Name"),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("Issue Date"),
                    ),
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
                          return EventTile(
                            id: temp_list[index]["_id"]!,
                            name: temp_list[index]["name"]!,
                            issueDt: temp_list[index]["issueDt"],
                          );
                        })),
                // list of events from json response to be rendered
              ]),
            ),
          ),
        )
      ],
    );
  }
}
