import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPegawaiController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController nipC = TextEditingController();

  // FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addPegawai() async {
    if (nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        nipC.text.isNotEmpty) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailC.text,
          password: "password",
        );

        if (credential.user != null) {
          String uid = credential.user!.uid;

          await firestore.collection("pegawai").doc(uid).set({
            "nip": nipC.text,
            "nama": nameC.text,
            "email": emailC.text,
            "uid": uid,
            "createdat": DateTime.now().toIso8601String()
          });
        }

        print(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
              'Terjadi kesalahan saat input', 'password terlalu singkat!');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
              'Terjadi kesalahan saat input', 'email sudah terdaftar!');
        }
      } catch (e) {
        Get.snackbar(
            'Terjadi kesalahan saat input', 'tida bisa menambahkan pegawai!');
      }
    } else {
      Get.snackbar('Terjadi kesalahan saat input', 'field tidak boleh kosong!');
    }
  }
}
