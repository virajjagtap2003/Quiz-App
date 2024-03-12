import 'package:flutter/material.dart';
void main(){
  runApp (const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});
  @override
  Widget build(BuildContext context){
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlutterApp",
      home: Quiz(),
    );
  }
}
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State createState()=>_QuizApp();
}
class _QuizApp extends State{


List<Map> allQuestions=[
  {
      "Question": "Who is the founder of Microsoft?",
      "Options": ["Steve jobs","Jeff Bezos", "Bill gates","Elon musk"],
      "AnswerIndex":2,
  },
  {
      "Question": "Who is the founder of Apple?",
      "Options": ["Steve jobs","Jeff Bezos", "Bill gates","Elon musk"],
      "AnswerIndex":0,
  },
  {
      "Question": "Who is the founder of Amazon?",
      "Options": ["Steve jobs","Jeff Bezos", "Bill gates","Elon musk"],
      "AnswerIndex":1,
  },
  {
      "Question": "Who is the founder of Tesla?",
      "Options": ["Steve jobs","Jeff Bezos", "Bill gates","Elon musk"],
      "AnswerIndex":3,
  },{
      "Question": "Who is the founder of Google?",
      "Options": ["Steve jobs","Larry page", "Bill gates","Elon musk"],
      "AnswerIndex":1,
  }
  ];
bool questionScreen=true;
int questionIndex=0;
int selectedAnswerIndex=-1;
int noOfCorrectAnswers=0;

MaterialStateProperty<Color?> checkAnswer(int buttonIndex){
  if(selectedAnswerIndex!=-1){
    if(buttonIndex==allQuestions[questionIndex]["AnswerIndex"]){
      return const MaterialStatePropertyAll(Colors.green);
    }else if(buttonIndex== selectedAnswerIndex){
      return const MaterialStatePropertyAll(Colors.red);
    }else{
      return const MaterialStatePropertyAll(null);
    }
  }
  else{
    return const MaterialStatePropertyAll(null);
  }
}

void validateCurrentPage(){
  if(selectedAnswerIndex==-1){
    return;
  }
  if(selectedAnswerIndex==allQuestions[questionIndex]["AnswerIndex"]){
    noOfCorrectAnswers += 1;
  }
  if(selectedAnswerIndex!=-1){
    if(questionIndex==allQuestions.length-1){
      setState(() {
        questionScreen=false;
      });
    }
    selectedAnswerIndex=-1;
    setState(() {
      questionIndex+=1;
    });
  }
}

Scaffold isQuestionScreen(){
  if(questionScreen==true){
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quiz App",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
         
        ),
        ),
         backgroundColor: Colors.deepPurple,
      ),

      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Question:",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
              ),
              ),
              Text("${questionIndex+1}/${allQuestions.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),

          
            ],
          ),
            const SizedBox(
                height: 30,
              ),

              SizedBox(
                width: 380,
                height: 50,
                child: Text(
                  allQuestions[questionIndex]["Question"],
                  style: const  TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                ),
              ),
             

              const SizedBox(
                height: 30,
              ),
              ElevatedButton( 
            
              style: ButtonStyle(backgroundColor: checkAnswer(0)),
              onPressed: (){
                if(selectedAnswerIndex==-1){
                  setState(() {
                    selectedAnswerIndex=0;
                  });
                }
              },
              child: Text(
                "A.${allQuestions[questionIndex]["Options"][0]}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
    
              
              ),
              const SizedBox(
                height: 30,
              ),
               ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(1)),
              onPressed: (){
                if(selectedAnswerIndex==-1){
                  setState(() {
                    selectedAnswerIndex=1;
                  });
                }
              },
                
              child: Text(
                "B.${allQuestions[questionIndex]["Options"][1]}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),),
              const SizedBox(
                height: 30,
              ),
               ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(2)),
              onPressed: (){
                if(selectedAnswerIndex==-1){
                  setState(() {
                    selectedAnswerIndex=2;
                  });
                }
              },
              child: Text(
                "C.${allQuestions[questionIndex]["Options"][2]}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),),
              const SizedBox(
                height: 30,
              ),
               ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(3)),
              onPressed: (){
                if(selectedAnswerIndex==-1){
                  setState(() {
                    selectedAnswerIndex=3;
                  });
                }
              },
              child: Text(
                "D.${allQuestions[questionIndex]["Options"][3]}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),),
        ],
      ),

     floatingActionButton: FloatingActionButton(
      onPressed: (){
        validateCurrentPage();
      },
      backgroundColor: Colors.white,
      child:const Icon(
        Icons.forward,
        color: Colors.red,
      ),),
    );
  
  }else{
    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text("Quiz App",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        )
        

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),

          Image.network("https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",
          height: 300,
          width: 300,),
          const SizedBox(
            height: 25,
          ),
          
          
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Congratulations!!!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("YOU HAVE COMPLETED THE QUIZ",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
          ),
          const SizedBox(height: 15,),
          Text("$noOfCorrectAnswers/${allQuestions.length}",
          style: const TextStyle(fontSize: 20,
          fontWeight: FontWeight.w500),),

          ElevatedButton(
            
            onPressed: (){
              questionIndex=0;
              questionScreen=true;
              noOfCorrectAnswers=0;
              selectedAnswerIndex=-1;

              setState(() {
              });
            }, child:
              const Text("RESET",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),)
            )
        ],
      ),
    );
  }
}
  
Widget build(BuildContext context){
  return isQuestionScreen();
}
}