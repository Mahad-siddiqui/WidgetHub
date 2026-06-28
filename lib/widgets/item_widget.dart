import 'package:flutter/material.dart';
import 'package:widgethub/modules/catelog.dart';

class ItemWidget extends StatelessWidget {
  final Items item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: 60,
                height: 60,
                color: Colors.grey[200],
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60,
                height: 60,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.desc,
              style: const TextStyle(fontSize: 13),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                item.color,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.purple[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "\$${item.price.toStringAsFixed(2)}",
            style: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        isThreeLine: false,
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:widgethub/modules/catelog.dart';

// class ItemWidget extends StatelessWidget {
//   final Items item;

//   const ItemWidget({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.08),
//             blurRadius: 12,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           _ProductImage(image: item.image),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item.name,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   item.desc,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey.shade600,
//                     height: 1.3,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   item.color,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.purple.shade600,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           Text(
//             "\$${item.price.toStringAsFixed(0)}",
//             style: const TextStyle(
//               color: Colors.purple,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProductImage extends StatelessWidget {
//   final String image;

//   const _ProductImage({required this.image});

//   @override
//   Widget build(BuildContext context) {
//     final isNetworkImage = image.startsWith('http');

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         width: 72,
//         height: 72,
//         color: Colors.grey.shade100,
//         child: isNetworkImage
//             ? Image.network(
//                 image,
//                 fit: BoxFit.cover,
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return const _ImagePlaceholder();
//                 },
//                 errorBuilder: (context, error, stackTrace) =>
//                     const _ImagePlaceholder(),
//               )
//             : Image.asset(
//                 image,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) =>
//                     const _ImagePlaceholder(),
//               ),
//       ),
//     );
//   }
// }

// class _ImagePlaceholder extends StatelessWidget {
//   const _ImagePlaceholder();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.purple.shade50,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Icon(Icons.phone_iphone, color: Colors.purple.shade300, size: 34),
//     );
//   }
// }
