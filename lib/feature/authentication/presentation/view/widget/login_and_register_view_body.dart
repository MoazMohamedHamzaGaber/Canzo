import 'package:canzo_app/core/widget/logo_and_name_app.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/register_view.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'login_view_body.dart';

class LoginAndRegisterViewBody extends StatelessWidget {
  const LoginAndRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LogoAndNameApp(),
                          const TabBarItem(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .7,
                            child: Flex(
                              direction: Axis.vertical,
                              children: [
                                Expanded(
                                  child: TabBarView(
                                    children: [LoginViewBody(), RegisterView()],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
