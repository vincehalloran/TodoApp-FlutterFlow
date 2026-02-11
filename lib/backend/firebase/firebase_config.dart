import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCAi0n69NthHPlt04LbfpsA7aTHXQ5Po60",
            authDomain: "to-do-d8456.firebaseapp.com",
            projectId: "to-do-d8456",
            storageBucket: "to-do-d8456.firebasestorage.app",
            messagingSenderId: "37659075541",
            appId: "1:37659075541:web:f6b29b090453597804535c",
            measurementId: "G-XMRNDNEV4P"));
  } else {
    await Firebase.initializeApp();
  }
}
