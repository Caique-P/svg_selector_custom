import 'package:body_part_selector/src/body_part_selector.dart';
import 'package:body_part_selector/src/model/body_side.dart';
import 'package:flutter/material.dart';
import 'package:rotation_stage/rotation_stage.dart';

export 'package:rotation_stage/rotation_stage.dart';

class BodyPartSelectorTurnable extends StatelessWidget {
  final List<String>? bodypartsID;
  // final BodyParts bodyParts;
  final Function(
    Map<String, bool> selection,
  ) onSelectionUpdated;
  final bool mirrored;
  final EdgeInsets padding;
  final RotationStageLabelData? labelData;
  final Map<String, String>? bodypartsImage;
  const BodyPartSelectorTurnable(
      {super.key,
      //  required this.bodyParts,
      required this.onSelectionUpdated,
      this.mirrored = false,
      this.padding = EdgeInsets.zero,
      this.labelData,
      this.bodypartsID,
      this.bodypartsImage});

  @override
  Widget build(BuildContext context) {
    return RotationStage(
      contentBuilder: (index, side, page) => Padding(
        padding: padding,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BodyPartSelector(
            bodypartsImage: bodypartsImage,
            bodypartsID: (bodypartsID != null && bodypartsID!.isNotEmpty)
                ? bodypartsID!
                : [
                    'MACRO_BP_FACE',
                    'MACRO_BP_NECK',
                    'MACRO_BP_UPPER_ARM',
                    'MACRO_BP_FOREARM',
                    'MACRO_BP_CHEST',
                    'MACRO_BP_ABDOMEN',
                    'MACRO_BP_UPPER_LEG',
                    'MACRO_BP_LOWER_LEG',
                    'MACRO_BP_HIP',
                  ],
            side: side.map(
              front: BodySide.front,
              left: BodySide.left,
              back: BodySide.back,
              right: BodySide.right,
            ),
            //  bodyParts: bodyParts,
            onSelectionUpdated: onSelectionUpdated,
            mirrored: mirrored,
          ),
        ),
      ),
      labels: labelData,
    );
  }
}
