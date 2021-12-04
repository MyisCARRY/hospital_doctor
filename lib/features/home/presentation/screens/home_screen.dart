import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/core/presentation/appbars/title_appbar.dart';
import 'package:hospital_doctor/core/presentation/buttons/add_f_a_b.dart';
import 'package:hospital_doctor/core/presentation/widgets/custom_empty_screen.dart';
import 'package:hospital_doctor/core/presentation/widgets/custom_error_widget.dart';
import 'package:hospital_doctor/core/presentation/widgets/custom_loading_widget.dart';
import 'package:hospital_doctor/core/style/colors.dart';
import 'package:hospital_doctor/features/home/presentation/blocs/patients_list_bloc/patients_list_bloc.dart';
import 'package:hospital_doctor/features/home/presentation/screens/new_patient_screen.dart';
import 'package:hospital_doctor/features/home/presentation/widgets/patients_list.dart';
import 'package:hospital_doctor/injection_container.dart';

class HomeScreen extends StatefulWidget with NavigatedScreen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  @override
  String get routeName => 'home_screen';
}

class _HomeScreenState extends State<HomeScreen> {
  late final PatientsListBloc _patientsListBloc;

  @override
  void initState() {
    _patientsListBloc = sl();
    _patientsListBloc.add(PatientsListEvent.load());

    super.initState();
  }

  @override
  void dispose() {
    _patientsListBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      floatingActionButton: AddFAB(
        onTap: () => const NewPatientScreen().addScreen(context),
      ),
      appBar: TitleAppBar(
        context,
        title: "Patients list",
        showLeading: false,
      ),
      body: BlocBuilder(
        bloc: _patientsListBloc,
        builder: (BuildContext context, PatientsListState state) {
          return state.map(
            loading: (state) => const CustomLoadingWidget(),
            error: (state) => CustomErrorWidget(onRefresh: () => _patientsListBloc.add(PatientsListEvent.load())),
            empty: (state) => const CustomEmptyWidget(text: 'You have no patients yet'),
            data: (state) => PatientsList(patients: state.patients),
          );
        },
      ),
    );
  }
}
