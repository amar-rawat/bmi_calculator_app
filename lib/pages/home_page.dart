import 'package:bmi/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController heightInCm = TextEditingController();
  TextEditingController heightInFeet = TextEditingController();
  TextEditingController heightInInch = TextEditingController();

  TextEditingController weightInKg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: Container(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: context
                                        .watch<UnitChangerProvider>()
                                        .isOneBox
                                    ? Container(
                                        width: 120,
                                        child: TextField(
                                          controller: heightInCm,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder()),
                                        ),
                                      )
                                    : Container(
                                        width: 200,
                                        child: Row(
                                          children: [
                                            Flexible(
                                                child: TextField(
                                              controller: heightInFeet,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder()),
                                            )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Feet',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            Flexible(
                                                child: TextField(
                                              controller: heightInInch,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder()),
                                            )),
                                          ],
                                        ))))),
                    DropdownButton(
                        value:
                            context.watch<UnitChangerProvider>().mainHeightUnit,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'Cm',
                            ),
                            value: 'Cm',
                          ),
                          DropdownMenuItem(
                            child: Text('Inch'),
                            value: 'Inch',
                          )
                        ],
                        onChanged: (newUnit) {
                          context
                              .read<UnitChangerProvider>()
                              .changeHeightUnit(newUnit.toString());
                        }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: 120,
                          child: TextField(
                            controller: weightInKg,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value:
                          context.watch<UnitChangerProvider>().mainWeightUnit,
                      items: [
                        DropdownMenuItem(
                          child: Text('Kg'),
                          value: 'Kg',
                        ),
                        DropdownMenuItem(
                          child: Text('Lbs'),
                          value: 'Lbs',
                        )
                      ],
                      onChanged: (newWeightUnit) {
                        context
                            .read<UnitChangerProvider>()
                            .changeWeighttUnit(newWeightUnit.toString());
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Calculate'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
