import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Calculator(title: 'Calculator'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});
  final String title;
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String equation = "";
  String history ="";
  String result = "";

  // ignore: non_constant_identifier_names
  Widget CalcButton(String txt,Color btncolor,Widget content,Function? a()){
    return  ElevatedButton(
      onPressed: (){
        setState(() {
          a();
        });
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(82, 82),
        backgroundColor: btncolor,
        elevation: 0 ,
        //shape: CircleBorder(),
      ),
      child: content
    );
  }

  Widget ButtonText(String text, Color textColor)
  {
    return Text(
      text,
      style: TextStyle(fontSize: 32,
        color: textColor,
        fontWeight: FontWeight.w500,
        fontFamily: 'SF Pro Text',
      ),
    );
  }

  bool lastIsOperator()
  {
    RegExp exp = RegExp(r"[/*+-]");
    Iterable<Match> matches = exp.allMatches(equation[equation.length-1].toString());
    return matches.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f8f8),

        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Calculator',
          style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(0xff252c32)
          ),
        ),

      ),

      body:
      Column(

        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                SizedBox(
                  width: 352,
                  child: Text( history,
                    style: const TextStyle(
                      color: Color(0xffa9a7a7),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  height: 8,

                ),
                SizedBox(
                  width: 352,
                  child: Text(
                    equation ,
                    style: const TextStyle(
                        color: Color(0xFF252C32),
                        fontWeight: FontWeight.w500,
                        fontSize: 44,
                        fontFamily: 'SF Pro Text'
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 2,
            width: 358,
            child: Divider(
              height: 0,
              thickness: 2,
              color: Color(0xffEEF0F2),
            ),
          ),

          SizedBox(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CalcButton('C', const Color(0xFFF8F8F8), ButtonText('C', Color(0xFFFF887D)),(){equation=history="";})
                ),

                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 82,
                    width: 82,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CalcButton('r', const Color(0xfff8f8f8),Image.asset('assets/images/backspace.png'),(){equation=equation.substring(0,equation.length-1);}),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CalcButton('/', const Color(0xfff8f8f8),Image.asset('assets/images/division.png'),(){
                    if(lastIsOperator()){
                      equation=equation.substring(0,equation.length-1)+'/';
                    }
                    else{
                      equation+='/';
                    }
                  }),
                ),
              ],
            ),
          ),

          Column(
            children: [
              SizedBox(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('7', const Color(0xfff8f8f8),ButtonText('7', const Color(0xffa9a7a7)),(){equation+='7';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('8', const Color(0xfff8f8f8),ButtonText('8', const Color(0xffa9a7a7)),(){equation+='8';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('9', const Color(0xfff8f8f8),ButtonText('9', const Color(0xffa9a7a7)),(){equation+='9';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                        child: CalcButton('*', const Color(0xfff8f8f8),Image.asset("assets/images/times.png"),(){
                          if(lastIsOperator()){
                            equation=equation.substring(0,equation.length-1)+'*';
                          }
                          else{
                            equation+='*';
                          }
                        }),
                    ),

                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('4', const Color(0xfff8f8f8),ButtonText('4', const Color(0xffa9a7a7)),(){equation+='4';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                        child: CalcButton('5', const Color(0xfff8f8f8),ButtonText('5', const Color(0xffa9a7a7)),(){equation+='5';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                        child: CalcButton('6', const Color(0xfff8f8f8),ButtonText('6', const Color(0xffa9a7a7)),(){equation+='6';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                        child: CalcButton('-', const Color(0xfff8f8f8),ButtonText('-', const Color(0xff11998E)),(){
                          if(lastIsOperator()){
                            equation=equation.substring(0,equation.length-1)+'-';
                          }
                          else{
                            equation+='-';
                          }
                        }),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('1', const Color(0xfff8f8f8),ButtonText('1', const Color(0xffa9a7a7)),(){equation+='1';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('2', const Color(0xfff8f8f8),ButtonText('2', const Color(0xffa9a7a7)),(){equation+='2';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('3', const Color(0xfff8f8f8),ButtonText('3', const Color(0xffa9a7a7)),(){equation+='3';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                        child: CalcButton('+', const Color(0xfff8f8f8),ButtonText('+', const Color(0xff11998E)),(){
                          if(lastIsOperator()){
                            equation=equation.substring(0,equation.length-1)+'+';
                          }
                          else{
                            equation+='+';
                          }
                        }),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 82,
                        width: 82,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('0', const Color(0xfff8f8f8),ButtonText('0', const Color(0xffa9a7a7)),(){equation+='0';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('.', const Color(0xfff8f8f8),ButtonText('.', const Color(0xffa9a7a7)),(){equation+='.';}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CalcButton('=', const Color(0xff11998E),ButtonText('=', const Color(0xFFEEF0F2)),(){
                        try{
                          Parser p = Parser();
                          Expression exp = p.parse(equation);

                          ContextModel cm = ContextModel();
                          history=equation;
                          equation = '${exp.evaluate(EvaluationType.REAL, cm)}';
                        }
                        catch(e){
                          equation = "Error";
                        }
                      }),
                    ),


                  ],
                ),
              )
            ],
          ),
        ],
      ),

    );
  }



}


