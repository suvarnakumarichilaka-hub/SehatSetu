# SehatSetu - SIH 2025 (ID: 26133)
### Rural Voice-Based Primary Healthcare

**Team:** suvarnakumarichilaka-hub

### 🌟 Problem
ASHA workers in rural Maharashtra struggle with Marathi data entry, no internet connectivity, and ABHA integration.

### 💡 Solution: SehatSetu
Offline-First, Voice-First app with Bhashini AI.

- **Language:** Default English + Marathi/Hindi Selector (Top & Chips)
- **Voice Input:** Bhashini ASR for Marathi voice to text
- **Offline:** Hive DB - saves data without internet
- **Doctor:** Dashboard with AI Summary + FHIR JSON
- **ABHA:** Linked & Verified (ABDM Compliant)

### 🛠 Tech Stack
Flutter, Bhashini, Hive, ABDM FHIR R4, ABHA

### 📱 Screens
1. **Patient Screen:** English default, Language selector, Tap to Speak
2. **Doctor Screen:** Patient complaints + FHIR R4 JSON
3. **ABHA Screen:** ABHA ID 91-1234-5678-9012 - Sync status

### ▶️ How to Run
```bash
flutter pub get
flutter run
