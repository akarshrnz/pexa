import 'package:flutter/material.dart';
import 'package:pexa_carcare_test/core/app_data_provider.dart';
import 'package:pexa_carcare_test/core/theme/custom_colors.dart';

class CountrySearchScreen extends StatefulWidget {
  const CountrySearchScreen({super.key});

  @override
  State<CountrySearchScreen> createState() => _CountrySearchScreenState();
}

class _CountrySearchScreenState extends State<CountrySearchScreen> {
  final TextEditingController _controller = TextEditingController();

  List<String> _countries = [];
  List<String> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    init();
    _controller.addListener(_filterCountries);
  }

  init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _countries = List.from(countries);
      _filteredCountries = List.from(_countries);
      setState(() {});
    });
  }

  void _filterCountries() {
    final query = _controller.text.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = List.from(_countries);
      } else {
        _filteredCountries = _countries.where((country) => country.toLowerCase().contains(query)).toList();
      }
    });
  }

  void _clearSearch() {
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _controller.removeListener(_filterCountries);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Country Search",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Search for a country...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearSearch,
                      )
                    : null,
                filled: true,
                fillColor: theme.colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: theme.colorScheme.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
              ),
              style: theme.textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: _filteredCountries.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredCountries.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Card(
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.public),
                            title: Text(
                              _filteredCountries[index],
                              style: theme.textTheme.subtitle1,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "No countries found.",
                      style: theme.textTheme.subtitle1?.copyWith(color: Colors.grey),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
