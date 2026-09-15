import '../models/agent_model.dart';
import '../models/attribution_model.dart';
import '../models/campagne_historique_model.dart';
import '../models/campagne_model.dart';
import '../models/comptage_model.dart';
import '../models/entretien_model.dart';
import '../models/immobilisation_enums.dart';
import '../models/immobilisation_model.dart';
import '../models/photo_model.dart';
import '../models/site_model.dart';

/// Jeu de données fictif mais réaliste pour le module Patrimoine —
/// registre d'immobilisations, sites, campagne d'inventaire en cours et
/// campagnes clôturées. Utilisé exclusivement par [PatrimoineRepositoryMock]
/// (voir CLAUDE.md section 2.6) ; aucun écran n'accède à ce fichier directement.
abstract final class PatrimoineMockData {
  static DateTime _d(String ddMmYyyy) {
    final p = ddMmYyyy.split('/');
    return DateTime(int.parse(p[2]), int.parse(p[1]), int.parse(p[0]));
  }

  static DateTime? _dOpt(String? ddMmYyyy) {
    if (ddMmYyyy == null || ddMmYyyy == '—') return null;
    return _d(ddMmYyyy);
  }

  static MethodeAmortissement _methode(String label) => switch (label) {
        'Linéaire' => MethodeAmortissement.lineaire,
        'Dégressif' => MethodeAmortissement.degressif,
        _ => MethodeAmortissement.nonAmortissable,
      };

  // ---------------------------------------------------------------------
  // Sites
  // ---------------------------------------------------------------------

  static final List<SiteModel> sites = [
    const SiteModel(id: 'lbv', code: 'lbv', nom: 'Siège Libreville', ville: 'Libreville', latitude: 0.4162, longitude: 9.4673),
    const SiteModel(id: 'owe', code: 'owe', nom: 'Entrepôt Owendo', ville: 'Owendo', latitude: 0.2870, longitude: 9.5030),
    const SiteModel(id: 'pog', code: 'pog', nom: 'Agence Port-Gentil', ville: 'Port-Gentil', latitude: -0.7193, longitude: 8.7815),
    const SiteModel(id: 'nkok', code: 'nkok', nom: 'Site industriel Nkok', ville: 'Nkok', latitude: 0.3167, longitude: 9.7167),
    const SiteModel(id: 'fcv', code: 'fcv', nom: 'Agence Franceville', ville: 'Franceville', latitude: -1.6333, longitude: 13.5833),
    const SiteModel(id: 'oye', code: 'oye', nom: 'Agence Oyem', ville: 'Oyem', latitude: 1.5993, longitude: 11.5793),
  ];

  // ---------------------------------------------------------------------
  // Agent connecté & campagne en cours
  // ---------------------------------------------------------------------

  static final AgentModel agentConnecte = const AgentModel(
    id: 'usr-cella',
    nom: 'C. Ella',
    role: "Agent d'inventaire · Services généraux",
    initiales: 'CE',
  );

  static final CampagneModel campagneEnCours = CampagneModel(
    id: 'INV-2026-02',
    reference: 'INV-2026-02',
    libelle: 'Inventaire physique général',
    dateDebut: _d('24/08/2026'),
    dateFin: _d('06/09/2026'),
    perimetre: 'Tous sites',
    statut: StatutCampagne.enCours,
    responsable: 'C. Ella',
  );

  static const List<String> affectatairesPossibles = [
    'J. Ndong — Informatique',
    'A. Mba — Logistique',
    'C. Ella — Services généraux',
    'M. Koumba — Commercial',
    'F. Moussavou — Informatique',
    'H. Ovono — Production',
    'R. Nzengue — Finance',
    'Direction générale',
    'Logistique — usage collectif',
    'Services généraux',
  ];

  static const Map<String, List<String>> locauxParSite = {
    'lbv': ['Étage 2 — reprographie', 'Étage 3 — DSI', 'Étage 4 — Commercial', 'Étage 5 — Direction', 'Salle serveurs — étage 3', 'Local technique — sous-sol', 'Boulevard Triomphal', 'Local de rebut'],
    'owe': ['Zone portuaire, lot 11', 'Zone portuaire, lot 14', 'Quai de chargement', 'Parc automobile', 'Magasin entrepôt'],
    'pog': ['Open space commercial', 'Bureau 03', 'Réserve agence'],
    'nkok': ['Atelier 1', 'Atelier 2', 'Zone économique spéciale', 'Magasin site'],
    'fcv': ['Toiture agence', 'Agence Franceville', 'Bureau direction'],
    'oye': ['Agence Oyem', 'Magasin agence — Oyem'],
  };

  // ---------------------------------------------------------------------
  // Immobilisations (registre)
  // ---------------------------------------------------------------------

  static final List<ImmobilisationModel> immobilisations = [
    ImmobilisationModel(
      id: 'IMMO-2020-0104', code: 'IMMO-2020-0104',
      designation: 'Bâtiment administratif — siège', categorie: 'Bâtiments', compteComptable: '2311',
      famille: FamilleImmobilisation.immobilier, siteId: 'lbv', local: 'Boulevard Triomphal',
      affectataire: 'Direction générale', statut: StatutBien.actif, etat: EtatBien.bon,
      fournisseur: 'BTP Estuaire', bonCommandeRef: 'BC-2020-0071', factureRef: 'FA-2020-1204',
      dateAcquisition: _d('12/03/2020'), valeurAcquisition: 1240000000,
      dateMiseService: _dOpt('01/07/2020'), dureeAmortissement: 20, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 381500000, dateDernierInventaire: _dOpt('28/02/2026'),
      entretiens: [
        EntretienModel(id: 'IMMO-2020-0104-ent-1', date: _d('14/08/2026'), titre: 'Réparation ascenseur', cout: 3200000, prestataire: 'Vertic Services', observation: "Charge — ACQ-2026-0165", bonCommandeRef: 'BC-2026-0341', bonLivraisonRef: 'BL-4590', factureRef: 'FA-2026-8977', dossierRef: 'ACQ-2026-0165', dureeIntervention: '1 jour', technicien: 'Équipe Vertic 2'),
        EntretienModel(id: 'IMMO-2020-0104-ent-2', date: _d('22/06/2026'), titre: 'Peinture façade', cout: 5400000, prestataire: 'BTP Estuaire', observation: "Charge d'entretien", bonCommandeRef: 'BC-2026-0281', bonLivraisonRef: 'BL-4342', factureRef: 'FA-2026-8744', dossierRef: 'ACQ-2026-0136', dureeIntervention: '12 jours', technicien: 'Chantier peinture'),
        EntretienModel(id: 'IMMO-2020-0104-ent-3', date: _d('09/01/2026'), titre: 'Contrôle électrique annuel', cout: 850000, prestataire: 'Élec Gabon', observation: 'Conforme', bonCommandeRef: 'BC-2026-0102', bonLivraisonRef: 'BL-4120', factureRef: 'FA-2026-8210', dossierRef: 'ACQ-2026-0041', dureeIntervention: '1 jour', technicien: 'A. Loembe'),
      ],
      attributions: [
        AttributionModel(id: 'IMMO-2020-0104-att-1', date: _d('01/07/2020'), detenteur: 'Direction générale', lieu: 'Boulevard Triomphal', motif: 'Mise en service', acteReference: 'PV de réception'),
      ],
      photos: [
        PhotoModel(id: 'IMMO-2020-0104-ph-1', date: _d('22/06/2026'), titre: 'Façade après peinture', message: 'Reprise complète des deux façades sud et est, teinte conforme au nuancier.', auteur: 'C. Ella — Services généraux', nombreFichiers: 3),
        PhotoModel(id: 'IMMO-2020-0104-ph-2', date: _d('09/01/2026'), titre: 'Tableau électrique — contrôle annuel', message: 'Photos prises lors du contrôle de conformité, aucune anomalie relevée.', auteur: 'Élec Gabon', nombreFichiers: 2),
        PhotoModel(id: 'IMMO-2020-0104-ph-3', date: _d('01/07/2020'), titre: 'Réception du bâtiment', message: 'État initial au procès-verbal de réception.', auteur: 'Commission de réception', nombreFichiers: 4),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2026-0740', code: 'IMMO-2026-0740',
      designation: 'Bâtiment administratif — Owendo', categorie: 'Bâtiments', compteComptable: '2311',
      famille: FamilleImmobilisation.immobilier, siteId: 'owe', local: 'Zone portuaire, lot 14',
      affectataire: 'Logistique', statut: StatutBien.actif, etat: EtatBien.neuf,
      fournisseur: 'BTP Estuaire', bonCommandeRef: 'BC-2026-0260', factureRef: 'FA-2026-8611',
      dateAcquisition: _d('18/05/2026'), valeurAcquisition: 410000000,
      dateMiseService: _dOpt('01/08/2026'), dureeAmortissement: 20, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 8541667, dateDernierInventaire: null,
      photos: [
        PhotoModel(id: 'IMMO-2026-0740-ph-1', date: _d('28/07/2026'), titre: 'Réception définitive', message: 'Bâtiment livré, garantie décennale déposée.', auteur: 'Commission de réception', nombreFichiers: 6),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2022-0311', code: 'IMMO-2022-0311',
      designation: 'Entrepôt logistique 2 400 m²', categorie: 'Bâtiments', compteComptable: '2311',
      famille: FamilleImmobilisation.immobilier, siteId: 'owe', local: 'Zone portuaire, lot 11',
      affectataire: 'Logistique', statut: StatutBien.actif, etat: EtatBien.moyen,
      fournisseur: 'BTP Estuaire', bonCommandeRef: 'BC-2022-0142', factureRef: 'FA-2022-4410',
      dateAcquisition: _d('04/02/2022'), valeurAcquisition: 520000000,
      dateMiseService: _dOpt('01/05/2022'), dureeAmortissement: 20, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 110500000, dateDernierInventaire: _dOpt('28/02/2026'),
      entretiens: [
        EntretienModel(id: 'IMMO-2022-0311-ent-1', date: _d('14/08/2026'), titre: 'Rénovation toiture', cout: 41500000, prestataire: 'BTP Estuaire', observation: 'Qualification en cours — ACQ-2026-0151', bonCommandeRef: 'BC-2026-0318', bonLivraisonRef: 'BL-4501', factureRef: 'FA-2026-8903', dossierRef: 'ACQ-2026-0151', dureeIntervention: '14 jours', technicien: 'Équipe couverture'),
        EntretienModel(id: 'IMMO-2022-0311-ent-2', date: _d('03/03/2025'), titre: 'Étanchéité quais', cout: 7800000, prestataire: 'BTP Estuaire', observation: 'Charge', bonCommandeRef: 'BC-2025-0088', bonLivraisonRef: 'BL-3902', factureRef: 'FA-2025-7104', dossierRef: 'ACQ-2025-0071', dureeIntervention: '6 jours', technicien: 'Équipe étanchéité'),
      ],
      photos: [
        PhotoModel(id: 'IMMO-2022-0311-ph-1', date: _d('14/08/2026'), titre: 'Toiture rénovée', message: 'Bacs acier remplacés sur 2 400 m², étanchéité reprise aux jonctions.', auteur: 'BTP Estuaire', nombreFichiers: 5),
        PhotoModel(id: 'IMMO-2022-0311-ph-2', date: _d('20/05/2026'), titre: 'Infiltrations avant travaux', message: "Traces d'eau sur charpente et stock — dossier ACQ-2026-0151.", auteur: 'A. Mba — Logistique', nombreFichiers: 4),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2026-0812', code: 'IMMO-2026-0812',
      designation: 'Terrain industriel 1 200 m² — Nkok', categorie: 'Terrains', compteComptable: '2211',
      famille: FamilleImmobilisation.immobilier, siteId: 'nkok', local: 'Zone économique spéciale',
      affectataire: 'Direction générale', statut: StatutBien.actif, etat: EtatBien.bon,
      fournisseur: 'Foncier Nkok SA', bonCommandeRef: 'BC-2026-0350', factureRef: 'FA-2026-9012',
      dateAcquisition: _d('07/08/2026'), valeurAcquisition: 185000000,
      dateMiseService: _dOpt('07/08/2026'), dureeAmortissement: 0, methodeAmortissement: _methode('Non amortissable'),
      montantAmorti: 0, dateDernierInventaire: null,
    ),
    ImmobilisationModel(
      id: 'IMMO-2024-0188', code: 'IMMO-2024-0188',
      designation: 'Toyota Hilux — GA-4412-LB', categorie: 'Matériel de transport', compteComptable: '2451',
      famille: FamilleImmobilisation.mobilier, siteId: 'owe', local: 'Parc automobile',
      affectataire: 'A. Mba — Logistique', statut: StatutBien.sortie, etat: EtatBien.degrade,
      fournisseur: 'Auto Trans Gabon', bonCommandeRef: 'BC-2024-0201', factureRef: 'FA-2024-6120',
      dateAcquisition: _d('15/04/2024'), valeurAcquisition: 29000000,
      dateMiseService: _dOpt('01/05/2024'), dureeAmortissement: 5, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 13533333, dateDernierInventaire: _dOpt('28/02/2026'), sortieRef: 'SOR-2026-0032',
      entretiens: [
        EntretienModel(id: 'IMMO-2024-0188-ent-1', date: _d('02/07/2026'), titre: 'Expertise avant cession', cout: 250000, prestataire: 'Auto Expert', observation: 'Valeur retenue 4 200 000', bonCommandeRef: 'BC-2026-0329', bonLivraisonRef: 'BL-4552', factureRef: 'FA-2026-8929', dossierRef: 'ACQ-2026-0154', dureeIntervention: '1 jour', technicien: 'Expert automobile'),
        EntretienModel(id: 'IMMO-2024-0188-ent-2', date: _d('11/11/2025'), titre: 'Révision 60 000 km', cout: 980000, prestataire: 'Auto Trans Gabon', observation: 'Boîte de vitesses fatiguée', bonCommandeRef: 'BC-2025-0301', bonLivraisonRef: 'BL-4188', factureRef: 'FA-2025-7688', dossierRef: 'ACQ-2025-0244', dureeIntervention: '2 jours', technicien: 'Atelier Auto Trans'),
      ],
      attributions: [
        AttributionModel(id: 'IMMO-2024-0188-att-1', date: _d('01/05/2024'), detenteur: 'P. Obame — Services généraux', lieu: 'Parc automobile', motif: 'Attribution initiale', acteReference: 'Carnet de bord CB-2024-018'),
        AttributionModel(id: 'IMMO-2024-0188-att-2', date: _d('12/09/2025'), detenteur: 'A. Mba — Logistique', lieu: 'Parc automobile', motif: 'Réaffectation exploitation', acteReference: 'Décharge DM-2025-0117'),
        AttributionModel(id: 'IMMO-2024-0188-att-3', date: _d('12/08/2026'), detenteur: 'Immobilisé en attente de cession', lieu: 'Parc automobile', motif: 'Mise en vente — SOR-2026-0032', acteReference: 'Décision de cession'),
      ],
      photos: [
        PhotoModel(id: 'IMMO-2024-0188-ph-1', date: _d('02/07/2026'), titre: 'Expertise avant cession', message: "Carrosserie, habitacle et compteur au jour de l'expertise. Rayures aile avant droite signalées.", auteur: 'Auto Expert', nombreFichiers: 6),
        PhotoModel(id: 'IMMO-2024-0188-ph-2', date: _d('11/11/2025'), titre: 'Révision 60 000 km', message: 'Boîte de vitesses fatiguée, jeu constaté au levier.', auteur: 'Auto Trans Gabon', nombreFichiers: 2),
        PhotoModel(id: 'IMMO-2024-0188-ph-3', date: _d('01/05/2024'), titre: 'Livraison du véhicule', message: 'Véhicule neuf, kilométrage 12 km.', auteur: 'A. Mba — Logistique', nombreFichiers: 3),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2026-0901', code: 'IMMO-2026-0901',
      designation: 'Groupe électrogène 250 kVA', categorie: 'Installations techniques', compteComptable: '2411',
      famille: FamilleImmobilisation.immobilier, siteId: 'lbv', local: 'Local technique — sous-sol',
      affectataire: 'Services généraux', statut: StatutBien.actif, etat: EtatBien.neuf,
      fournisseur: 'Énergie Équatoriale', bonCommandeRef: 'BC-2026-0324', factureRef: 'FA-2026-8940',
      dateAcquisition: _d('28/07/2026'), valeurAcquisition: 34800000,
      dateMiseService: _dOpt('15/08/2026'), dureeAmortissement: 10, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 0, dateDernierInventaire: null,
      entretiens: [
        EntretienModel(id: 'IMMO-2026-0901-ent-1', date: _d('15/08/2026'), titre: 'Mise en service et essais', cout: 0, prestataire: 'Énergie Équatoriale', observation: 'Réserve : capot de protection manquant', dossierRef: 'ACQ-2026-0161', dureeIntervention: '1 jour', technicien: 'Énergie Équatoriale'),
      ],
      photos: [
        PhotoModel(id: 'IMMO-2026-0901-ph-1', date: _d('15/08/2026'), titre: 'Mise en service et essais', message: 'Réserve : capot de protection manquant à la livraison.', auteur: 'Énergie Équatoriale', nombreFichiers: 3),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2026-0813', code: 'IMMO-2026-0813',
      designation: 'Ordinateur portable ThinkPad — poste 01', categorie: 'Matériel informatique', compteComptable: '2441',
      famille: FamilleImmobilisation.mobilier, siteId: 'lbv', local: 'Étage 3 — DSI',
      affectataire: 'J. Ndong — Informatique', statut: StatutBien.actif, etat: EtatBien.neuf,
      fournisseur: 'Gabon Digital Supply', bonCommandeRef: 'BC-2026-0311', factureRef: 'FA-2026-8871',
      dateAcquisition: _d('14/07/2026'), valeurAcquisition: 1000000,
      dateMiseService: _dOpt('20/08/2026'), dureeAmortissement: 3, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 0, dateDernierInventaire: null,
      attributions: [
        AttributionModel(id: 'IMMO-2026-0813-att-1', date: _d('20/08/2026'), detenteur: 'J. Ndong — Informatique', lieu: 'Étage 3 — DSI', motif: 'Attribution initiale', acteReference: 'Fiche de dotation FD-2026-0412'),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2026-0819', code: 'IMMO-2026-0819',
      designation: 'Poste fixe HP — Agence PG, poste 08', categorie: 'Matériel informatique', compteComptable: '2441',
      famille: FamilleImmobilisation.mobilier, siteId: 'pog', local: 'Open space commercial',
      affectataire: 'M. Koumba — Commercial', statut: StatutBien.actif, etat: EtatBien.bon,
      fournisseur: 'Gabon Digital Supply', bonCommandeRef: 'BC-2026-0295', factureRef: 'FA-2026-8790',
      dateAcquisition: _d('22/06/2026'), valeurAcquisition: 900000,
      dateMiseService: _dOpt('01/07/2026'), dureeAmortissement: 3, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 50000, dateDernierInventaire: null,
      attributions: [
        AttributionModel(id: 'IMMO-2026-0819-att-1', date: _d('01/07/2026'), detenteur: 'M. Koumba — Commercial', lieu: 'Open space commercial', motif: 'Attribution initiale', acteReference: 'Fiche de dotation FD-2026-0388'),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2026-0451', code: 'IMMO-2026-0451',
      designation: 'Ordinateur portable Dell — bureau 402', categorie: 'Matériel informatique', compteComptable: '2441',
      famille: FamilleImmobilisation.mobilier, siteId: 'lbv', local: 'Étage 4 — Commercial',
      affectataire: 'B. Nyama — Commercial', statut: StatutBien.sortie, etat: EtatBien.horsService,
      fournisseur: 'Gabon Digital Supply', bonCommandeRef: 'BC-2025-0188', factureRef: 'FA-2025-7401',
      dateAcquisition: _d('10/02/2025'), valeurAcquisition: 960000,
      dateMiseService: _dOpt('01/03/2025'), dureeAmortissement: 3, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 320000, dateDernierInventaire: _dOpt('28/02/2026'), sortieRef: 'SOR-2026-0031',
      attributions: [
        AttributionModel(id: 'IMMO-2026-0451-att-1', date: _d('01/03/2025'), detenteur: 'L. Ibinga — Commercial', lieu: 'Open space — Port-Gentil', motif: 'Attribution initiale', acteReference: 'Fiche de dotation FD-2025-0201'),
        AttributionModel(id: 'IMMO-2026-0451-att-2', date: _d('14/01/2026'), detenteur: 'B. Nyama — Commercial', lieu: 'Étage 4 — Commercial', motif: 'Mutation interne du détenteur', acteReference: 'Décharge DM-2026-0044'),
        AttributionModel(id: 'IMMO-2026-0451-att-3', date: _d('09/08/2026'), detenteur: '— (vol déclaré)', lieu: 'Retiré du parc', motif: 'Vol — dossier SOR-2026-0031', acteReference: 'Déclaration de vol'),
      ],
      photos: [
        PhotoModel(id: 'IMMO-2026-0451-ph-1', date: _d('09/08/2026'), titre: 'Bureau 402 après le vol', message: "Poste absent du bureau, station d'accueil et câbles laissés sur place.", auteur: 'Sécurité', nombreFichiers: 2),
        PhotoModel(id: 'IMMO-2026-0451-ph-2', date: _d('01/03/2025'), titre: 'Attribution du poste', message: "Photo d'inventaire à la remise du matériel, numéro de série visible.", auteur: 'Informatique', nombreFichiers: 1),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2023-0522', code: 'IMMO-2023-0522',
      designation: 'Chariot élévateur 2,5 t Toyota', categorie: 'Matériel industriel', compteComptable: '2412',
      famille: FamilleImmobilisation.mobilier, siteId: 'owe', local: 'Quai de chargement',
      affectataire: 'Logistique', statut: StatutBien.actif, etat: EtatBien.moyen,
      fournisseur: 'Manuten Gabon', bonCommandeRef: 'BC-2023-0177', factureRef: 'FA-2023-5330',
      dateAcquisition: _d('19/09/2023'), valeurAcquisition: 21400000,
      dateMiseService: _dOpt('01/10/2023'), dureeAmortissement: 8, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 7788333, dateDernierInventaire: _dOpt('28/02/2026'),
      entretiens: [
        EntretienModel(id: 'IMMO-2023-0522-ent-1', date: _d('20/05/2026'), titre: 'Remplacement fourches', cout: 1450000, prestataire: 'Manuten Gabon', observation: 'Charge', bonCommandeRef: 'BC-2026-0244', bonLivraisonRef: 'BL-4455', factureRef: 'FA-2026-8688', dossierRef: 'ACQ-2026-0121', dureeIntervention: '1 jour', technicien: 'Manuten — équipe 1'),
        EntretienModel(id: 'IMMO-2023-0522-ent-2', date: _d('18/10/2025'), titre: 'Entretien 2 000 h', cout: 620000, prestataire: 'Manuten Gabon', observation: 'Contrat de maintenance', bonCommandeRef: 'BC-2025-0277', bonLivraisonRef: 'BL-4141', factureRef: 'FA-2025-7602', dossierRef: 'Contrat MNT-2023-04', dureeIntervention: '1 jour', technicien: 'Manuten — équipe 2'),
      ],
      attributions: [
        AttributionModel(id: 'IMMO-2023-0522-att-1', date: _d('01/10/2023'), detenteur: 'Logistique — usage collectif', lieu: 'Quai de chargement', motif: 'Mise en service', acteReference: 'PV de réception'),
        AttributionModel(id: 'IMMO-2023-0522-att-2', date: _d('03/02/2025'), detenteur: 'K. Edzang — Logistique', lieu: 'Magasin agence — Oyem', motif: 'Prêt inter-sites (3 mois)', acteReference: 'Bon de mouvement BM-2025-0071'),
        AttributionModel(id: 'IMMO-2023-0522-att-3', date: _d('11/05/2025'), detenteur: 'Logistique — usage collectif', lieu: 'Quai de chargement', motif: 'Retour de prêt', acteReference: 'Bon de mouvement BM-2025-0132'),
      ],
      photos: [
        PhotoModel(id: 'IMMO-2023-0522-ph-1', date: _d('20/05/2026'), titre: 'Fourches remplacées', message: 'Anciennes fourches déformées, nouvelles montées et testées en charge.', auteur: 'Manuten Gabon', nombreFichiers: 3),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2021-0270', code: 'IMMO-2021-0270',
      designation: 'Machine de conditionnement L400', categorie: 'Matériel industriel', compteComptable: '2412',
      famille: FamilleImmobilisation.mobilier, siteId: 'nkok', local: 'Atelier 2',
      affectataire: 'Production', statut: StatutBien.actif, etat: EtatBien.degrade,
      fournisseur: 'Industrie Sud', bonCommandeRef: 'BC-2021-0119', factureRef: 'FA-2021-3204',
      dateAcquisition: _d('08/06/2021'), valeurAcquisition: 48000000,
      dateMiseService: _dOpt('01/08/2021'), dureeAmortissement: 8, methodeAmortissement: _methode('Dégressif'),
      montantAmorti: 33600000, dateDernierInventaire: _dOpt('28/02/2026'),
      entretiens: [
        EntretienModel(id: 'IMMO-2021-0270-ent-1', date: _d('12/07/2026'), titre: 'Panne convoyeur', cout: 2900000, prestataire: 'Industrie Sud', observation: '2e panne en 6 mois — remplacement à étudier', bonCommandeRef: 'BC-2026-0327', bonLivraisonRef: 'BL-4545', factureRef: 'FA-2026-8921', dossierRef: 'ACQ-2026-0149', dureeIntervention: '3 jours', technicien: 'Industrie Sud — SAV'),
        EntretienModel(id: 'IMMO-2021-0270-ent-2', date: _d('04/02/2026'), titre: "Panne moteur d'entraînement", cout: 3400000, prestataire: 'Industrie Sud', observation: 'Charge', bonCommandeRef: 'BC-2026-0118', bonLivraisonRef: 'BL-4166', factureRef: 'FA-2026-8288', dossierRef: 'ACQ-2026-0055', dureeIntervention: '4 jours', technicien: 'Industrie Sud — SAV'),
      ],
      attributions: [
        AttributionModel(id: 'IMMO-2021-0270-att-1', date: _d('01/08/2021'), detenteur: 'Production', lieu: 'Atelier 1', motif: 'Mise en service', acteReference: 'PV de réception'),
        AttributionModel(id: 'IMMO-2021-0270-att-2', date: _d('19/03/2024'), detenteur: 'H. Ovono — Production', lieu: 'Atelier 2', motif: 'Réorganisation des ateliers', acteReference: 'Bon de mouvement BM-2024-0206'),
      ],
      photos: [
        PhotoModel(id: 'IMMO-2021-0270-ph-1', date: _d('12/07/2026'), titre: 'Panne convoyeur', message: 'Deuxième panne en six mois. Courroie et galets photographiés avant démontage.', auteur: 'Industrie Sud', nombreFichiers: 4),
        PhotoModel(id: 'IMMO-2021-0270-ph-2', date: _d('04/02/2026'), titre: "Moteur d'entraînement", message: 'Roulement hors service, traces de surchauffe visibles.', auteur: 'Industrie Sud', nombreFichiers: 2),
        PhotoModel(id: 'IMMO-2021-0270-ph-3', date: _d('01/08/2021'), titre: 'Mise en service', message: 'Machine installée en atelier 1, essais de production concluants.', auteur: 'Production', nombreFichiers: 3),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2026-0833', code: 'IMMO-2026-0833',
      designation: 'Climatiseur split 24 000 BTU — bureau PG 03', categorie: 'Installations techniques', compteComptable: '2411',
      famille: FamilleImmobilisation.immobilier, siteId: 'pog', local: 'Bureau 03',
      affectataire: 'Services généraux', statut: StatutBien.actif, etat: EtatBien.neuf,
      fournisseur: 'Froid Austral', bonCommandeRef: 'BC-2026-0336', factureRef: null,
      dateAcquisition: _d('04/08/2026'), valeurAcquisition: 800000,
      dateMiseService: null, dureeAmortissement: 5, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 0, dateDernierInventaire: null,
    ),
    ImmobilisationModel(
      id: 'IMMO-2025-0644', code: 'IMMO-2025-0644',
      designation: 'Mobilier de bureau — lot direction', categorie: 'Mobilier de bureau', compteComptable: '2444',
      famille: FamilleImmobilisation.mobilier, siteId: 'lbv', local: 'Étage 5 — Direction',
      affectataire: 'Direction générale', statut: StatutBien.actif, etat: EtatBien.bon,
      fournisseur: 'Espace Bureau SA', bonCommandeRef: 'BC-2025-0233', factureRef: 'FA-2025-7812',
      dateAcquisition: _d('06/05/2025'), valeurAcquisition: 14800000,
      dateMiseService: _dOpt('01/06/2025'), dureeAmortissement: 10, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 1850000, dateDernierInventaire: _dOpt('28/02/2026'),
      attributions: [
        AttributionModel(id: 'IMMO-2025-0644-att-1', date: _d('01/06/2025'), detenteur: 'Direction générale', lieu: 'Étage 5 — Direction', motif: 'Attribution initiale', acteReference: 'Fiche de dotation FD-2025-0233'),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2019-0088', code: 'IMMO-2019-0088',
      designation: 'Groupe froid agence Franceville', categorie: 'Installations techniques', compteComptable: '2411',
      famille: FamilleImmobilisation.immobilier, siteId: 'fcv', local: 'Toiture agence',
      affectataire: 'Services généraux', statut: StatutBien.actif, etat: EtatBien.degrade,
      fournisseur: 'Froid Austral', bonCommandeRef: 'BC-2019-0044', factureRef: 'FA-2019-0912',
      dateAcquisition: _d('27/03/2019'), valeurAcquisition: 18600000,
      dateMiseService: _dOpt('01/05/2019'), dureeAmortissement: 10, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 13485000, dateDernierInventaire: _dOpt('27/02/2026'),
      entretiens: [
        EntretienModel(id: 'IMMO-2019-0088-ent-1', date: _d('30/04/2026'), titre: 'Recharge fluide + fuite', cout: 1180000, prestataire: 'Froid Austral', observation: 'Fin de vie annoncée', bonCommandeRef: 'BC-2026-0221', bonLivraisonRef: 'BL-4402', factureRef: 'FA-2026-8611b', dossierRef: 'ACQ-2026-0108', dureeIntervention: '1 jour', technicien: 'Froid Austral — PG'),
      ],
      attributions: [
        AttributionModel(id: 'IMMO-2019-0088-att-1', date: _d('01/05/2019'), detenteur: 'Services généraux', lieu: 'Toiture agence', motif: 'Mise en service', acteReference: 'PV de réception'),
      ],
      photos: [
        PhotoModel(id: 'IMMO-2019-0088-ph-1', date: _d('30/04/2026'), titre: 'Groupe froid en fin de vie', message: 'Corrosion du carter et fuite au niveau du raccord basse pression.', auteur: 'Froid Austral', nombreFichiers: 3),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2018-0244', code: 'IMMO-2018-0244',
      designation: 'Imprimante multifonction Ricoh — lot 2018', categorie: 'Matériel informatique', compteComptable: '2441',
      famille: FamilleImmobilisation.mobilier, siteId: 'lbv', local: 'Étage 2 — reprographie',
      affectataire: 'Informatique', statut: StatutBien.sortie, etat: EtatBien.horsService,
      fournisseur: 'Gabon Digital Supply', bonCommandeRef: 'BC-2018-0301', factureRef: 'FA-2018-0455',
      dateAcquisition: _d('11/09/2018'), valeurAcquisition: 1750000,
      dateMiseService: _dOpt('01/10/2018'), dureeAmortissement: 5, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 1750000, dateDernierInventaire: _dOpt('28/02/2026'), sortieRef: 'SOR-2026-0033',
      entretiens: [
        EntretienModel(id: 'IMMO-2018-0244-ent-1', date: _d('15/08/2026'), titre: 'Constat technique irréparable', cout: 0, prestataire: 'Gabon Digital Supply', observation: 'Pièces indisponibles', dossierRef: 'SOR-2026-0033', dureeIntervention: '1 jour', technicien: 'GDS — SAV'),
      ],
      attributions: [
        AttributionModel(id: 'IMMO-2018-0244-att-1', date: _d('01/10/2018'), detenteur: 'Informatique — usage collectif', lieu: 'Étage 2 — Reprographie', motif: 'Mise en service', acteReference: 'PV de réception'),
        AttributionModel(id: 'IMMO-2018-0244-att-2', date: _d('15/08/2026'), detenteur: 'Retiré du service', lieu: 'Local de rebut', motif: 'Mise au rebut — SOR-2026-0033', acteReference: 'Constat technique'),
      ],
      photos: [
        PhotoModel(id: 'IMMO-2018-0244-ph-1', date: _d('15/08/2026'), titre: 'Constat avant rebut', message: 'Imprimantes du lot 2018 regroupées au local de rebut, pièces indisponibles.', auteur: 'J. Ndong — Informatique', nombreFichiers: 2),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2024-0399', code: 'IMMO-2024-0399',
      designation: 'Onduleur 10 kVA salle serveurs', categorie: 'Installations techniques', compteComptable: '2411',
      famille: FamilleImmobilisation.mobilier, siteId: 'lbv', local: 'Salle serveurs — étage 3',
      affectataire: 'Informatique', statut: StatutBien.actif, etat: EtatBien.moyen,
      fournisseur: 'Élec Gabon', bonCommandeRef: 'BC-2024-0255', factureRef: 'FA-2024-6588',
      dateAcquisition: _d('02/09/2024'), valeurAcquisition: 6100000,
      dateMiseService: _dOpt('01/10/2024'), dureeAmortissement: 5, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 2338333, dateDernierInventaire: _dOpt('28/02/2026'),
      entretiens: [
        EntretienModel(id: 'IMMO-2024-0399-ent-1', date: _d('19/06/2026'), titre: 'Remplacement batteries', cout: 1420000, prestataire: 'Élec Gabon', observation: 'Autonomie revenue à 18 min', bonCommandeRef: 'BC-2026-0299', bonLivraisonRef: 'BL-4512', factureRef: 'FA-2026-8866', dossierRef: 'ACQ-2026-0142', dureeIntervention: '1 jour', technicien: 'Élec Gabon'),
      ],
      attributions: [
        AttributionModel(id: 'IMMO-2024-0399-att-1', date: _d('01/10/2024'), detenteur: 'Informatique', lieu: 'Salle serveurs — étage 3', motif: 'Mise en service', acteReference: 'PV de réception'),
        AttributionModel(id: 'IMMO-2024-0399-att-2', date: _d('19/06/2026'), detenteur: 'F. Moussavou — Informatique', lieu: 'Salle serveurs — étage 3', motif: "Nomination d'un détenteur responsable", acteReference: 'Décharge DM-2026-0158'),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2022-0455', code: 'IMMO-2022-0455',
      designation: 'Véhicule de service Corolla — GA-2210-OY', categorie: 'Matériel de transport', compteComptable: '2451',
      famille: FamilleImmobilisation.mobilier, siteId: 'oye', local: 'Agence Oyem',
      affectataire: 'Commercial', statut: StatutBien.actif, etat: EtatBien.bon,
      fournisseur: 'Auto Trans Gabon', bonCommandeRef: 'BC-2022-0166', factureRef: 'FA-2022-4680',
      dateAcquisition: _d('23/07/2022'), valeurAcquisition: 16400000,
      dateMiseService: _dOpt('01/09/2022'), dureeAmortissement: 5, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 12793333, dateDernierInventaire: _dOpt('27/02/2026'),
      entretiens: [
        EntretienModel(id: 'IMMO-2022-0455-ent-1', date: _d('08/05/2026'), titre: 'Révision 80 000 km', cout: 720000, prestataire: 'Auto Trans Gabon', observation: '—', bonCommandeRef: 'BC-2026-0261', bonLivraisonRef: 'BL-4478', factureRef: 'FA-2026-8722', dossierRef: 'Contrat MNT-2022-11', dureeIntervention: '1 jour', technicien: 'Atelier Oyem'),
      ],
      attributions: [
        AttributionModel(id: 'IMMO-2022-0455-att-1', date: _d('01/09/2022'), detenteur: 'Commercial — Oyem', lieu: 'Agence Oyem', motif: 'Attribution initiale', acteReference: 'Carnet de bord CB-2022-041'),
        AttributionModel(id: 'IMMO-2022-0455-att-2', date: _d('06/06/2024'), detenteur: 'G. Ntoutoume — Commercial', lieu: 'Agence Franceville', motif: "Transfert d'agence", acteReference: 'Bon de mouvement BM-2024-0288'),
        AttributionModel(id: 'IMMO-2022-0455-att-3', date: _d('02/02/2026'), detenteur: 'Commercial — Oyem', lieu: 'Agence Oyem', motif: "Retour au site d'origine", acteReference: 'Bon de mouvement BM-2026-0019'),
      ],
    ),
    ImmobilisationModel(
      id: 'IMMO-2023-0710', code: 'IMMO-2023-0710',
      designation: 'Serveur de virtualisation Dell R650', categorie: 'Matériel informatique', compteComptable: '2441',
      famille: FamilleImmobilisation.mobilier, siteId: 'lbv', local: 'Salle serveurs — baie A',
      affectataire: 'Informatique', statut: StatutBien.actif, etat: EtatBien.bon,
      fournisseur: 'Gabon Digital Supply', bonCommandeRef: 'BC-2023-0208', factureRef: 'FA-2023-5901',
      dateAcquisition: _d('14/11/2023'), valeurAcquisition: 24300000,
      dateMiseService: _dOpt('01/12/2023'), dureeAmortissement: 5, methodeAmortissement: _methode('Linéaire'),
      montantAmorti: 13365000, dateDernierInventaire: _dOpt('28/02/2026'),
      entretiens: [
        EntretienModel(id: 'IMMO-2023-0710-ent-1', date: _d('21/03/2026'), titre: 'Extension mémoire 128 Go', cout: 2100000, prestataire: 'Gabon Digital Supply', observation: 'Immobilisation complémentaire', bonCommandeRef: 'BC-2026-0188', bonLivraisonRef: 'BL-4344', factureRef: 'FA-2026-8455', dossierRef: 'ACQ-2026-0092', dureeIntervention: '1 jour', technicien: 'GDS — équipe infra'),
      ],
      attributions: [
        AttributionModel(id: 'IMMO-2023-0710-att-1', date: _d('01/12/2023'), detenteur: 'Informatique', lieu: 'Salle serveurs — baie A', motif: 'Mise en service', acteReference: 'PV de réception'),
        AttributionModel(id: 'IMMO-2023-0710-att-2', date: _d('21/03/2026'), detenteur: 'Informatique', lieu: 'Salle serveurs — baie A', motif: 'Extension mémoire — valeur augmentée', acteReference: 'Fiche de modification FM-2026-0033'),
      ],
    ),
  ];

  // ---------------------------------------------------------------------
  // Session de comptage en cours (campagne INV-2026-02)
  // ---------------------------------------------------------------------

  static final List<ComptageModel> comptagesSession = [
    ComptageModel(immobilisationId: 'IMMO-2020-0104', resultat: ResultatComptage.ok, dateHeure: _dtCampagne(8, 12), agentNom: 'C. Ella'),
    ComptageModel(immobilisationId: 'IMMO-2026-0813', resultat: ResultatComptage.ok, dateHeure: _dtCampagne(8, 26), agentNom: 'C. Ella'),
    ComptageModel(
      immobilisationId: 'IMMO-2024-0399', resultat: ResultatComptage.etat, dateHeure: _dtCampagne(9, 3), agentNom: 'C. Ella',
      note: 'État moyen → Dégradé · batteries à nouveau faibles',
      modification: const ComptageModification(etat: EtatBien.degrade),
    ),
    ComptageModel(immobilisationId: 'IMMO-2025-0644', resultat: ResultatComptage.ok, dateHeure: _dtCampagne(9, 41), agentNom: 'C. Ella'),
    ComptageModel(
      immobilisationId: 'IMMO-2023-0710', resultat: ResultatComptage.lieu, dateHeure: _dtCampagne(10, 15), agentNom: 'C. Ella',
      note: 'Salle serveurs baie A → baie B',
      modification: const ComptageModification(local: 'Salle serveurs — baie B'),
    ),
    ComptageModel(
      immobilisationId: 'IMMO-2026-0451', resultat: ResultatComptage.introuvable, dateHeure: _dtCampagne(10, 38), agentNom: 'C. Ella',
      note: 'Bien déclaré volé — dossier SOR-2026-0031',
    ),
    ComptageModel(immobilisationId: 'IMMO-2018-0244', resultat: ResultatComptage.ok, dateHeure: _dtCampagne(11, 2), agentNom: 'C. Ella', note: 'Présent au local de rebut'),
  ];

  static DateTime _dtCampagne(int h, int m) => DateTime(2026, 8, 24, h, m);

  // ---------------------------------------------------------------------
  // Campagnes clôturées
  // ---------------------------------------------------------------------

  static final List<CampagneHistoriqueModel> campagnesCloturees = [
    CampagneHistoriqueModel(
      reference: 'INV-2026-01', libelle: 'Inventaire annuel 2025', periodeLabel: '23/02/2026 → 28/02/2026',
      totalBiens: 412, biensComptes: 412, ecarts: 9, introuvables: 2,
      contributions: const [
        ContributionAgentModel(nom: 'C. Ella', biensComptes: 168, ecarts: 4),
        ContributionAgentModel(nom: 'J. Ndong', biensComptes: 121, ecarts: 3),
        ContributionAgentModel(nom: 'A. Mba', biensComptes: 87, ecarts: 2),
        ContributionAgentModel(nom: 'M. Koumba', biensComptes: 36, ecarts: 0),
      ],
      mouvements: [
        ComptageModel(immobilisationId: 'IMMO-2022-0455', resultat: ResultatComptage.lieu, dateHeure: DateTime(2026, 2, 27, 14, 20), agentNom: 'C. Ella', note: 'Agence Franceville → Agence Oyem'),
        ComptageModel(immobilisationId: 'IMMO-2021-0270', resultat: ResultatComptage.etat, dateHeure: DateTime(2026, 2, 26, 10, 5), agentNom: 'A. Mba', note: 'Bon état → Dégradé · panne moteur'),
        ComptageModel(immobilisationId: 'IMMO-2023-0522', resultat: ResultatComptage.ok, dateHeure: DateTime(2026, 2, 26, 9, 12), agentNom: 'A. Mba'),
        ComptageModel(immobilisationId: 'IMMO-2019-0088', resultat: ResultatComptage.etat, dateHeure: DateTime(2026, 2, 25, 15, 44), agentNom: 'M. Koumba', note: 'Fuite fluide constatée'),
        ComptageModel(immobilisationId: 'IMMO-2022-0311', resultat: ResultatComptage.ok, dateHeure: DateTime(2026, 2, 24, 11, 30), agentNom: 'C. Ella'),
      ],
    ),
    CampagneHistoriqueModel(
      reference: 'INV-2025-02', libelle: 'Inventaire tournant — sites Sud', periodeLabel: '08/09/2025 → 12/09/2025',
      totalBiens: 96, biensComptes: 96, ecarts: 3, introuvables: 0,
      contributions: const [
        ContributionAgentModel(nom: 'M. Koumba', biensComptes: 61, ecarts: 2),
        ContributionAgentModel(nom: 'C. Ella', biensComptes: 35, ecarts: 1),
      ],
      mouvements: [
        ComptageModel(immobilisationId: 'IMMO-2026-0819', resultat: ResultatComptage.affect, dateHeure: DateTime(2025, 9, 10, 16, 2), agentNom: 'M. Koumba', note: 'Poste réaffecté au commercial PG'),
        ComptageModel(immobilisationId: 'IMMO-2022-0455', resultat: ResultatComptage.ok, dateHeure: DateTime(2025, 9, 9, 8, 55), agentNom: 'C. Ella'),
      ],
    ),
    CampagneHistoriqueModel(
      reference: 'INV-2025-01', libelle: 'Inventaire annuel 2024', periodeLabel: '24/02/2025 → 01/03/2025',
      totalBiens: 388, biensComptes: 385, ecarts: 14, introuvables: 3,
      contributions: const [
        ContributionAgentModel(nom: 'C. Ella', biensComptes: 152, ecarts: 6),
        ContributionAgentModel(nom: 'J. Ndong', biensComptes: 118, ecarts: 5),
        ContributionAgentModel(nom: 'A. Mba', biensComptes: 115, ecarts: 3),
      ],
      mouvements: [
        ComptageModel(immobilisationId: 'IMMO-2024-0188', resultat: ResultatComptage.etat, dateHeure: DateTime(2025, 2, 27, 13, 10), agentNom: 'A. Mba', note: 'Rayures et jeu au levier'),
        ComptageModel(immobilisationId: 'IMMO-2020-0104', resultat: ResultatComptage.ok, dateHeure: DateTime(2025, 2, 25, 9, 0), agentNom: 'C. Ella'),
      ],
    ),
  ];
}
