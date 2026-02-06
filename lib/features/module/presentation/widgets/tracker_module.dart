import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ttrpgcharacter/core/theme/app_colors.dart';
import 'package:ttrpgcharacter/features/module/domain/model/tracker_module_data.dart';
import 'package:ttrpgcharacter/features/module/presentation/widgets/module_dialogs.dart';

class TrackerModule extends StatefulWidget {
  final String title;
  final TrackerModuleData data;

  const TrackerModule({super.key, required this.title, required this.data});

  @override
  State<TrackerModule> createState() => _TrackerModuleState();
}

class _TrackerModuleState extends State<TrackerModule> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Divider(color: AppColors.textSubtle),
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: AppColors.textPrimaryDark,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${widget.data.value}',
                            style: const TextStyle(
                              fontSize: 38,
                              color: AppColors.textPrimaryDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: ' / ',
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.textSubtle,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '${widget.data.maxValue}',
                            style: const TextStyle(
                              fontSize: 24,
                              color: AppColors.textSubtle,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: widget.data.value / widget.data.maxValue,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(5),
                      backgroundColor: AppColors.textSubtle,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 15),
                    IconButton(
                      onPressed: () {
                        showTrackerModuleEditorDialog(
                          context,
                          title: widget.title,
                        );
                      },
                      icon: Icon(FontAwesomeIcons.solidPenToSquare),
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
