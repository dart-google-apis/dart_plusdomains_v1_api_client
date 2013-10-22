library plusdomains_v1_api.browser;

import "package:google_oauth2_client/google_oauth2_browser.dart" as oauth;

import 'package:google_plusdomains_v1_api/src/browser_client.dart';
import "package:google_plusdomains_v1_api/plusdomains_v1_api_client.dart";

/** The Google+ API enables developers to build on top of the Google+ platform. */
class PlusDomains extends Client with BrowserClient {

  /** OAuth Scope2: View your circles and the people and pages in them */
  static const String PLUS_CIRCLES_READ_SCOPE = "https://www.googleapis.com/auth/plus.circles.read";

  /** OAuth Scope2: Manage your circles and add people and pages, who will be notified and may appear on your public Google+ profile */
  static const String PLUS_CIRCLES_WRITE_SCOPE = "https://www.googleapis.com/auth/plus.circles.write";

  /** OAuth Scope2: Know your basic profile info and list of people in your circles. */
  static const String PLUS_LOGIN_SCOPE = "https://www.googleapis.com/auth/plus.login";

  /** OAuth Scope2: Know who you are on Google */
  static const String PLUS_ME_SCOPE = "https://www.googleapis.com/auth/plus.me";

  /** OAuth Scope2: Send your photos and videos to Google+ */
  static const String PLUS_MEDIA_UPLOAD_SCOPE = "https://www.googleapis.com/auth/plus.media.upload";

  /** OAuth Scope2: View your own Google+ profile and profiles visible to you */
  static const String PLUS_PROFILES_READ_SCOPE = "https://www.googleapis.com/auth/plus.profiles.read";

  /** OAuth Scope2: View your Google+ posts, comments, and stream */
  static const String PLUS_STREAM_READ_SCOPE = "https://www.googleapis.com/auth/plus.stream.read";

  /** OAuth Scope2: Manage your Google+ posts, comments, and stream */
  static const String PLUS_STREAM_WRITE_SCOPE = "https://www.googleapis.com/auth/plus.stream.write";

  final oauth.OAuth2 auth;

  PlusDomains([oauth.OAuth2 this.auth]);
}
