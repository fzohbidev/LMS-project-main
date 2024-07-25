import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart'; // Add this import
import 'package:lms/constants.dart';
import 'package:lms/core/utils/assets.dart';
import 'package:lms/core/utils/styles.dart';
import 'package:lms/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:lms/features/home/presentation/views/widgets/custom_card.dart';
import 'package:lms/features/home/presentation/views/widgets/custom_card_container.dart';
import 'package:lms/features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:lms/features/home/presentation/views/widgets/custom_tab_bar.dart';
import 'package:lms/features/home/presentation/views/widgets/custom_tab_bar_view.dart';
import 'package:lms/core/utils/app_router.dart'; // Import your AppRouter

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with SingleTickerProviderStateMixin {
  bool _drawerOpen = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _toggleDrawer() {
    setState(() {
      _drawerOpen = !_drawerOpen;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: _toggleDrawer,
                        ),
                      ],
                    ),
                    Expanded(
                      child: _drawerOpen
                          ? CustomExpandedDrawer(closeDrawer: _toggleDrawer)
                          : CustomCollapsedDrawer(closeDrawer: _toggleDrawer),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomCard(),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            'Good morning, Fadl Al Zohbi',
                            style: Styles.textStyle28,
                          ),
                          const Text(
                            'The Simplified view helps you focus on the most common tasks for the organization like you',
                            style: Styles.textStyle16,
                          ),
                          // Button to navigate to Billing User Assignment Page
                          const SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align buttons to the left
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  GoRouter.of(context).push(
                                      AppRouter.kBillingUserAssignmentView);
                                },
                                child: const Text('Assign Billing Users',
                                    style: Styles.textStyle16),
                              ),
                              const SizedBox(
                                  width: 20), // Space between buttons
                              ElevatedButton(
                                onPressed: () {
                                  GoRouter.of(context).push(
                                      AppRouter.kBillsPaymentsListingView);
                                },
                                child: const Text('List Bills and Payments',
                                    style: Styles.textStyle16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align buttons to the left
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Navigate to Add/Remove Billing Users Page
                                  GoRouter.of(context).push(
                                      AppRouter.kAddRemoveBillingUsersView);
                                },
                                child: const Text('Add/Remove Billing Users',
                                    style: Styles.textStyle16),
                              ),
                              const SizedBox(
                                  width: 20), // Space between buttons
                              ElevatedButton(
                                onPressed: () {
                                  GoRouter.of(context)
                                      .push(AppRouter.kInvoiceDetailsView);
                                },
                                child: const Text('View Invoice Details',
                                    style: Styles.textStyle16),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          Row(
                            children: [
                              const Text(
                                'For organization like yours',
                                style: Styles.textStyle20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Show more',
                                style: Styles.textStyle20
                                    .copyWith(color: kIconColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              CustomContainer(
                                  iconPath: AssetsData.copilotImage,
                                  cardTitle: 'Assign unused licenses',
                                  cardText:
                                      'You have 1 unused license for Microsoft 365 Business Standard.'),
                              SizedBox(
                                width: 50,
                              ),
                              CustomContainer(
                                  icon: Icon(FontAwesomeIcons.chalkboardUser),
                                  cardTitle:
                                      'Help people stay productive on the go',
                                  cardText:
                                      'Share training for the Microsoft 365 app for iOS or Android.'),
                            ],
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          const Text(
                            'Your organization',
                            style: Styles.textStyle20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTabBar(tabController: _tabController),
                          SizedBox(
                            height:
                                400, // Add a fixed height for the TabBarView
                            child:
                                CustomTabBarView(tabController: _tabController),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
