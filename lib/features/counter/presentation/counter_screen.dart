import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  String? _warning;

  void _increment() {
    setState(() {
      _counter++;
      _warning = null;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _warning = null;
      } else {
        _warning = 'Cannot go below 0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
                centerTitle: true,

        title: const Text('Counter', ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: theme.cardColor.withOpacity(0.95),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30,),
              Icon(Icons.countertops, size: 60, color: primaryColor),
              const SizedBox(height: 16),
              Text(
                'Current Value',
                style: textTheme.subtitle1?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                '$_counter',
                style: textTheme.headline1?.copyWith(fontSize: 48, color: primaryColor),
              ),
              if (_warning != null) ...[
                const SizedBox(height: 12),
                Text(_warning!, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ],
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _increment,
                    icon: const Icon(Icons.add),
                    label: const Text("Increment"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                 const SizedBox(width: 16),
                   ElevatedButton.icon(
                    onPressed: _decrement,
                    icon: const Icon(Icons.remove),
                    label: const Text("Decrement"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  
                ],
              ),              const SizedBox(height: 24),

            ],
          ),
        ),
      ),
    );
  }
}
