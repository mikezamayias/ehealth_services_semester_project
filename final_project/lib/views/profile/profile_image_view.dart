import 'package:final_project/views/profile/profile_element_view.dart';
import 'package:flutter/material.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({
    Key key,
    @required this.text,
    @required this.data,
  }) : super(key: key);

  final String text;
  final String data;

  @override
  Widget build(BuildContext context) {
    return ProfileElementView(
      flex: 2,
      text: text,
      child: Align(
        alignment: Alignment.centerRight,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: data != null
              ? Image.network(
                  data,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                )
              : Container(),
        ),
      ),
    );
  }
}
