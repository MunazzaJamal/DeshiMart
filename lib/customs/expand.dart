import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ExpandableDescription extends StatefulWidget {
  final String title;
  final String description;

  const ExpandableDescription({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  _ExpandableDescriptionState createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _isDescriptionVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(
                _isDescriptionVisible
                    ? IconlyLight.arrow_down_2
                    : IconlyLight.arrow_down_2,
              ),
              color: Colors.grey,
              onPressed: () {
                setState(() {
                  _isDescriptionVisible = !_isDescriptionVisible;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (_isDescriptionVisible)
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}
