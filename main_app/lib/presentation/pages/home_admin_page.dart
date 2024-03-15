import 'package:d_button/d_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:gap/gap.dart';
import 'package:main_app/common/app_route.dart';
import 'package:main_app/data/models/users.dart';
import 'package:main_app/presentation/bloc/user/user_cubit.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({super.key});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              buildHeader(),
              Positioned(
                  left: 20,
                  right: 20,
                  bottom: 0,
                  child: buildButtonAddEmployee()),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButtonAddEmployee() {
    return DButtonElevation(
        onClick: () {
          Navigator.pushNamed(context, AppRoute.addEmployee).then((value) {
            //refresh
          });
        },
        height: 50,
        radius: 12,
        mainColor: Colors.white,
        elevation: 4,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Gap(4),
            Text('Add new employee'),
          ],
        ));
  }

  Widget buildHeader() {
    return Container(
      height: 160,
      color: Colors.lightBlue,
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.profile);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/profile.png',
                height: 40,
                width: 40,
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                BlocBuilder<UserCubit, User>(
                  builder: (context, state) {
                    return Text(
                      state.name ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 6,
            ),
            child: Text(
              DateFormat('d MMMM, yyyy').format(DateTime.now()),
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
