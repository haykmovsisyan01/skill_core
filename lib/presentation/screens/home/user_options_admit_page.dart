import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_core/presentation/routes.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';

import '../../../config/utils.dart';
import '../../providers/user_provider.dart';
import '../../widgets/sc_button.dart';
import '../../widgets/sc_text_field.dart';

class UserOptionsAdmitPage extends ConsumerStatefulWidget {
  const UserOptionsAdmitPage({super.key});

  @override
  ConsumerState createState() => _UserOptionsAdmitPageState();
}

class _UserOptionsAdmitPageState extends ConsumerState<UserOptionsAdmitPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode surnameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ScText('Please write your name and surname', fontSize: 30),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  ScTextField(
                    hintText: 'Name',
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    focusNode: nameFocusNode,
                    controller: nameController,
                    validator: validateNameAndSurname,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(surnameFocusNode);
                    },
                  ),
                  ScTextField(
                    hintText: 'Surname',
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    focusNode: surnameFocusNode,
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
                        context.go(homeRoute);
                      }
                    },
                    child: ScText('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
