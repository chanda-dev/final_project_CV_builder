import 'package:builder/model/PersonalDetail/personaldetail.dart';
import 'package:builder/screen/cvView/complete_cv_view.dart';
import 'package:flutter/material.dart';

class SaveWork extends StatelessWidget {
  const SaveWork({
    super.key,
    required this.thirdDetail,
    required this.onViewClick,
    required this.onDelete,
  });

  final ThirdDetail thirdDetail;
  final VoidCallback onViewClick;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Dynamic image or preview
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CompleteCvView(
                    thirdDetail: thirdDetail,
                  ),
                ),
                const SizedBox(height: 8),
                // CV Style Name
                Text(
                  thirdDetail.secondDetail.personalDetail.cvStyle.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: onDelete,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.5),
                        ),
                      ),
                      child: const Text('Delete'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: onViewClick,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff009EE2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.5),
                        ),
                      ),
                      child: const Text('View'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
