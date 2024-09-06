import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Home/Cubit/RegistrationRequestStateCubit/ShowRegistrationRequestStateCubit.dart';
import 'package:scope_parent/Features/Home/Data/Repo/LogoutServices.dart';
import 'package:scope_parent/Features/Home/Presentation/GoogleMapView.dart';
import 'package:scope_parent/Features/Home/Presentation/ProfileEditView.dart';
import 'package:scope_parent/Features/RegistrationRequest/Presentation/AddRegistrationRequestView.dart';
import 'package:scope_parent/translations/locale_keys.g.dart';
import '../../../Core/Widgets/TextWidget.dart';
import '../../../main.dart';
import '../Cubit/ShowProfileCubit/ShowProfileCubit.dart';
import 'ShowRegistrationRequestStateView.dart';

class  SettingView extends StatelessWidget {
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          BlocBuilder<ShowProfileCubit,ShowProfileState>(
              builder:(context,state){
                if(state is ShowProfileLoading){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(state is ShowProfileSuccess){
                  String imageUrl = "http://" + ipServer + ":8000" + state.profileUserModel.image;
                  print("http://$ipServer:8000/${state.profileUserModel.image}");
                  return UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child:Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:  NetworkImage(
                                "http://$ipServer:8000/${state.profileUserModel.image}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color:Color(0xFF3B3D6D) ,
                    ),
                    accountName: TextWidget(
                      text:"${state.profileUserModel.firstName+" "+state.profileUserModel.lastName}",
                      color:const Color(0xFF7DA4FF),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Outfit",
                    ),
                    accountEmail:TextWidget(
                      text:"${state.profileUserModel.email}",
                      color:const Color(0xFF7DA4FF),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Outfit",
                    ),
                  );
                }
                else if(state is ShowProfileFailure){
                  return Center(
                    child:TextWidget(
                      text:state.errorMessage,
                      color:const Color(0xFF7DA4FF),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Outfit",
                    ),
                  );
                }
                else{
                  return Center(
                    child:TextWidget(
                      text:"You Dot Have An Account !",
                      color:const Color(0xFF7DA4FF),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Outfit",
                    ),
                  );
                }
              }),
          ListTile(
            leading: const Icon(Icons.add,color:Color(0xFFAC8FCF)),
            title: TextWidget(
              text:LocaleKeys.Add_Registration_Request.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(BuildContext context){
                    return AddRegistrationRequestView();
                  }),);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit,color:Color(0xFFAC8FCF)),
            title: TextWidget(
              text:LocaleKeys.Edit_My_Profile.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(BuildContext context){
                    return ProfileEditView();
                  }),);
            },
          ),
          ListTile(
            leading: const Icon(Icons.maps_ugc_outlined,color:Color(0xFFAC8FCF)),
            title: TextWidget(
              text:LocaleKeys.Google_Map.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(BuildContext context){
                    return GoogleMapView();
                  }),);

            },
          ),
          ListTile(
            leading: const Icon(Icons.language,color:Color(0xFFAC8FCF)),
            title: TextWidget(
              text:"English",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
            onTap: ()async{
              await context.setLocale(const Locale('en'));
            },
          ),
          ListTile(
            leading: const Icon(Icons.language,color:Color(0xFFAC8FCF)),
            title: TextWidget(
              text:"العربية",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
            onTap: ()async{
              await context.setLocale(const Locale('ar'));
            },
          ),
          ListTile(
            leading: const Icon(Icons.display_settings_sharp,color:Color(0xFFAC8FCF)),
            title: TextWidget(
              text: "Show Registration Request State",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
            onTap: ()async{
              BlocProvider.of<ShowRegistrationRequestStateCubit>(context).showRegistrationRequestStateServices(
                accessToken:BlocProvider.of<ShowRegistrationRequestStateCubit>(context).accessToken,
              );
              Navigator.push(context, MaterialPageRoute(
                  builder:(BuildContext context){
                    return ShowRegistrationRequestStateView();
                  }),);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout,color:Color(0xFFAC8FCF)),
            title: TextWidget(
              text:LocaleKeys.Logout.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
            onTap: ()async{
              try{
                Map<String,dynamic>logout=await LogoutServices().logoutServices(
                  accessToken: BlocProvider.of<ShowProfileCubit>(context).accessToken,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(logout["message"]),
                  ),
                );
                Navigator.pop(context);
                Navigator.pop(context);
              }
              catch(e){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString()),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
