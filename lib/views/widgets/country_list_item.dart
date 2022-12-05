import 'package:flutter/material.dart';
import 'package:know_my_country/core/models/country.dart';

class CountryListItem extends StatelessWidget {
  const CountryListItem({
    Key? key,
    required this.country,
  }) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            spreadRadius: 0.5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 4.5,
            height: size.height / 7,
            child: Image.network(
              country.flags!.png,
              errorBuilder: (context, error, stackTrace) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error_outline_outlined,
                      color: Colors.black26,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Error loading image',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black26,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Tooltip(
                  message: country.name,
                  preferBelow: false,
                  child: Text(
                    country.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 93, 236, 112)
                            .withOpacity(0.78),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Tooltip(
                        message: country.region,
                        preferBelow: false,
                        child: Text(
                          country.region,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 93, 172, 236)
                              .withOpacity(0.78),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Tooltip(
                          message: country.subregion,
                          preferBelow: false,
                          child: Text(
                            country.subregion,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
