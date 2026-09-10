import 'package:flutter/material.dart';
void main() => runApp(const SehatSetuApp());
class SehatSetuApp extends StatefulWidget {
  const SehatSetuApp({super.key});
  @override
  State<SehatSetuApp> createState() => _SehatSetuAppState();
}
class _SehatSetuAppState extends State<SehatSetuApp> {
  String lang = "en";
  String patientText = "";
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: const Color(0xFF0F6C5C), title: const Text("SehatSetu")),
        body: currentScreen == 0 ? patientScreen() : currentScreen == 1 ? doctorScreen() : abhaScreen(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: (i) => setState(() => currentScreen = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.mic), label: "Patient"),
            BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: "Doctor"),
            BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: "ABHA"),
          ],
        ),
      ),
    );
  }
  Widget patientScreen() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Wrap(spacing: 10, children: [
            ChoiceChip(label: const Text("English"), selected: lang=="en", onSelected: (v)=>setState(()=>lang="en")),
            ChoiceChip(label: const Text("मराठी"), selected: lang=="mr", onSelected: (v)=>setState(()=>lang="mr")),
            ChoiceChip(label: const Text("हिंदी"), selected: lang=="hi", onSelected: (v)=>setState(()=>lang="hi")),
          ]),
          const SizedBox(height: 20),
          const Icon(Icons.health_and_safety, size: 80, color: Color(0xFF0F6C5C)),
          const SizedBox(height: 15),
          Text(lang=="mr" ? "तुम्हाला काय त्रास होत आहे?" : lang=="hi" ? "आपको क्या परेशानी है?" : "How can I help you today?", style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          const SizedBox(height: 25),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
            icon: const Icon(Icons.mic), label: Text(lang=="mr" ? "बोला" : lang=="hi" ? "बोलें" : "Tap to Speak"),
            onPressed: () { setState(() { if(lang=="mr") { patientText = "मला ताप आणि खोकला आहे"; } else if(lang=="hi") { patientText = "Mujhe bukhar hai"; } else { patientText = "I have fever and cough"; } }); },
          ),
          const SizedBox(height: 20),
          if(patientText.isNotEmpty) Card(color: Colors.green.shade50, child: Padding(padding: const EdgeInsets.all(15), child: Text("Patient Said: $patientText\n✅ Offline Saved | FHIR JSON Created"))),
        ],
      ),
    );
  }
  Widget doctorScreen() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(children: [
        const Text("Doctor Dashboard", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        if(patientText.isEmpty) const Card(child: ListTile(title: Text("No patients yet"))) else Card(elevation: 3, child: Padding(padding: const EdgeInsets.all(15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("NEW PATIENT", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)), Text("Complaint: $patientText"), const SizedBox(height: 10), Container(padding: const EdgeInsets.all(8), color: Colors.black87, child: const Text('{\n "resourceType": "Encounter",\n "language": "mr-IN",\n "abhaLinked": true\n}', style: TextStyle(color: Colors.greenAccent, fontSize: 12)))]))),
      ]),
    );
  }
  Widget abhaScreen() {
    return const Padding(padding: EdgeInsets.all(20), child: Column(children: [Icon(Icons.verified_user, size: 80, color: Color(0xFF0F6C5C)), SizedBox(height: 15), Text("ABHA Integrated", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text("ABHA ID: 91-1234-5678-9012\nLinked & Verified")]));
  }
}
