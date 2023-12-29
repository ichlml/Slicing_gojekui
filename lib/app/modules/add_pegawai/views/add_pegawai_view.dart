import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_pegawai_controller.dart';

class AddPegawaiView extends GetView<AddPegawaiController> {
  const AddPegawaiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD PEGAWAI'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 27),
          TextField(
            controller: controller.nipC,
            decoration:
                InputDecoration(border: OutlineInputBorder(), labelText: 'NIP'),
          ),
          SizedBox(height: 27),
          TextField(
            controller: controller.nameC,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Nama'),
          ),
          SizedBox(height: 27),
          TextField(
            controller: controller.emailC,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Email'),
          ),
          SizedBox(height: 27),
          ElevatedButton(
              onPressed: () {
                controller.addPegawai();
              },
              child: Text('Add Pegawai'))
        ],
      ),
    );
  }
}
