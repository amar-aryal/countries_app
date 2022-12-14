import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:know_my_country/core/models/country.dart';
import 'package:know_my_country/core/services/networking/network_helper.dart';
import 'package:know_my_country/views/country_detail_screen.dart';
import 'package:know_my_country/views/widgets/error_view.dart';

import 'widgets/country_list_item.dart';

final countriesProvider = FutureProvider<List<Country>>((ref) {
  final countryHelper = ref.watch(networkHelperProvider);
  return countryHelper.getCountries();
});

class CountriesListScreen extends ConsumerStatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CountriesListScreen> createState() =>
      _CountriesListScreenState();
}

class _CountriesListScreenState extends ConsumerState<CountriesListScreen> {
  late ScrollController _controller;
  late TextEditingController _countryController;
  late ValueNotifier<List<Country>> _countryNotifier;
  late ValueNotifier<String> _selectedRegionNotifier;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _countryController = TextEditingController();
    _countryNotifier = ValueNotifier([]);
    _selectedRegionNotifier = ValueNotifier('All');

    // _controller.addListener(() {
    //   if (_controller.offset >=
    //           _controller.position.maxScrollExtent &&
    //       !_controller.position.outOfRange) {

    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    _countryController.dispose();
    _countryNotifier.dispose();
    _selectedRegionNotifier.dispose();
    super.dispose();
  }

  regionFilter(String region, List<Country> fullList) {
    Scrollable.ensureVisible(
      GlobalObjectKey(region).currentContext!,
      duration: const Duration(
        milliseconds: 500,
      ),
      alignment: .5,
      curve: Curves.easeIn,
    );
    _selectedRegionNotifier.value = region;
    if (region == 'All') {
      _countryNotifier.value = [...fullList];
      return;
    }
    _countryNotifier.value =
        fullList.where((element) => element.region == region).toList();
  }

  @override
  Widget build(BuildContext context) {
    final countries = ref.watch(countriesProvider);
    final size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () => ref.refresh(countriesProvider.future),
      child: Scaffold(
        body: Container(
          child: countries.maybeMap(
              orElse: () => const SizedBox(),
              loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (e) {
                return Stack(
                  children: [
                    ListView(),
                    ErrorView(
                      errorText: e.error.toString(),
                      onPressed: () => ref.refresh(countriesProvider),
                    ),
                  ],
                );
              },
              data: (data) {
                // to prevent resetting to original list after keyboard opens/closes and triggers rebuild
                // TODO: code working but still review this
                if (_selectedRegionNotifier.value == 'All') {
                  if (_countryController.text.trim().isEmpty) {
                    _countryNotifier.value = [...data.value];
                  }
                } else {
                  if (_countryController.text.trim().isEmpty) {
                    _countryNotifier.value = [
                      ...data.value.where(
                        (element) =>
                            element.region == _selectedRegionNotifier.value &&
                            element.name
                                .toLowerCase()
                                .contains(_countryController.text),
                      ),
                    ];
                  }
                }

                return CustomScrollView(
                  controller: _controller,
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: size.height / 6,
                      backgroundColor: const Color(0xff24305E),
                      titleSpacing: 40,
                      title: Column(
                        children: [
                          SearchField(
                            countryController: _countryController,
                            countryNotifier: _countryNotifier,
                            selectedRegion: _selectedRegionNotifier.value,
                            fullList: data.value,
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ValueListenableBuilder(
                          valueListenable: _selectedRegionNotifier,
                          builder: (_, String value, __) {
                            return Row(
                              children: [
                                ...[
                                  'All',
                                  'Africa',
                                  'Americas',
                                  'Asia',
                                  'Europe',
                                  'Oceania'
                                ].map(
                                  (e) => InkWell(
                                    onTap: () {
                                      if (_selectedRegionNotifier.value != e) {
                                        regionFilter(e, data.value);
                                      }
                                    },
                                    child: Container(
                                      key: GlobalObjectKey(e),
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 14),
                                      decoration: BoxDecoration(
                                        color: e == value
                                            ? const Color(0xff24305E)
                                            : Colors.grey.shade400,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: _countryNotifier,
                        builder: (_, value, __) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              ((context, index) {
                                return Column(
                                  children: [
                                    CountryListItem(
                                      country: _countryNotifier.value[index],
                                    ),
                                  ],
                                );
                              }),
                              childCount: _countryNotifier.value.length,
                            ),
                          );
                        }),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class Continent {
  const Continent({
    required this.name,
    required this.size,
  });

  final String name;
  final int size;

  @override
  String toString() {
    return '$name ($size)';
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.countryController,
    required this.countryNotifier,
    required this.fullList,
    required this.selectedRegion,
  }) : super(key: key);

  final TextEditingController countryController;
  final ValueNotifier<List<Country>> countryNotifier;
  final String selectedRegion;
  final List<Country> fullList;

  filterSearch(String country) {
    if (selectedRegion == 'All') {
      countryNotifier.value = fullList
          .where((element) => element.name.toLowerCase().contains(country))
          .toList();
    } else {
      countryNotifier.value = fullList
          .where((element) =>
              element.name.toLowerCase().contains(country) &&
              element.region == selectedRegion)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Autocomplete<Country>(
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Country> onSelected,
          Iterable<Country> countries) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: SizedBox(
              width: size.width / 1.5,
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index) {
                  final Country option = countries.elementAt(index);

                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(
                        option.name,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
      onSelected: ((option) {
        FocusScope.of(context).unfocus();

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CountryDetailScreen(
                    country: option,
                  )),
        );
      }),
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable.empty();
        }
        return fullList
            .where((country) => country.name
                .toLowerCase()
                .startsWith(textEditingValue.text.toLowerCase()))
            .toList();
      },
      displayStringForOption: (Country option) => option.name,
      fieldViewBuilder:
          ((context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          // onChanged: ((value) {}),
          focusNode: focusNode,
          // onSubmitted: ((value) {
          //   filterSearch(value);
          // }),
          decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              hintStyle: const TextStyle(color: Colors.black26),
              hintText: "Search countries",
              fillColor: Colors.white,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  backgroundColor: const Color(0xffF76C6C),
                  child: IconButton(
                    splashRadius: 0.5,
                    onPressed: () {
                      filterSearch(countryController.text.trim());
                      FocusScope.of(context).unfocus();
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        );
      }),
    );
  }
}
