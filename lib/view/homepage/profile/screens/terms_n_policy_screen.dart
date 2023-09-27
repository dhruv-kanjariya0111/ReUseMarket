import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/appbar_widget.dart';

class TermsAndPoliciesScreen extends StatelessWidget {
  const TermsAndPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarWidget(
          title: 'Terms and Policies',
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Welcome to ReUseMarket. By using our application, you agree to the following terms and conditions:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '1. User Account: To use the ReUseMarket app, you must register for an account using your email address or Google account. You must provide accurate and complete information when creating your account. You are responsible for maintaining the security of your account and for any activity that occurs under your account.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '2. Refurbish Listings: Users can create refurbished listings for their gadgets to be bought out. All refurbished listings must be accurate and honest. ReUseMarket reserves the right to remove any listing that violates these terms.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '3. Refurbish: Users can buy out gadgets from other users. ReUseMarket is not responsible for any damage or issues with the gadgets being bought. It is the responsibility of the user buying the gadget to ensure that it is returned in the same condition as it was received.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '4. User Information: ReUseMarket collects user information such as name, email address, phone number, and address. This information is used to facilitate refurbished transactions and improve our services. ReUseMarket will not share user information with third parties without the user\'s consent.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '5. Prohibited Content: Users may not post any content that is illegal, obscene, defamatory, or infringes on the intellectual property rights of others. ReUseMarket reserves the right to remove any content that violates these terms.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '6. Termination: ReUseMarket reserves the right to terminate user accounts that violate these terms and conditions.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '7. Changes to Terms: ReUseMarket reserves the right to update these terms and conditions at any time. By continuing to use the ReUseMarket app, you agree to the updated terms.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
