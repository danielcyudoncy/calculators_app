import 'package:calculators_app/utils/widgets/calculator_card.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/icon.png', height: 50), 
            const SizedBox(width: 10),
            const Text(
              'Calculator App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Calculator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), 
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: const [
                  CalculatorCard(title: 'BMI Calculator', route: '/bmi', icon: Icons.fitness_center),
                  CalculatorCard(title: 'EMI Calculator', route: '/emi', icon: Icons.monetization_on),
                  CalculatorCard(title: 'Loan Calculator', route: '/loan', icon: Icons.attach_money),
                  CalculatorCard(title: 'Income Tax\n Calculator', route: '/income_tax', icon: Icons.account_balance),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
