part of '../home_view.dart';

class _ActiveChip extends StatelessWidget {
  const _ActiveChip();

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        'label active',
        style: context.textTheme.bodySmall?.copyWith(
          color: ColorConstants.white,
        ),
      ),
      backgroundColor: ColorConstants.purplePrimary,
      padding: context.paddingLow,
    );
  }
}

class _PassiveChip extends StatelessWidget {
  const _PassiveChip();

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        'label passive',
        style: context.textTheme.bodySmall?.copyWith(
          color: ColorConstants.grayPrimary,
        ),
      ),
      backgroundColor: ColorConstants.grayLighter,
      padding: context.paddingLow,
    );
  }
}
