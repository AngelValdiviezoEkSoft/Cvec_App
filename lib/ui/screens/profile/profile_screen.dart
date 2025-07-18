import 'package:cve_app/config/config.dart';
import 'package:cve_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(locGen!.myProfileLbl),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(context, size),
            const SizedBox(height: 20),
            _buildOptionCard(context),
            const SizedBox(height: 20),
            Text(locGen!.moreLbl, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildAdditionalOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, Size size) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: Colors.grey),
          ),
          SizedBox(width: size.width * 0.035),//16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                const  Text(
                  'Duran City - Etapa Bromelia, MZ14-V13\nPropietario',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.push(objRutas.rutaFrmProfileScrn);
            },
            child: const Icon(Icons.edit, color: Colors.white)
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        children: [
          _buildListTile(context, Icons.lock, locGen!.chngPasswLbl),//'Cambiar contraseña'),
          const Divider(height: 1),
          _buildListTile(context, Icons.settings, locGen!.settingLbl),//'Configuración'),
        ],
      ),
    );
  }

  Widget _buildAdditionalOptions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        children: [
          _buildListTile(context, Icons.privacy_tip, locGen!.privPolLbl),//'Política de privacidad'),
          const Divider(height: 1),
          _buildListTile(context, Icons.description, locGen!.termCondLbl),//'Términos y condiciones'),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        
        if(title == locGen!.chngPasswLbl){
          context.push(objRutas.rutaContrasenaScreen);
        }

        if(title == locGen!.settingLbl){
          context.push(objRutas.rutaSettingUserScrn);
        }

        if(title == locGen!.privPolLbl){
          //context.push(objRutas.rutaSettingUserScrn);
        }

        if(title == locGen!.termCondLbl){
          //context.push(objRutas.rutaSettingUserScrn);
        }

      },
    );
  }
}
