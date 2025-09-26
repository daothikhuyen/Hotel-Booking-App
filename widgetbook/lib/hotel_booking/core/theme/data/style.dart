import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:widgetbook_hotel_booking_app/hotel_booking/core/theme/model/text_style_group.dart';
import 'package:widgetbook_hotel_booking_app/hotel_booking/core/theme/model/text_style_preview.dart';

final fonts = [
  TextStyleGroup('Font Styles', [
    TextStylePreview('Heading1', 'Bold / 32px', HBTextStyles.headingOne),
    TextStylePreview('Heading2', 'Bold / 28px', HBTextStyles.headingTwo),
    TextStylePreview('Heading3', 'Bold / 24px', HBTextStyles.headingThree),
    TextStylePreview('Big Title', 'Bold / 18px', HBTextStyles.bigTitle),
    TextStylePreview('Caption', 'Regular / 16px', HBTextStyles.caption),
    TextStylePreview('Big Button', 'Bold / 14px', HBTextStyles.bigButton),
    TextStylePreview('Title', ' Bold / 16px', HBTextStyles.title),
    TextStylePreview('Small Button', 'Semibold / 12px', HBTextStyles.smallButton),
    TextStylePreview('Small Text', 'Regular / 12px', HBTextStyles.smallText),
    TextStylePreview('Paragraph', ' Regular / 14px', HBTextStyles.paragraph),
  ]),

  TextStyleGroup('Body', [
    TextStylePreview('Body large', 'Semibold / 18px', HBTextStyles.bodySemiboldLarge),
    TextStylePreview('Body Medium', 'Semibold / 16px', HBTextStyles.bodySemiboldMedium),
    TextStylePreview('Body Small', 'Semibold / 14px', HBTextStyles.bodySemiboldSmall),
    TextStylePreview('Body XSmall', 'Semibold / 12px', HBTextStyles.bodySemiboldXSmall),
    TextStylePreview('Body large', 'Medium / 18px', HBTextStyles.bodyMediumLarge),
    TextStylePreview('Body Medium', 'Medium / 16px', HBTextStyles.bodyMediumMedium),
    TextStylePreview('Body Small', 'Medium / 14px', HBTextStyles.bodyMediumSmall),
    TextStylePreview('Body XSmall', 'Medium / 12px', HBTextStyles.bodyMediumXSmall),
    TextStylePreview('Body large', 'Regular / 18px', HBTextStyles.bodyRegularLarge),
    TextStylePreview('Body Medium', 'Regular / 16px', HBTextStyles.bodyRegularMedium),
    TextStylePreview('Body Small', 'Regular / 14px', HBTextStyles.bodyRegularSmall),
    TextStylePreview('Body XSmall', 'Regular / 12px', HBTextStyles.bodyRegularXSmall),
  ]),
];