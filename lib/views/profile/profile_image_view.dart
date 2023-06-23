import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:final_project/views/profile/profile_element_view.dart';

class ProfileImageView extends StatefulWidget {
  const ProfileImageView({
    Key? key,
    required this.text,
    required this.data,
  }) : super(key: key);

  final String text;
  final String data;

  @override
  ProfileImageViewState createState() => ProfileImageViewState();
}

class ProfileImageViewState extends State<ProfileImageView> {
  bool _showImage = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _showImage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    log(widget.data, name: 'photoUrl');
    return ProfileElementView(
      flex: 2,
      text: widget.text,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: _showImage
            ? Image.network(widget.data)
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
