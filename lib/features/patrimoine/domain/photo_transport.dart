import 'dart:typed_data';

/// Un fichier à envoyer via [PatrimoineRepository.uploadPhoto] — abstraction
/// Dio-libre (domain/ ne connaît pas `MultipartFile`, voir CLAUDE.md 2.6) :
/// `PatrimoineRepositoryImpl` se charge de la conversion en `MultipartFile`.
class PhotoAEnvoyer {
  const PhotoAEnvoyer({required this.bytes, required this.nomFichier, this.mimeType});

  final Uint8List bytes;
  final String nomFichier;
  final String? mimeType;
}

/// Contenu binaire d'un fichier de photo, retourné par
/// [PatrimoineRepository.getPhotoFichierContent] — confirmé par la doc
/// Seven (2026-09-15, §6) : le serveur proxifie le binaire directement,
/// avec le `Content-Type` stocké à l'upload (ou `application/octet-stream`).
class FichierBinaire {
  const FichierBinaire({required this.bytes, required this.contentType});

  final Uint8List bytes;
  final String contentType;
}
