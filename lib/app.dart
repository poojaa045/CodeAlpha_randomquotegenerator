import 'package:flutter/material.dart';

void main() {
  runApp(FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flashcard Quiz",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: WelcomeScreen(),
    );
  }
}

class Flashcard {
  String question;
  String answer;
  Flashcard({required this.question, required this.answer});
}

//
// 🌈 Welcome Screen
//
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, size: 100, color: Colors.white),
              SizedBox(height: 20),
              Text(
                "Flashcard Quiz",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => FlashcardScreen()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Start"),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward),
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

//
// 🎴 Flashcard Game Screen with Background
//
class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Flashcard> flashcards = [
    Flashcard(question: "What is Flutter?", answer: "A UI toolkit by Google."),
    Flashcard(question: "Who developed Dart?", answer: "Google."),
    Flashcard(question: "Flutter uses which language?", answer: "Dart."),
  ];

  int currentIndex = 0;
  bool showAnswer = false;

  void nextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % flashcards.length;
      showAnswer = false;
    });
  }

  void prevCard() {
    setState(() {
      currentIndex = (currentIndex - 1 + flashcards.length) % flashcards.length;
      showAnswer = false;
    });
  }

  void addFlashcard(String q, String a) {
    setState(() {
      flashcards.add(Flashcard(question: q, answer: a));
    });
  }

  void editFlashcard(int index, String q, String a) {
    setState(() {
      flashcards[index].question = q;
      flashcards[index].answer = a;
    });
  }

  void deleteFlashcard(int index) {
    setState(() {
      flashcards.removeAt(index);
      if (currentIndex >= flashcards.length) {
        currentIndex = 0;
      }
    });
  }

  void showAddDialog() {
    String question = "";
    String answer = "";
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Add Flashcard"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Question"),
              onChanged: (val) => question = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Answer"),
              onChanged: (val) => answer = val,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (question.isNotEmpty && answer.isNotEmpty) {
                addFlashcard(question, answer);
              }
              Navigator.pop(ctx);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  void showEditDialog(int index) {
    String question = flashcards[index].question;
    String answer = flashcards[index].answer;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Edit Flashcard"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: TextEditingController(text: question),
              decoration: InputDecoration(labelText: "Question"),
              onChanged: (val) => question = val,
            ),
            TextField(
              controller: TextEditingController(text: answer),
              decoration: InputDecoration(labelText: "Answer"),
              onChanged: (val) => answer = val,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              editFlashcard(index, question, answer);
              Navigator.pop(ctx);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (flashcards.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("Flashcards")),
        body: Center(child: Text("No flashcards yet!")),
        floatingActionButton: FloatingActionButton(
          onPressed: showAddDialog,
          child: Icon(Icons.add),
        ),
      );
    }

    Flashcard current = flashcards[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Flashcards", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.edit,color: Colors.white,),
            onPressed: () => showEditDialog(currentIndex),
          ),
          IconButton(
            icon: Icon(Icons.delete,color: Colors.white,),
            onPressed: () => deleteFlashcard(currentIndex),
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app,color: Colors.white,),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => WelcomeScreen()),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [?Colors.deepPurple[100], ?Colors.deepPurple[300]],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 12,
            color: Colors.blueAccent[50],
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(20),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              padding: EdgeInsets.all(10),
              height: 250,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    current.question,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B004B)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  if (showAnswer)
                    Text(
                      current.answer,
                      style: TextStyle(
                          fontSize: 20, color: Colors.green.shade700),
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () => setState(() => showAnswer = !showAnswer),
                    child: Text(showAnswer ? "Hide Answer" : "Show Answer"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        color: Colors.deepPurple.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_back),
              label: Text("Previous"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: prevCard,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_forward),
              label: Text("Next"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: nextCard,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: showAddDialog,
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
