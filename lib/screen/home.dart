import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialstep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Stepper App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Stepper(
            currentStep: initialstep,
            onStepTapped: (value) {
              setState(() {
                initialstep = value;
              });
            },
            onStepContinue: () {
              setState(() {
                if (initialstep < 2) initialstep++;
              });
            },
            onStepCancel: () {
              setState(() {
                if (initialstep > 0) initialstep--;
              });
            },
            steps: [
              Step(
                isActive: (initialstep >= 0) ? true : false,
                title: const Text("Sing up"),
                content: Column(
                  children: const [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        icon: Icon(Icons.person_outline),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Email id",
                        icon: Icon(Icons.email_outlined),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Password *",
                        icon: Icon(Icons.lock),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        icon: Icon(Icons.lock),
                      ),
                    ),
                  ],
                ),
              ),
              Step(
                isActive: (initialstep >= 2) ? true : false,
                title: const Text("Login"),
                content: Column(
                  children: const [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "User Name*",
                        icon: Icon(Icons.person),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Password*",
                        icon: Icon(Icons.email_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text("Home"),
                content: Container(),
                state: StepState.complete,
                subtitle: const Text(""),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
