import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:know_my_country/core/models/country.dart';
import 'package:know_my_country/core/services/networking/network_helper.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _countryController = TextEditingController();
    _countryNotifier = ValueNotifier([]);

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
    super.dispose();
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
                if (_countryController.text.trim().isEmpty) {
                  _countryNotifier.value = [...data.value];
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
                            fullList: data.value,
                          ),
                        ],
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

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.countryController,
    required this.countryNotifier,
    required this.fullList,
  }) : super(key: key);

  final TextEditingController countryController;
  final ValueNotifier<List<Country>> countryNotifier;
  final List<Country> fullList;

  filterSearch(String country) {
    countryNotifier.value = fullList
        .where((element) => element.name.toLowerCase().contains(country))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: countryController,
      onChanged: ((value) {
        filterSearch(value);
      }),
      onSubmitted: ((value) {
        filterSearch(value);
      }),
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
  }
}
