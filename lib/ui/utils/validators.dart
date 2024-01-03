import 'package:form_field_validator/form_field_validator.dart';

final mobileValidators = MultiValidator([
  RequiredValidator(errorText: "Please enter mobile number"),
  MinLengthValidator(10, errorText: "Please enter valid mobile number"),
]);
final verificationValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter verification code'),
  MinLengthValidator(4, errorText: 'Please enter valid verification code'),
]);
final businessNameValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter business name'),
  MinLengthValidator(3,
      errorText: 'Please enter at least 3 characters for business name'),
]);
final firstNameValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter first name'),
  MinLengthValidator(3,
      errorText: 'Please enter at least 3 characters for first name'),
]);
final lastNameValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter last name'),
  MinLengthValidator(3,
      errorText: 'Please enter at least 3 characters for last name'),
]);
final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter email'),
  EmailValidator(errorText: 'Please enter valid email'),
]);
final pinCodeValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter zip code'),
  MinLengthValidator(6, errorText: 'Please enter valid zip code'),
]);
final mobileValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter mobile'),
  MinLengthValidator(10, errorText: 'Please enter valid mobile number'),
]);
final addressValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter address'),
  MinLengthValidator(3, errorText: 'Please enter valid address'),
]);
final unitValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter unit'),
  MinLengthValidator(10, errorText: 'Please enter valid unit'),
]);
final cityValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter city'),
  MinLengthValidator(3, errorText: 'Please enter valid city'),
]);
final stateValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter state'),
  MinLengthValidator(3, errorText: 'Please enter valid state'),
]);
final zipCodeValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter zip code'),
  MinLengthValidator(6, errorText: 'Please enter valid zip code'),
]);
final deliveryValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter delivery instruction'),
  MinLengthValidator(3, errorText: 'Please enter valid delivery instruction'),
]);
final cardHolderNameValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter name'),
  MinLengthValidator(3, errorText: 'Please enter valid name'),
]);
final cardNumberValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter  number'),
  MinLengthValidator(19, errorText: 'Please enter valid number'),
]);
final cardExpireDateValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter date'),
  MinLengthValidator(6, errorText: 'Please enter valid date'),
]);
final cardCVVNumberValidator = MultiValidator([
  RequiredValidator(errorText: 'Enter cvv'),
  MinLengthValidator(3, errorText: 'Enter cvv'),
]);
final descriptionValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter description'),
  MinLengthValidator(3, errorText: 'Please enter valid description'),
]);
