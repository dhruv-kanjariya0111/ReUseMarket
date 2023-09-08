import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/appbar_widget.dart';

class TermsAndPoliciesScreen extends StatelessWidget {
  const TermsAndPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(
          title: 'Terms and Policies',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Terms and Conditions:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Welcome to ReUseMarket. By using our application, you agree to the following terms and conditions:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '1. User Account: To use the ReUseMarket app, you must register for an account using your email address or Google account. You must provide accurate and complete information when creating your account. You are responsible for maintaining the security of your account and for any activity that occurs under your account.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '2. Rental Listings: Users can create rental listings for their gadgets to be rented out. All rental listings must be accurate and honest. ReUseMarket reserves the right to remove any listing that violates these terms.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '3. Rentals: Users can rent out gadgets from other users. ReUseMarket is not responsible for any damage or issues with the gadgets being rented. It is the responsibility of the user renting the gadget to ensure that it is returned in the same condition as it was received.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '4. Payment: ReUseMarket uses a third-party payment processing system to handle all transactions. By using ReUseMarket, you agree to the terms and conditions of our payment processor.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '5. User Information: ReUseMarket collects user information such as name, email address, phone number, and address. This information is used to facilitate rental transactions and improve our services. ReUseMarket will not share user information with third parties without the user\'s consent.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '6. Prohibited Content: Users may not post any content that is illegal, obscene, defamatory, or infringes on the intellectual property rights of others. ReUseMarket reserves the right to remove any content that violates these terms.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '7. Termination: ReUseMarket reserves the right to terminate user accounts that violate these terms and conditions.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '8. Changes to Terms: ReUseMarket reserves the right to update these terms and conditions at any time. By continuing to use the ReUseMarket app, you agree to the updated terms.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF07A3B2),
                  size: 50,
                ),
                onPressed: () {
                  Navigator.pop(context); // Navigate to the previous screen
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
