import "package:flutter/material.dart";

import '../../../../core/constants/const_color.dart';
import '../../../../core/database/database_helper.dart';

class DeleteAllDataButton extends StatelessWidget {
  const DeleteAllDataButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: green,
        ),
        child: const Text('Delete all Data'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('All data will be deleted'),
                  actions: [
                    ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                        child: const Text('Delete'),
                        onPressed: () {
                          AnimalDatabase.instance.deleteAll();
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('All data deleted'),
                            ),
                          );
                        })
                  ],
                );
              });
        });
  }
}
