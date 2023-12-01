import 'package:bmi/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController heightInCm = TextEditingController();
  TextEditingController heightInFeet = TextEditingController();
  TextEditingController heightInInch = TextEditingController();
  TextEditingController weight = TextEditingController();

  String weightUnit = 'Kg';
  String heightUnit = 'Cm';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI calculator'),
          centerTitle: true,
        ),
        body: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
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
                                        onTap: () {
                                          context
                                              .read<BoxAnimatorProvider>()
                                              .buttonFalseMaker();
                                        },
                                        controller: heightInCm,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            label: Text('Cm'),
                                            border: OutlineInputBorder()),
                                      ),
                                    )
                                  : Container(
                                      width: 200,
                                      child: Row(
                                        children: [
                                          Flexible(
                                              child: TextField(
                                            onTap: () {
                                              context
                                                  .read<BoxAnimatorProvider>()
                                                  .buttonFalseMaker();
                                            },
                                            controller: heightInFeet,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                label: Text('Feet'),
                                                border: OutlineInputBorder()),
                                          )),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Flexible(
                                              child: TextField(
                                            onTap: () {
                                              context
                                                  .read<BoxAnimatorProvider>()
                                                  .buttonFalseMaker();
                                            },
                                            controller: heightInInch,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                label: Text('Inch'),
                                                border: OutlineInputBorder()),
                                          )),
                                        ],
                                      ),
                                    )),
                        ),
                      ),
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
                        onTap: () {
                          context
                              .read<BoxAnimatorProvider>()
                              .buttonFalseMaker();
                        },
                        onChanged: (newHeightUnit) {
                          context
                              .read<UnitChangerProvider>()
                              .changeHeightUnit(newHeightUnit.toString());
                          heightUnit = newHeightUnit!;
                          heightInCm.clear();
                          heightInFeet.clear();
                          heightInInch.clear();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 8),
                        child: Text('Weight:'),
                      ),
                    ],
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
                              onTap: () {
                                context
                                    .read<BoxAnimatorProvider>()
                                    .buttonFalseMaker();
                              },
                              controller: weight,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  label: Text(weightUnit),
                                  border: OutlineInputBorder()),
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
                        onTap: () {
                          context
                              .read<BoxAnimatorProvider>()
                              .buttonFalseMaker();
                        },
                        onChanged: (newWeightUnit) {
                          context
                              .read<UnitChangerProvider>()
                              .changeWeighttUnit(newWeightUnit.toString());
                          weightUnit = newWeightUnit!;
                          weight.clear();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 600),
            child: Text('Height:'),
            left: heightUnit == 'Cm' ? 78 : 52,
            top: 28,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 600),
            top: context.watch<BoxAnimatorProvider>().isButtonClicked
                ? 380
                : 278,
            width:
                context.watch<BoxAnimatorProvider>().isButtonClicked ? 150 : 1,
            height:
                context.watch<BoxAnimatorProvider>().isButtonClicked ? 50 : 1,
            left: context.watch<BoxAnimatorProvider>().isButtonClicked
                ? (MediaQuery.of(context).size.width * 0.5) - 75
                : (MediaQuery.of(context).size.width * 0.5),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                    color: context.watch<ResultProvider>().bmiColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 600),
                    style: TextStyle(
                      fontSize:
                          context.watch<BoxAnimatorProvider>().isButtonClicked
                              ? 22
                              : 0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    child: Text(
                      context.watch<ResultProvider>().resultBmi,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 270,
            width: 100,
            left: (MediaQuery.of(context).size.width * 0.5) - 50,
            child: ElevatedButton(
                onPressed: () {
                  if (heightInCm.text.isNotEmpty && heightUnit == 'Cm') {
                    context
                        .read<ResultProvider>()
                        .heightUpdater(double.parse(heightInCm.text) / 100);
                  }
                  if (heightUnit == 'Inch' &&
                      heightInInch.text.isNotEmpty &&
                      heightInFeet.text.isNotEmpty) {
                    context.read<ResultProvider>().heightUpdater(
                        ((double.parse(heightInFeet.text) * 12) +
                                (double.parse(heightInInch.text))) *
                            0.0254);
                  }
                  if (weightUnit == 'Kg' && weight.text.isNotEmpty) {
                    context
                        .read<ResultProvider>()
                        .weightUpdater(double.parse(weight.text));
                  }
                  if (weightUnit == 'Lbs' && weight.text.isNotEmpty) {
                    context
                        .read<ResultProvider>()
                        .weightUpdater(double.parse(weight.text) * 0.453592);
                  }

                  context.read<ResultProvider>().formula();
                  context.read<BoxAnimatorProvider>().buttonTrueMaker();
                },
                child: Text('Calculate')),
          ),
        ]),
      ),
    );
  }
}
