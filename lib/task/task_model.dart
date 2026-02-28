import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'task_widget.dart' show TaskWidget;
import 'package:flutter/material.dart';

class TaskModel extends FlutterFlowModel<TaskWidget> {
  ///  Local state fields for this page.

  String quote = 'Loading...';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ZenQuotesRandom)] action in task widget.
  ApiCallResponse? apiResult4u9;
  // Stores action output result for [Backend Call - API (ZenQuotesRandom)] action in Button widget.
  ApiCallResponse? apiResulttur;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
