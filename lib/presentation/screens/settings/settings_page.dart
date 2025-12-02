import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_core/data/models/user_model.dart';
import 'package:skill_core/presentation/providers/user_provider.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';
import 'package:skill_core/presentation/widgets/sc_text_field.dart';

import '../../../config/utils.dart';
import '../../providers/auth_provider.dart';
import '../../providers/bloc/settings/settings_bloc.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  final FocusNode nameNode = FocusNode();
  final FocusNode surnameNode = FocusNode();

  bool editMode = false;

  late bool isLightTheme;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userNotifierProvider.notifier).updateCurrentUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppUser? user = ref.watch(appUserState);
    final settingsBloc = context.watch<SettingsBloc>();

    isLightTheme = settingsBloc.theme == 'light';
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Icon(Icons.account_box, size: 100),
              ScText(user?.name ?? 'No user name', fontSize: 20),
              ScText(user?.surname ?? 'No user surname', fontSize: 20),
              ScText(user?.email ?? 'No user email', fontSize: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScText('Edit mode'),
                  Checkbox(
                    value: editMode,
                    onChanged: (_) {
                      setState(() {
                        editMode = !editMode;
                        nameController.clear();
                        surnameController.clear();
                      });
                    },
                  ),
                ],
              ),
              editMode
                  ? Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          ScTextField(
                            hintText: 'Name',
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            focusNode: nameNode,
                            controller: nameController,
                            validator: validateNameAndSurname,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(surnameNode);
                            },
                          ),
                          ScTextField(
                            hintText: 'Surname',
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            focusNode: surnameNode,
                            controller: surnameController,
                            validator: validateNameAndSurname,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          ScButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ref
                                    .read(userNotifierProvider.notifier)
                                    .changeUserOptions(
                                      nameController.text.trim(),
                                      surnameController.text.trim(),
                                    );
                              }
                            },
                            child: ScText('Send'),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScText('Dark'),
                      Switch(
                        value: isLightTheme,
                        onChanged: (value) {
                          setState(() {
                            isLightTheme = !isLightTheme;
                            print(isLightTheme);
                            context.read<SettingsBloc>().add(
                              SettingsChangeThemeEvent(
                                isLightTheme ? 'light' : 'dark',
                              ),
                            );
                          });
                        },
                      ),
                      ScText('Light'),
                    ],
                  );
                },
              ),
              ScButton(
                onPressed: () {
                  ref.read(authNotifierProvider.notifier).signOut();
                },
                child: ScText('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
