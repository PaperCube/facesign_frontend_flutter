import 'package:isar/isar.dart';

part 'sign_record.g.dart';

@Collection()
class SignRecord {
  Id id = Isar.autoIncrement;

  @Index(unique: false)
  String? uid;
  DateTime? dateTimeSignIn;
  DateTime? dateTimeSignOut;
}

// enum SignEventType {
//   unspecified(0),
//   signIn(1), 
//   signOut(-1);

//   const SignEventType(this.signType);

//   final int signType;
// }