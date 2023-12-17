import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../Globals/globals.dart';
import '../../Login_SignUP_Screen/Auth_Helper/firebase_auth_helper.dart';
import '../Chating_Screen/Cloud_Firestore_Helper/firebase_cloud_firestore_helper.dart';

class Chat_Home_Screen extends StatelessWidget {
  const Chat_Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FireStore_Helper.fireStore_Helper.fetchUsers(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>> my_data = snapshot.data;
            List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
                (my_data == null) ? [] : my_data.docs;

            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: ListTile(
                      onTap: () async {
                        Navigator.pushNamed(context, "chat",
                            arguments: <String>[
                              Auth_Helper
                                  .auth_helper.firebaseAuth.currentUser!.uid,
                              data[i]['uid'],
                              data[i]['email']
                            ]);
                        all_stream_messages = await FireStore_Helper
                            .fireStore_Helper
                            .DisplayMessage(
                                uid1: Auth_Helper
                                    .auth_helper.firebaseAuth.currentUser!.uid,
                                uid2: data[i]['uid']);
                      },
                      leading: CircleAvatar(
                        radius: 20,
                        foregroundImage: NetworkImage(
                            "${Auth_Helper.auth_helper.firebaseAuth.currentUser?.photoURL}"),
                      ),
                      title: Text("${data[i]['email']?.split("@")[0]}"),
                      subtitle: Text("${data[i]['uid']}"),
                      trailing: IconButton(
                        onPressed: () async {
                          await FireStore_Helper.fireStore_Helper
                              .deleteUser(uid: data[i]['uid']);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: LinearProgressIndicator(),
          );
        },
      ),
    );
  }
}
