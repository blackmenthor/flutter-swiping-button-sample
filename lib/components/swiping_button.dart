import 'package:flutter/material.dart';
import 'package:flutter_swiping_button/components/swipeable_widget.dart';

/// A Button that can detect swiping movement with shimmering arrows on far end.
class SwipingButton extends StatelessWidget {
  /// The text that the button will display.
  final String text;

  /// The callback invoked when the button is swiped.
  final VoidCallback onSwipeCallback;

  SwipingButton({
    Key key,
    @required this.text,
    @required this.onSwipeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 80.0,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(4.0)
            ),
          ),
          SwipeableWidget(
            height: 80.0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: _buildContent(),
              ),
              height: 80.0,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4.0)
              ),
            ),
            onSwipeCallback: onSwipeCallback,
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    final textStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);
    return Flexible(
      flex: 2,
      child: Text(
        text.toUpperCase(),
        style: textStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildText(),
      ],
    );
  }

}

