
// class SignUpProvider {
//   Future createUser({
//     required String lastName,
//     required String firstName,
//     required String patronyMic,
//     required String userName,
//     required String password,
//   }) async {
//     try {
//       ApiRequester requester = ApiRequester();
//       Response response = await requester.toPost('/auth/create_user/', body: {
//         "last_name": lastName,
//         "first_name": firstName,
//         "patronymic": patronyMic,
//         "username": userName,
//         "password": password,
//       });
//       if (response.statusCode! >= 200 && response.statusCode! < 300) {
//         log(response.data.toString());
//       } else {
//         print("!");
//         throw CatchException.convertException(response);
//       }
//     } catch (e) {
//       print(e);
//       throw CatchException.convertException(e);
//     }
//   }

//    Future LogIn({
//     required String login,
//     required String userpassword,
//   }) async {
//     try {
//       ApiRequester requester = ApiRequester();
//       Response response = await requester.toPost('/auth/token/login/', body: {
//         "password": userpassword,
//         "username": login,
//       });
//       if (response.statusCode! >= 200 && response.statusCode! < 300) {
//         print(response.data.toString());
//           var box =  Hive.box('tokenBox');
//            box.put('token', "Token ${response.data['auth_token']}",);
//         // Constatns.token = response.data['auth_token'];
//         print( 'Constatns.token === ${ Constatns.token}');
//       } else {
//         print("!");
//         throw CatchException.convertException(response);
//       }
//     } catch (e) {
//       throw CatchException.convertException(e);
//     }
//   }

// }