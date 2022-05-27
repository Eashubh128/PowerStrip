import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:users_app/models/direction_details_info.dart';
import 'package:users_app/models/user_model.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
DatabaseReference userref = FirebaseDatabase.instance.ref("users");
DatabaseReference userref2 =
    FirebaseDatabase.instance.ref().child('users/${currentFirebaseUser!.uid}');
UserModel? userModelCurrentInfo;
List dList = []; //online-active drivers Information List
DirectionDetailsInfo? tripDirectionDetailsInfo;
String? chosenDriverId = "";
String cloudMessagingServerToken =
    "key=AAAAYYa07Uk:APA91bHrCuvf23vsAp_rmtcUFbZ6BXIZH4P997PXkVYr2azjnYft-GNIYivX3bPBkfyvV37S6KWBqTyroNq_9uOb1U0pBvzs19ahXAaCXgCDpkFzYxa0ES3DwLTUOm0rFKnjzD361XdU";
String userDropOffAddress = "";
String driverCarDetails = "";
String driverName = "";
String driverPhone = "";
double countRatingStars = 0.0;
String titleStarsRating = "";
