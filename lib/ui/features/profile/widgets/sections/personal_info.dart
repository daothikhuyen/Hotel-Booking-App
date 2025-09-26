import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/data/repositories/api_status.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/loading_overlay.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/core/widgets/textfield.dart';
import 'package:hotel_booking_app/ui/features/auth/view_model/auth_controller.dart';
import 'package:hotel_booking_app/utils/validator.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final loadingOverlay = LoadingOverlay();
  final snackBar = HBSnackBar();
  final _formKey = GlobalKey<FormState>();
  final _displayName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _location = TextEditingController();

  @override
  void initState() {
    super.initState();

    final userProvider = Provider.of<AuthController>(context, listen: false);
    final user = userProvider.currentUser;
    _displayName.text = user?.displayName ?? '';
    _lastName.text = user?.displayName ?? '';
    _email.text = user?.email ?? '';
    _phone.text = user?.numberPhone ?? '';
    _location.text = user?.location ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthController>(context);

    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.personalInfo,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.pop(),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.displayName,
                style: HBTextStyles.bodySemiboldMedium(
                  context.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 10),
              HBTextField(
                controller: _displayName,
                hintText: 'Khuyen',
                color: context.colorScheme.outline.withValues(alpha: 0.5),
                validator: (v) => validateText(context, v),
              ),
              const SizedBox(height: 18),
              Text(
                context.l10n.emailAddress,
                style: HBTextStyles.bodySemiboldMedium(
                  context.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 10),
              HBTextField(
                controller: _email,
                hintText: 'daothikhuyen@gmail.com',
                color: context.colorScheme.outline.withValues(alpha: 0.5),
                validator: (v) => validateEmail(context, v),
                enabled: false,
              ),
              const SizedBox(height: 18),
              Text(
                context.l10n.phone,
                style: HBTextStyles.bodySemiboldMedium(
                  context.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 10),
              HBTextField(
                controller: _phone,
                hintText: '+8434007663',
                color: context.colorScheme.outline.withValues(alpha: 0.5),
                validator: (v) => validateNumberPhone(context, v),
              ),
              const SizedBox(height: 18),
              Text(
                context.l10n.location,
                style: HBTextStyles.bodySemiboldMedium(
                  context.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 10),
              HBTextField(
                controller: _location,
                hintText: 'San Diego, CA',
                color: context.colorScheme.outline.withValues(alpha: 0.5),
                validator: (v) => validateText(context, v),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: PrimaryBtn(
                  textButton: context.l10n.saveChanges,
                  onPressed: () async {
                    try {
                      loadingOverlay.showLoading(context);
                      final result = await userProvider.updateProfile(
                        context: context,
                        displayName: _displayName.text,
                        phone: _phone.text,
                        location: _location.text,
                        formKey: _formKey,
                      );

                      if (result.status == ApiStatus.success) {
                        userProvider.setUser(result.data);
                      }
                      snackBar.showSnackBar(context, result.message);
                    } finally {
                      context.pop();
                    }
                  },
                  bold: true,
                  size: 56,
                  isSelected: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
