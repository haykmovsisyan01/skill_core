import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_core/config/utils.dart';
import 'package:skill_core/presentation/providers/auth_provider.dart';
import 'package:skill_core/presentation/widgets/sc_button.dart';
import 'package:skill_core/presentation/widgets/sc_text.dart';
import 'package:skill_core/presentation/widgets/sc_text_field.dart';

class PasswordResetPage extends ConsumerStatefulWidget {
  const PasswordResetPage({super.key});

  @override
  ConsumerState<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends ConsumerState<PasswordResetPage> {
  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ScText('Reset password', fontSize: 30),
            ScText('Please write your account email address'),
            Form(
              key: _formKey,
              child: ScTextField(
                controller: controller,
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
                padding: EdgeInsets.all(10),
              ),
            ),
            ScButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ref
                      .read(authNotifierProvider.notifier)
                      .sendPasswordResetEmail(controller.text.trim());
                }
              },
              child: ScText('Send message'),
            ),
          ],
        ),
      ),
    );
  }
}
