// import 'package:flutter/material.dart';
// import 'dart:ui' as ui show ImageFilter;

// class BlurredImageLoader extends StatefulWidget {
//   final String imageUrl;

//   const BlurredImageLoader({super.key, required this.imageUrl});

//   @override
//   _BlurredImageLoaderState createState() => _BlurredImageLoaderState();
// }

// class _BlurredImageLoaderState extends State<BlurredImageLoader> {
//   bool _isImageLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadImage();
//   }

//   @override
//   didChangeDependencies() {
//     _loadImage();
//     super.didChangeDependencies();
//   }

//   Future<void> _loadImage() async {
//     final image = NetworkImage(widget.imageUrl);
//     await precacheImage(image, context);
//     setState(() {
//       _isImageLoaded = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         if (_isImageLoaded)
//           Positioned.fill(
//             child: Image.network(
//               widget.imageUrl,
//               fit: BoxFit.cover,
//             ),
//           ),
//         BackdropFilter(
//           filter: ui.ImageFilter.blur(
//               sigmaX: 10, sigmaY: 10), // Adjust the blur intensity as needed
//           child: Container(
//             color: Colors.transparent,
//           ),
//         ),
//       ],
//     );
//   }
// }
