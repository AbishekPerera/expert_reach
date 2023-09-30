import 'package:expert_reach/ui/homescreen/inquiriesscreen/customerinquiries/customerinquiries_widget.dart';
import 'package:expert_reach/ui/homescreen/inquiriesscreen/yourinquiries/yourinquiries_widget.dart';
import 'package:flutter/material.dart';

class InquiriesScreen extends StatelessWidget {
  const InquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(children: [
        TabBar(
          tabs: [
            Tab(
              child: Text(
                "Your Inquiries",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Tab(
              child: Text(
                "Customer Inquiries",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [YourInquiriesWidget(), CustomerInquiriesWidget()],
          ),
        ),
      ]),
    );
  }
}
