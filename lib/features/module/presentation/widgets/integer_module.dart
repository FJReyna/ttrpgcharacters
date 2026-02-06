import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ttrpgcharacter/core/theme/app_colors.dart';
import 'package:ttrpgcharacter/features/module/domain/model/integer_module_data.dart';

class IntegerModule extends StatefulWidget {
  final String title;
  final IntegerModuleData data;

  const IntegerModule({super.key, required this.title, required this.data});

  @override
  State<IntegerModule> createState() => _IntegerModuleState();
}

class _IntegerModuleState extends State<IntegerModule> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Divider(color: AppColors.textSubtle),
          SizedBox(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.circleMinus,
                        color: AppColors.textPrimaryDark,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          '${widget.data.value}',
                          style: const TextStyle(
                            fontSize: 38,
                            color: AppColors.textPrimaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 24,
                            color: AppColors.textPrimaryDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.circlePlus,
                        color: AppColors.textPrimaryDark,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
