enum AppEnvironment { dev, prod }

enum RepositoryMode { onlineFirst, offlineFirst }

enum BookingMode { bulk, single }

enum ProductTypes { Event, Activity }

enum ProductSteps { Overview, Products, Sales, Expenses, Goals }

enum AppContext { dev, prod, test }

enum APIMethods { POST, GET, PUT, PATCH, DELETE }

enum AnalyticsEventType {
  NAVIGATION,
  AUTH,
  ONBOARDING,
}

enum SignInMethod { EMAIL, GOOGLE }

enum WorkflowState { CREATE, VIEW }

enum UploadMediaType { PHOTO, VIDEO }

enum ProductStatus {
  all,
  draft,
  review,
  published,
  deactivated,
  reviewedNeedsChanges,
  rejected,
  invalidated,
}

extension ProductStatusExtension on ProductStatus {
  String get displayName {
    switch (this) {
      case ProductStatus.draft:
        return 'Draft';
      case ProductStatus.review:
        return 'In Review';
      case ProductStatus.published:
        return 'Published';
      case ProductStatus.deactivated:
        return 'Deactivated';
      case ProductStatus.reviewedNeedsChanges:
        return 'Reviewed (Needs Changes)';
      case ProductStatus.rejected:
        return 'Rejected';
      case ProductStatus.invalidated:
        return 'Invalidated';
      case ProductStatus.all:
        return 'All';
    }
  }

  String get apiValue {
    switch (this) {
      case ProductStatus.draft:
        return 'DRAFT';
      case ProductStatus.review:
        return 'REVIEW';
      case ProductStatus.published:
        return 'PUBLISHED';
      case ProductStatus.deactivated:
        return 'DEACTIVATED';
      case ProductStatus.reviewedNeedsChanges:
        return 'REVIEWED_NEEDS_CHANGES';
      case ProductStatus.rejected:
        return 'REJECTED';
      case ProductStatus.invalidated:
        return 'INVALIDATED';
      case ProductStatus.all:
        return '';
    }
  }
}

enum BookingStatus { pending, confirmed, canceled, completed, expired }
