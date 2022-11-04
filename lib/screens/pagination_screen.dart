import 'package:bloc_reso_coder/blocs/pages_bloc/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/pages_model/pages_model.dart';

class PaginationScreen extends StatelessWidget {
  const PaginationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageBloc()..add(LoadPageEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Pagination Screen'),
          ),
          body: BlocBuilder<PageBloc, PageState>(builder: (context, state) {
            if (state is PageLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PageLoadedState) {
              PagesModel? pagesList = state.onePage;
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (_, index) => const Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: ListTile(
                          title: Text(
                            'Radi',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
              const Text('error');
            }
            return const Text('Error');
          })),
    );
  }
}

// class NamesPage extends StatelessWidget {
//   const NamesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PageBloc()..add(LoadPageEvent()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('The BLoC App'),
//         ),
//         body: BlocBuilder<PageBloc, PageState>(builder: (context, state) {
//           if (state is PageLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (state is PageLoadedState) {
//             List<UserModel> userList = state.pages;
//             return ListView.builder(
//               itemCount: userList.length,
//               itemBuilder: (_, index) {
//                 return Card(
//                   color: Colors.blue,
//                   elevation: 4,
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   child: ListTile(
//                     title: Text(
//                       userList[index].firstName.toString(),
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     subtitle: Text(
//                       userList[index].lastName.toString(),
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     trailing: CircleAvatar(
//                       backgroundImage:
//                           NetworkImage(userList[index].avatar.toString()),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (state is PageErrorState) {
//             return const Center(
//               child: Text('Error'),
//             );
//           }
//           return Container();
//         }),
//       ),
//     );
//   }
// }