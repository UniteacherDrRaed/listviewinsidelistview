import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int x = 0;
  int y=0;
  String u="0000";
  TextEditingController guestnumber = TextEditingController();
  List<AuxilaryResult> axuxilaryList=[];
@override
  void initState() {
    // TODO: implement initState
  guestnumber.text="0000";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("لعبة احذر العدد"),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: Icon(Icons.numbers),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        color: Colors.red.shade50,
        child: ListView(
          children: [
            OutlinedButton.icon(
                onPressed: () {
                  axuxilaryList.clear();

                  x=Random().nextInt(9999);
                  while(x<1000){
                    x=Random().nextInt(9999);

                  }
                  print(x);
                  setState(() {

                  });
                },
                icon: const Icon(Icons.generating_tokens),
                label: const Text("عدد جديد")),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              maxLength: 4,
              controller: guestnumber,
              decoration: InputDecoration(
                  hintText: "ادخل عددا من اربعة ارقام",
                  hintStyle: TextStyle(color: Colors.red, fontSize: 24),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(24)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(24)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(24)),
            ),
            ),
            ElevatedButton(onPressed: ()
                {

               setState(() {
                 y=int.parse(guestnumber.text);
               });
              if(y>=1000 && y<=9999) {
                if (x == y) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("correct number"))
                  );
                }
                else {

                  u=checkTwoNumbers(x, y);
                      axuxilaryList.add(AuxilaryResult(numberchoose: y, currentresult: u));
                 setState(() {
                   guestnumber.text="0000";
                 });
                }

              }
            }, child:const Text("التحقق من العدد")),

            ListView.builder(
              shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: axuxilaryList.length,
                itemBuilder: (context,index){

                  return ListTile(
                    leading: Text("${axuxilaryList[index].numberchoose}"),
                    title: Text("${axuxilaryList[index].currentresult}"),
                  );
                })
          ],
        ),
      ),
    );
  }
 String checkTwoNumbers(int a, int b){
    String result="";
     String astring="$a";
     String bstring="$b";
     print(astring.length);
     for(int i=0;i<astring.length;i++){
       if(astring[i]==bstring[i])
         result+="*";
     }
    for(int i=0;i<4;i++)
    {
      for(int k=0;k<4;k++)
      {
        if(i!=k && astring[i]==bstring[k])
        {
          result+="+";
          break;

        }
      }
    }

    return result;
 }
}

class AuxilaryResult{
  final int numberchoose;
  final String currentresult;
  AuxilaryResult({required this.numberchoose,required this.currentresult});
}