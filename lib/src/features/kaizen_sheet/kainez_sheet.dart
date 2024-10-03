import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';

class KaizenSheetScreen extends StatelessWidget {
  const KaizenSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Table(
                    border: TableBorder
                        .all(), // Adds border around the table and cells
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 30,),
                                  Image.asset(AppImages.heroAppBar, height: 60, width: 130,),
                                  Text("Kaizen Idea Sheet", style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
                                ],
                              )
                          ), // Empty column
                          TableCell(
                            child: Table(
                              border: TableBorder.all(),
                              children: [
                                TableRow(
                                  children: [
                                    Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Date :'),
                                        )), // First column
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text('12 July 2024'),
                                      ),
                                    ), // Second column
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Kaizen No. :'),
                                        )), // First column
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text('HM2G/2024/3452'),
                                      ),
                                    ), // Second column
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Category :'),
                                        )), // First column
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text('A'),
                                      ),
                                    ), // Second column
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Saving Type :'),
                                        )), // First column
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text('One-Time'),
                                      ),
                                    ), // Second column
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Type :'),
                                        )), // First column
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text('Non-Machine'),
                                      ),
                                    ), // Second column
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Plant Name :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Gurgaon Plant'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Pillar Name :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('KK'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Section Name :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Frame Assembly'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Loss No. & Name :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('1 & Break Down Loss'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Cell Name & Cell Number :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('--'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('--'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Productivity Improvement'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Machine Name :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('--'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Kaizen Start Date :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('24 July 2024'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Machine SAP Code :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('--'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Kaizen End Date :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('24 July 2024'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Kaizen Theme :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Productivity'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Kaizen Idea :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Lorem ipsum'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Problem Definition :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet consectetur. A morbi semper cras nec. Nec quis id in augue et.'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Counter Measure :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet consectetur. A morbi semper cras nec. Nec quis id in augue et.'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Container(
                            color: Color(0xFFF8F8F8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Before Image',
                                textAlign: TextAlign.left, // Text alignment
                                style: TextStyle(
                                  fontFamily: 'T-Star Pro', // Font family
                                  fontSize: 18.0, // Font size
                                  fontWeight: FontWeight.w900, // Font weight
                                  height: 1.0, // Line height (18px/18px = 1.0)
                                  color: Color(0xFF7D8B99), // Text color
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Color(0xFFF8F8F8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'After Image',
                                textAlign: TextAlign.left, // Text alignment
                                style: TextStyle(
                                  fontFamily: 'T-Star Pro', // Font family
                                  fontSize: 18.0, // Font size
                                  fontWeight: FontWeight.w900, // Font weight
                                  height: 1.0, // Line height (18px/18px = 1.0)
                                  color: Color(0xFF7D8B99), // Text color
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Color(0xFFF8F8F8),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Kaizen Team Members',
                                textAlign: TextAlign.left, // Text alignment
                                style: TextStyle(
                                  fontFamily: 'T-Star Pro', // Font family
                                  fontSize: 18.0, // Font size
                                  fontWeight: FontWeight.w900, // Font weight
                                  height: 1.0, // Line height (18px/18px = 1.0)
                                  color: Color(0xFF7D8B99), // Text color
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Container(
                            height: 150,
                            color: Color(0xFFF8F8F8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Before Image',
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'After Image',
                              ),
                            ),
                          ),
                          Table(border: TableBorder.all(), children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(''),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('24 July 2024'),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(''),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('24 July 2024'),
                                ),
                              ],
                            )
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Unit Of Measurement'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Nos'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(''),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            color: Color(0xFFF8F8F8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Analysis',
                                textAlign: TextAlign.left, // Text alignment
                                style: TextStyle(
                                  fontFamily: 'T-Star Pro', // Font family
                                  fontSize: 18.0, // Font size
                                  fontWeight: FontWeight.w900, // Font weight
                                  height: 1.0, // Line height (18px/18px = 1.0)
                                  color: Color(0xFF7D8B99), // Text color
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Color(0xFFF8F8F8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Starting Level (Before Kaizen)',
                                textAlign: TextAlign.left, // Text alignment
                                style: TextStyle(
                                  fontFamily: 'T-Star Pro', // Font family
                                  fontSize: 18.0, // Font size
                                  fontWeight: FontWeight.w900, // Font weight
                                  height: 1.0, // Line height (18px/18px = 1.0)
                                  color: Color(0xFF7D8B99), // Text color
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Color(0xFFF8F8F8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Result (After Kaizen)',
                                textAlign: TextAlign.left, // Text alignment
                                style: TextStyle(
                                  fontFamily: 'T-Star Pro', // Font family
                                  fontSize: 18.0, // Font size
                                  fontWeight: FontWeight.w900, // Font weight
                                  height: 1.0, // Line height (18px/18px = 1.0)
                                  color: Color(0xFF7D8B99), // Text color
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Color(0xFFF8F8F8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Annual Benefits (Rs.)',
                                textAlign: TextAlign.left, // Text alignment
                                style: TextStyle(
                                  fontFamily: 'T-Star Pro', // Font family
                                  fontSize: 18.0, // Font size
                                  fontWeight: FontWeight.w900, // Font weight
                                  height: 1.0, // Line height (18px/18px = 1.0)
                                  color: Color(0xFF7D8B99), // Text color
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Lorem ipsum'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Lorem ipsum'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Lorem ipsum'),
                          ),
                          Table(border: TableBorder.all(), children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(''),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('24 July 2024'),
                                ),
                              ],
                            )
                          ]),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Kaizen Theme :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Productivity'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Kaizen Idea :'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Lorem ipsum'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  }
}
