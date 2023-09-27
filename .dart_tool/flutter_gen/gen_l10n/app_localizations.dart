import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_pa.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('pa')
  ];

  /// No description provided for @welcome_message.
  ///
  /// In en, this message translates to:
  /// **'Mooofarm, Dairy ka kaam asaan kare'**
  String get welcome_message;

  /// No description provided for @continue_button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_button;

  /// No description provided for @login_page_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Mooofarm'**
  String get login_page_welcome;

  /// No description provided for @enter_Farmer_ID.
  ///
  /// In en, this message translates to:
  /// **'Enter Farmer ID'**
  String get enter_Farmer_ID;

  /// No description provided for @enter_password.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enter_password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @enter_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Name'**
  String get enter_name;

  /// No description provided for @set_farmer_id.
  ///
  /// In en, this message translates to:
  /// **'Set User ID/Farmer ID'**
  String get set_farmer_id;

  /// No description provided for @set_Password.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get set_Password;

  /// No description provided for @re_enter_passwd.
  ///
  /// In en, this message translates to:
  /// **'Re-enter Password'**
  String get re_enter_passwd;

  /// No description provided for @forget_passwd.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forget_passwd;

  /// No description provided for @cow_id.
  ///
  /// In en, this message translates to:
  /// **'Cow ID'**
  String get cow_id;

  /// No description provided for @click_here.
  ///
  /// In en, this message translates to:
  /// **'Click Here'**
  String get click_here;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @select_start_epoch.
  ///
  /// In en, this message translates to:
  /// **'Select start date & time'**
  String get select_start_epoch;

  /// No description provided for @select_end_epoch.
  ///
  /// In en, this message translates to:
  /// **'Select end date & time'**
  String get select_end_epoch;

  /// No description provided for @cow_activity_data.
  ///
  /// In en, this message translates to:
  /// **'Cow Activity Data'**
  String get cow_activity_data;

  /// No description provided for @start_timestamp.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get start_timestamp;

  /// No description provided for @end_timestamp.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get end_timestamp;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @fetched_data.
  ///
  /// In en, this message translates to:
  /// **'Fetched Data'**
  String get fetched_data;

  /// No description provided for @my_cows.
  ///
  /// In en, this message translates to:
  /// **'MY ALL COWS'**
  String get my_cows;

  /// No description provided for @page.
  ///
  /// In en, this message translates to:
  /// **'Page'**
  String get page;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi', 'pa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
    case 'pa': return AppLocalizationsPa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
