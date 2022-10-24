import 'package:bloc_reso_coder/blocs/app_states_bloc/app_states_bloc.dart';
import 'package:bloc_reso_coder/repos/crypto_repository.dart';
import 'package:bloc_reso_coder/repos/crypto_screen.dart';
import 'package:bloc_reso_coder/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) =>
                CryptoRepository(), //napraviti da mogu da pozovem vise repo-a (UserRepository)
          ),
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
        ],
        child: const MaterialApp(
          home: CryptoScreen(),
        ));
  }
}

class NamesPage extends StatelessWidget {
  const NamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of<UserRepository>(context))
            ..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The BLoC App'),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (_, index) {
                return Card(
                  color: Colors.blue,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                      userList[index].firstName.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      userList[index].lastName.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: CircleAvatar(
                      backgroundImage:
                          NetworkImage(userList[index].avatar.toString()),
                    ),
                  ),
                );
              },
            );
          } else if (state is UserErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
