import 'package:IOT_SmartHome/core/function/custom_troast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../parent_cubit/parent_cubit.dart';

class OTPApprovalScreen extends StatefulWidget {
  const OTPApprovalScreen({super.key});

  @override
  _OTPApprovalScreenState createState() => _OTPApprovalScreenState();
}

class _OTPApprovalScreenState extends State<OTPApprovalScreen> {
  final TextEditingController requestController = TextEditingController();
  List<Map<String, String>> pendingRequests = [
    {'child': 'Child1', 'device': 'Living Room Light'},
    {'child': 'Child2', 'device': 'AC'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Approval')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: requestController,
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      context
                          .read<ParentCubit>()
                          .approveRequest(requestController.text);
                      ShowToast(
                          "The Request Approved: ${requestController.text}");
                      print("The Request Approved: ${requestController.text}");
                    },
                    child: const Text('Approve'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      context
                          .read<ParentCubit>()
                          .rejectRequest(requestController.text);
                      ShowToast(
                          "The Request  Rejected: ${requestController.text}");
                      print("The Request  Rejected: ${requestController.text}");
                    },
                    child: const Text('Reject'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: pendingRequests.length,
                itemBuilder: (context, index) {
                  var request = pendingRequests[index];
                  return ListTile(
                    title: Text('${request['child']} - ${request['device']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
