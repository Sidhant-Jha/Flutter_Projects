import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/model/pixel_art_model.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:provider/provider.dart';

class PixelArtGridViewBuilder extends StatelessWidget {
  PixelArtGridViewBuilder({super.key});
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final list = context.watch<PixelArtViewModel>().list;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        int crossAxisCount = (constraints.maxWidth / 20).floor();

        return GestureDetector(
            onPanUpdate: (details) {
              _handleDragSelection(context, details.localPosition, constraints, crossAxisCount, list.length);
            },
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
            controller: scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
            final pixelModel = list[index];
            return InkWell(
              onTap: () => context.read<PixelArtViewModel>().paintPixelEventDraw(index, list),
              child: Ink(
                decoration: BoxDecoration(
                  color: pixelModel.color,
                ),
              ),
            );
                      },
                    )
        );
      },
    );
  }

  void _handleDragSelection(
    BuildContext context, Offset position, BoxConstraints constraints, int crossAxisCount, int totalCount) {
    final list = context.read<PixelArtViewModel>().list;
    final gridSize = constraints.maxWidth / crossAxisCount;
    final scrollOffset = scrollController.offset;
    final adjustedPosition = Offset(position.dx, position.dy + scrollOffset);

    final row = (adjustedPosition.dy / gridSize).floor();
    final col = (adjustedPosition.dx / gridSize).floor();

    if (row >= 0 && col >= 0) {
      final index = row * crossAxisCount + col;
      if (index >= 0 && index < totalCount) {
        context.read<PixelArtViewModel>().paintPixelEventDraw(index, list);
      }
    }
  }
}


