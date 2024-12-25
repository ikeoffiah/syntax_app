import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Levels Page
class LevelsPage extends StatefulWidget {
  /// [LevelsPage]
  const LevelsPage({required this.currentLevel, super.key});

  /// current level
  final int currentLevel;

  @override
  State<LevelsPage> createState() => _LevelsPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('currentLevel', currentLevel));
  }
}

class _LevelsPageState extends State<LevelsPage> {
  final List<Map<String, dynamic>> levels = <Map<String, dynamic>>[
    <String, dynamic>{
      "title": "Newbie",
      "icon": Icons.star_border,
      "isUnlocked": true,
    },
    <String, dynamic>{
      "title": "Beginner",
      "icon": Icons.star_half,
      "isUnlocked": true,
    },
    <String, dynamic>{
      "title": "Intermediate",
      "icon": Icons.star,
      "isUnlocked": false,
    },
    <String, dynamic>{
      "title": "Advanced",
      "icon": Icons.auto_graph,
      "isUnlocked": false,
    },
    <String, dynamic>{
      "title": "Master",
      "icon": Icons.shield,
      "isUnlocked": false,
    },
    <String, dynamic>{
      "title": "Guru",
      "icon": Icons.lightbulb,
      "isUnlocked": false,
    },
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Levels",
            style: primaryColorFira16600,
          ),
          backgroundColor: whiteColor,
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: <Color>[
              //     primaryColor.withOpacity(0.8),
              //     primaryColor.withOpacity(0.4),
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
              color: whiteColor),
          child: ListView.builder(
            itemCount: levels.length,
            itemBuilder: (BuildContext context, int index) {
              final Map<String, dynamic> level = levels[index];
              final bool isCurrentLevel = index == widget.currentLevel;
              final bool isUnlocked = level["isUnlocked"];

              return Card(
                shadowColor: primaryColor,
                color: isUnlocked ? Colors.white : Colors.grey.shade200,
                elevation: isCurrentLevel ? 8 : 3,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  side: isCurrentLevel
                      ? const BorderSide(color: Colors.orange, width: 3)
                      : BorderSide.none,
                ),
                child: ListTile(
                  leading: Icon(
                    level["icon"],
                    color: isUnlocked ? Colors.purple : Colors.grey,
                    size: 40,
                  ),
                  title: Text(
                    level["title"],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isUnlocked ? Colors.black : Colors.grey,
                    ),
                  ),
                  subtitle: isUnlocked
                      ? const Text(
                          "Unlocked Level",
                          style: TextStyle(color: Colors.green),
                        )
                      : const Text(
                          "Locked Level",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                  trailing: isUnlocked
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.lock, color: Colors.grey),
                  onTap: isUnlocked
                      ? () {
                          // Handle level click
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("You selected ${level["title"]}!"),
                            ),
                          );
                        }
                      : null,
                ),
              );
            },
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Map<String, dynamic>>('levels', levels));
  }
}
