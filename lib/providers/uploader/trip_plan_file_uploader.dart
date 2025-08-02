// import 'dart:developer';
// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mcic_app/constant/configs.dart';
// import 'package:mcic_app/ext/file_ext.dart';
// import 'package:mcic_app/sales/view/trip_plan/widget/uploader/uploader_state.dart';
// import 'package:mcic_app/services/sale/sale_trip_plan_service.dart';
// import 'package:mcic_app/services/upload/upload_service.dart';
// import 'package:rxdart_ext/rxdart_ext.dart';

// class TripPlanFileField extends HookConsumerWidget {
//   final int maximumFiles;
//   final ValueChanged<List<UploadResult>>? fileUploadChanged;
//   final List<UploadResult> value;
//   final int? tripPlanId;

//   const TripPlanFileField({
//     super.key,
//     this.fileUploadChanged,
//     this.maximumFiles = 3,
//     this.value = const <UploadResult>[],
//     this.tripPlanId,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final uploads = useState<List<UploadState>>([]);
//     final currentFileUploads = useState<List<UploadResult>>([]);

//     useEffect(() {
//       if (uploads.value.isNotEmpty) return;
//       if (value.isEmpty) return;
//       uploads.value = value
//           .map(
//             (e) => UploadState.completed(
//           e.id ?? DateTime.now().millisecondsSinceEpoch,
//           e.file,
//           e.fileName,
//           e.url,
//         ),
//       )
//           .toList();
//       return null;
//     }, [value]);

//     useEffect(() {
//       final results = <UploadResult>[];

//       for (var i = 0; i < uploads.value.length; i++) {
//         final data = uploads.value[i];
//         data.maybeWhen(
//           orElse: () {},
//           completed: (id, file, fileName, url) {
//             results.add(UploadResult(file: file, url: url, fileName: fileName));
//           },
//         );
//       }

//       fileUploadChanged?.call(results);
//       currentFileUploads.value = results;
//       return null;
//     }, [uploads.value]);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(top: 0.04.sw, bottom: 0.02.sw),
//           child: Text('เอกสารแนบ (PDF)',
//               style: TextStyle(
//                   color: const Color(0xFF515151),
//                   fontSize: ScreenUtil().setSp(12),
//                   fontWeight: FontWeight.w400,
//                   fontFamily: 'Kanit')),
//         ),
//         GestureDetector(
//           onTap: currentFileUploads.value.length < 3
//               ? () async {
//                   final result = await FilePicker.platform.pickFiles(
//                     allowMultiple: false,
//                     type: FileType.custom,
//                     allowedExtensions: ['pdf'],
//                   );

//                   if (result != null && result.paths.isNotEmpty) {
//                     List<File> files = result.paths
//                         .where((element) => element?.contains(".pdf") == true)
//                         .map((path) => File(path!))
//                         .toList();

//                     final newValues = [
//                       ...uploads.value,
//                       ...files
//                           .map((e) => UploadState.processing(
//                               DateTime.now().millisecondsSinceEpoch, e))
//                           .toList()
//                     ];
//                     uploads.value = newValues;
//                   }
//                 }
//               : null,
//           child: DottedBorder(
//             color: const Color(0xFF325FA4),
//             dashPattern: const [3, 3],
//             strokeWidth: 1,
//             strokeCap: StrokeCap.round,
//             borderType: BorderType.RRect,
//             radius: const Radius.circular(16),
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 0.04.sw),
//                       child: Text(
//                         'เพิ่มไฟล์',
//                         style: TextStyle(
//                           color: const Color(0xFF656565),
//                           fontSize: ScreenUtil().setSp(14),
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 8),
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: kPrimaryColor,
//                       ),
//                       width: 24,
//                       height: 24,
//                       margin: const EdgeInsets.only(right: 8),
//                       child: const Icon(
//                         Icons.add,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         ListView.builder(
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             final data = uploads.value[index];
//             return TripPlanFileUploadTile(
//               state: data,
//               onChanged: (state) {
//                 //find index of state
//                 final index = uploads.value.indexWhere((element) {
//                   return element.id == state.id;
//                 });
//                 if (index != -1) {
//                   final newValues = [...uploads.value];
//                   newValues[index] = state;
//                   uploads.value = newValues;
//                 }
//               },
//               onRemove: () {
//                 final index = uploads.value.indexWhere((element) {
//                   return element.id == data.id;
//                 });
//                 if (index != -1) {
//                   final newValues = [...uploads.value];
//                   newValues.removeAt(index);
//                   uploads.value = newValues;

//                   if (tripPlanId == null) return;
//                   ref.read(saleTripPlanServiceProvider)
//                       .removeFile(tripPlanId!, data.id)
//                       .doOnError((p0, p1) => log(p0.toString(), stackTrace: p1))
//                       .listen((value) { });
//                 }
//               }
//             );
//           },
//           itemCount: uploads.value.length,
//           physics: const NeverScrollableScrollPhysics(),
//         ),
//       ],
//     );
//   }
// }

// final fileUploadProvider = StateNotifierProvider.autoDispose
//     .family<FileUploadNotifier, UploadState, UploadState>((ref, state) {
//   return FileUploadNotifier(state, ref.read(uploadServiceProvider))..perform();
// });

// class FileUploadNotifier extends StateNotifier<UploadState> {
//   final UploadService service;
//   final CompositeSubscription compositeSubscription = CompositeSubscription();

//   FileUploadNotifier(super.state, this.service) : super();

//   @override
//   void dispose() {
//     compositeSubscription.dispose();
//     super.dispose();
//   }

//   void perform() {
//     state.maybeWhen(
//         orElse: () {},
//         processing: (id, file) {
//           service
//               .uploadFile(file, module: 'tripplan')
//               .doOnError((p0, p1) {
//                 log(p0.toString(), stackTrace: p1);
//                 state = UploadState.failed(id, file, p0, p1);
//               })
//               .listen((value) =>
//                   state = UploadState.completed(id, file, file.fileName, value))
//               .addTo(compositeSubscription);
//         });
//   }
// }

// class TripPlanFileUploadTile extends ConsumerWidget {
//   final UploadState state;
//   final ValueChanged<UploadState>? onChanged;
//   final VoidCallback? onRemove;

//   const TripPlanFileUploadTile({
//     super.key,
//     required this.state,
//     this.onChanged,
//     this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ref.listen(fileUploadProvider(state), (previous, next) {
//       if (previous == next) return;
//       next.maybeWhen(
//           orElse: () {},
//           completed: (id, file, fileName, url) {
//             onChanged?.call(next);
//           },
//           failed: (id, file, error, stackTrace) {
//             onChanged?.call(next);
//           });
//     });

//     return state.when(processing: (_, file) {
//       return ListTile(
//         dense: true,
//         contentPadding: EdgeInsets.zero,
//         leading: const SizedBox(
//             width: 20, height: 20, child: CircularProgressIndicator.adaptive()),
//         horizontalTitleGap: 0,
//         title: Text(file.fileName),
//       );
//     }, completed: (_, file, fileName, __) {
//       return ListTile(
//         dense: true,
//         contentPadding: EdgeInsets.zero,
//         leading: Container(
//           width: 20,
//           height: 20,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.green,
//           ),
//           child: const Icon(
//             Icons.done,
//             color: Colors.white,
//             size: 16,
//           ),
//         ),
//         horizontalTitleGap: 0,
//         title: Text(fileName ?? file?.fileName ?? '-'),
//         trailing: IconButton(
//           onPressed: onRemove,
//           icon: const Icon(Icons.close),
//           style: IconButton.styleFrom(foregroundColor: Colors.red),
//         ),
//       );
//     }, failed: (id, file, __, ____) {
//       return ListTile(
//         dense: true,
//         horizontalTitleGap: 0,
//         contentPadding: EdgeInsets.zero,
//         leading: Container(
//           width: 20,
//           height: 20,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.red,
//           ),
//           child: const Icon(
//             Icons.close,
//             color: Colors.white,
//             size: 16,
//           ),
//         ),
//         trailing: TextButton(
//           onPressed: () {
//             onChanged?.call(UploadState.processing(id, file));
//           },
//           style: TextButton.styleFrom(
//             foregroundColor: kPrimaryColor,
//             textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
//                   fontWeight: FontWeight.w400,
//                 ),
//           ),
//           child: const Text("อัพโหลดใหม่"),
//         ),
//         title: Text(file.fileName),
//       );
//     });
//   }
// }
