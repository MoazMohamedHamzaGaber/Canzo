import 'package:canzo_app/feature/authentication/presentation/view/widget/register_view.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/tab_bar_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/style.dart';
import 'login_view_body.dart';

class LoginAndRegisterViewBody extends StatelessWidget {
  const LoginAndRegisterViewBody({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height *.1,
                            child: Flex(
                              direction: Axis.vertical,
                              children: [
                                Expanded(
                                  child:  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/logo.jpg'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Canzo', style: StyleText.style20(color:AppColors.green),),
                                              Text('Recycle smarter, earn greener',
                                                style: StyleText.style16,
                                              )
                                            ]),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const TabBarItem(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *.7,
                            child: Flex(
                              direction: Axis.vertical,
                              children: [
                                Expanded(
                                  child: TabBarView(children: [
                                    LoginViewBody(),
                                    RegisterView(),
                                  ]),
                                )
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
