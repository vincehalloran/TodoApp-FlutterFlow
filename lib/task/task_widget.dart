import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_task_widget.dart';
import '/components/tasks_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'task_model.dart';
export 'task_model.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  static String routeName = 'task';
  static String routePath = '/task';

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late TaskModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: AddTaskWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: Color(0xFF3994EF),
          elevation: 0.0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: FlutterFlowTheme.of(context).tertiary,
                width: 1.0,
              ),
            ),
            child: Icon(
              Icons.add_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Tasks',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<List<TasksRecord>>(
                  stream: queryTasksRecord(
                    queryBuilder: (tasksRecord) => tasksRecord
                        .where(
                          'user',
                          isEqualTo: currentUserReference,
                        )
                        .where(
                          'completed',
                          isEqualTo: false,
                        ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<TasksRecord> listViewTasksRecordList = snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewTasksRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewTasksRecord =
                            listViewTasksRecordList[listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              DetailsWidget.routeName,
                              queryParameters: {
                                'taskdoc': serializeParam(
                                  listViewTasksRecord,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'taskdoc': listViewTasksRecord,
                              },
                            );

                            await listViewTasksRecord.reference
                                .update(createTasksRecordData(
                              completed: true,
                            ));
                          },
                          child: TasksWidget(
                            key: Key(
                                'Keyuui_${listViewIndex}_of_${listViewTasksRecordList.length}'),
                            tasksDocument: listViewTasksRecord,
                            checkaction: () async {},
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
