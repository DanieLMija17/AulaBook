import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF3F8FE),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.help_outline, color: Color(0xFFB8B8B8)),
            onPressed: () async {
              // Solicitar permisos de almacenamiento
              var status = await Permission.storage.request();
              if (status.isGranted) {
                await _downloadPDF();
              } else if (status.isDenied) {
                // Mostrar mensaje al usuario de que necesita conceder el permiso
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Es necesario otorgar permiso de almacenamiento para descargar el PDF.'),
                    action: SnackBarAction(
                      label: 'Aceptar',
                      onPressed: () {
                        // Abrir la configuración de la aplicación para que el usuario pueda otorgar el permiso manualmente
                        openAppSettings();
                      },
                    ),
                  ),
                );
              } else {
                // Manejar otros casos como permiso denegado permanentemente
                print('Permiso de almacenamiento no otorgado');
              }
            },
            iconSize: 24,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minHeight: 40,
              minWidth: 40,
            ),
            splashRadius: 24,
          ),
        ),
      ),
    );
  }

  Future<void> _downloadPDF() async {
    try {
      Dio dio = Dio();
      String url = 'https://drive.google.com/file/d/1gj2FQgTNVe5N0UVIMl2GXh8JeuWLtK-r/view';
      var dir = await getExternalStorageDirectory();

      if (dir != null) {
        String savePath = '${dir.path}/your-pdf.pdf';
        await dio.download(url, savePath);
        print('Archivo PDF descargado en: $savePath');
      } else {
        print('No se pudo obtener el directorio de almacenamiento');
      }
    } catch (e) {
      print('Error al descargar el PDF: $e');
    }
  }
}

