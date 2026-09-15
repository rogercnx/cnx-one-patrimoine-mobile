# CNX-ONE-Patrimoine — Spécifications backend (tables & routes)

Document préparé pour Seven (backend). Basé sur l'inventaire mobile (design déjà validé) + le modèle de données complet du module Patrimoine retrouvé dans les maquettes.

Backend existant : `https://backend.zira24.com` — Auth JWT (bearer + refresh), multi-tenant (`tenantSlug`), permissions par module. Toutes les routes ci-dessous doivent suivre la même convention : préfixe `/api/v1/patrimoine/...`, sécurité `bearerAuth`, permissions dédiées (ex. `patrimoine:inventaire:view`, `patrimoine:dossier:validate`, etc.).

---

## PARTIE 1 — Portée mobile actuelle : Inventaire physique (comptage)

C'est le périmètre couvert par les écrans mobiles déjà designés (Accueil, Scanner, Historique, Fiche détail).

### Tables

**`sites`**
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| code | varchar | ex. `lbv`, `owe` |
| nom | varchar | ex. "Siège Libreville" |
| ville | varchar | |
| latitude | decimal | |
| longitude | decimal | |
| tenant_id | fk | |

**`immobilisations`**
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| code | varchar unique | ex. `IMMO-2020-0104` |
| designation | varchar | |
| categorie | varchar | ex. "Bâtiments", "Matériel informatique" |
| compte_comptable | varchar | ex. `2311`, `2441` |
| famille | enum | `immobilier` \| `mobilier` |
| site_id | fk → sites | |
| local | varchar | emplacement précis |
| affectataire | varchar | détenteur actuel (nom + service) |
| statut | enum | `actif` \| `stock` \| `sortie` \| `cede` |
| etat | enum | `neuf` \| `bon` \| `moyen` \| `degrade` \| `horsservice` |
| fournisseur | varchar | |
| bon_commande_ref | varchar | |
| facture_ref | varchar nullable | |
| date_acquisition | date | |
| valeur_acquisition | decimal | |
| date_mise_service | date nullable | |
| duree_amortissement | int | années, 0 = non amortissable |
| methode_amortissement | enum | `lineaire` \| `degressif` \| `non_amortissable` |
| montant_amorti | decimal | |
| date_dernier_inventaire | date nullable | |
| sortie_ref | varchar nullable | fk logique vers `dossiers` (partie 2) |
| tenant_id | fk | |

**`immobilisation_entretiens`**
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| immobilisation_id | fk | |
| date | date | |
| titre | varchar | ex. "Réparation ascenseur" |
| cout | decimal | |
| prestataire | varchar | |
| observation | text nullable | |
| bon_commande_ref | varchar nullable | |
| bon_livraison_ref | varchar nullable | |
| facture_ref | varchar nullable | |
| dossier_ref | varchar nullable | lien vers `dossiers.reference` |
| duree_intervention | varchar nullable | |
| technicien | varchar nullable | |

**`immobilisation_attributions`** (historique des mouvements/détenteurs)
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| immobilisation_id | fk | |
| date | date | |
| detenteur | varchar | |
| lieu | varchar | |
| motif | varchar | ex. "Mise en service", "Mutation interne" |
| acte_reference | varchar | ex. "Fiche de dotation FD-2026-0412" |

**`immobilisation_photos`**
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| immobilisation_id | fk | |
| date | date | |
| titre | varchar | |
| message | text nullable | |
| auteur | varchar | |
| tenant_id | fk | |

**`immobilisation_photo_fichiers`** (1-N avec la table au-dessus)
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| photo_id | fk | |
| url | varchar | stockage (S3/Drive) |

**`campagnes_inventaire`**
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| reference | varchar | ex. `INV-2026-02` |
| libelle | varchar | |
| date_debut | date | |
| date_fin | date | |
| perimetre | varchar | ex. "Tous sites · 2048 immobilisations" |
| statut | enum | `en_cours` \| `cloturee` |
| tenant_id | fk | |

**`inventaire_comptages`** (chaque scan/pointage effectué)
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| campagne_id | fk | |
| immobilisation_id | fk | |
| agent_id | fk → users | |
| resultat | enum | `ok` \| `ecart` \| `introuvable` |
| date_heure | timestamp | |
| etat_constate | enum nullable | si modifié pendant le comptage |
| site_constate | fk nullable | si le bien a été trouvé ailleurs |
| affectataire_constate | varchar nullable | |
| note | text nullable | |

### Routes API — Inventaire

```
GET    /api/v1/patrimoine/sites
GET    /api/v1/patrimoine/immobilisations?site=&statut=&etat=&categorie=&q=
GET    /api/v1/patrimoine/immobilisations/:id
GET    /api/v1/patrimoine/immobilisations/:id/entretiens
GET    /api/v1/patrimoine/immobilisations/:id/attributions
GET    /api/v1/patrimoine/immobilisations/:id/photos
POST   /api/v1/patrimoine/immobilisations/:id/photos          (multipart upload)

GET    /api/v1/patrimoine/campagnes?statut=en_cours
GET    /api/v1/patrimoine/campagnes/:id
GET    /api/v1/patrimoine/campagnes/:id/comptages?agent_id=
POST   /api/v1/patrimoine/campagnes/:id/comptages              (valider un comptage)
PATCH  /api/v1/patrimoine/campagnes/:id/comptages/:comptageId  (corriger un comptage)
GET    /api/v1/patrimoine/campagnes/:id/stats                  (avancement par site, écarts, KPIs dashboard Accueil)

GET    /api/v1/patrimoine/lookup/qr/:code                      (résout un QR scanné → immobilisation)
```

---

## PARTIE 2 — Extension future : Workflow complet (Commandes → Achats → Comptabilité → Sorties)

Ce périmètre n'est **pas encore confirmé pour le mobile**, mais le modèle existe déjà dans les maquettes (probablement pour la version web/desktop). À faire construire par Seven en anticipation si le mobile doit un jour exposer la validation des dossiers (ex. un manager qui valide depuis son téléphone).

Le circuit suit une logique **"3 mains"** : Maker (demandeur) → Contrôleur (responsable) → Autorisation (DAF/DG), répété à chaque étape clé.

### Tables

**`workflow_groupes`**
| Champ | Type | Notes |
|---|---|---|
| id | varchar/pk | `cmd`, `ach`, `cpta`, `sortie` |
| label | varchar | "Commandes départements", "Achats / DPA"... |
| icone | varchar | |
| ordre | int | |

**`workflow_etapes`**
| Champ | Type | Notes |
|---|---|---|
| id | varchar/pk | `besoin`, `verif`, `autor`, `consult`, `bc`, `bl`, `fact`, `qualif`, `immo`, `sortie` |
| groupe_id | fk → workflow_groupes | |
| label_court | varchar | |
| label | varchar | |
| icone | varchar | |
| ordre | int | |

**`dossiers`** (une demande d'achat, du besoin jusqu'à la fiche d'immobilisation ou la sortie)
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| reference | varchar unique | ex. `ACQ-2026-0148`, `SOR-2026-0031` |
| site_id | fk → sites | |
| objet | varchar | |
| categorie | varchar | |
| famille | enum | `immobilier` \| `mobilier` |
| departement | varchar | |
| demandeur_id | fk → users | |
| date_demande | date | |
| montant | decimal | |
| budget_prevu | decimal nullable | |
| etape_courante_id | fk → workflow_etapes | |
| qualification | enum nullable | `immo` \| `charge` \| `arbitrage` |
| compte_comptable | varchar nullable | |
| fournisseur | varchar nullable | |
| bon_commande_ref | varchar nullable | |
| facture_ref | varchar nullable | |
| alerte | text nullable | message d'alerte affiché (retard, réserve...) |
| immobilisations_generees | varchar nullable | plage d'IDs générés |
| motif_sortie | enum nullable | `vol` \| `perte` \| `accident` \| `vente` \| `rebut` (uniquement si groupe = sortie) |
| tenant_id | fk | |

**`dossier_bons_livraison`**
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| dossier_id | fk | |
| reference | varchar | |
| quantite_recue | int | |
| commentaire | varchar nullable | ex. "réception avec réserve" |

**`dossier_validations`** (le cœur du circuit 3 mains — une ligne par rôle par étape-groupe)
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| dossier_id | fk | |
| groupe_id | fk → workflow_groupes | ex. `cmd` ou `ach` |
| role | enum | `maker` \| `controleur` \| `autorisation` |
| validateur_id | fk → users nullable | |
| statut | enum nullable | `ok` \| `attente` \| null (pas encore atteint) |
| date_validation | timestamp nullable | |

**`dossier_offres`** (appel d'offres fournisseurs)
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| dossier_id | fk | |
| fournisseur | varchar | |
| montant | decimal | |
| delai | varchar | |
| observation | text nullable | |
| selectionnee | boolean | |

**`dossier_trace`** (journal d'audit affiché dans le détail du dossier)
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| dossier_id | fk | |
| date | timestamp nullable | null si l'étape est en attente |
| auteur | varchar | |
| action | varchar | ex. "BC-2026-0311 validé et envoyé" |
| detail | text nullable | |
| en_attente | boolean | |

**`dossier_justificatifs`** (utilisé surtout pour les sorties : vol, perte...)
| Champ | Type | Notes |
|---|---|---|
| id | uuid/pk | |
| dossier_id | fk | |
| libelle | varchar | ex. "Procès-verbal de police" |
| statut | enum | `fourni` \| `manquant` |

**`motifs_sortie`** (référentiel, peut être un enum plutôt qu'une table)
`vol`, `perte`, `accident`, `vente`, `rebut`

### Routes API — Workflow complet

```
GET    /api/v1/patrimoine/groupes
GET    /api/v1/patrimoine/etapes

GET    /api/v1/patrimoine/dossiers?groupe=&etape=&site=&departement=&alerte=
GET    /api/v1/patrimoine/dossiers/:id
POST   /api/v1/patrimoine/dossiers                              (créer une demande — étape "besoin")
PATCH  /api/v1/patrimoine/dossiers/:id

POST   /api/v1/patrimoine/dossiers/:id/validations              (enregistrer une validation maker/contrôleur/autorisation)
POST   /api/v1/patrimoine/dossiers/:id/offres
PATCH  /api/v1/patrimoine/dossiers/:id/offres/:offreId/selectionner
POST   /api/v1/patrimoine/dossiers/:id/livraisons               (enregistrer un BL)
POST   /api/v1/patrimoine/dossiers/:id/qualification             (immo / charge / arbitrage)
POST   /api/v1/patrimoine/dossiers/:id/generer-immobilisations   (crée les lignes dans `immobilisations`)
POST   /api/v1/patrimoine/dossiers/:id/sortie                    (motif + justificatifs)
GET    /api/v1/patrimoine/dossiers/:id/trace

GET    /api/v1/patrimoine/kpi/alertes                            (réceptions partielles, sorties incomplètes, hors budget, BC en attente...)
```

---

## Notes pour Seven

1. **Auth/permissions** : réutiliser le système JWT + rôles/permissions déjà en place sur `backend.zira24.com`. Prévoir des permissions granulaires par action (`patrimoine:inventaire:count`, `patrimoine:dossier:validate:maker`, `patrimoine:dossier:validate:controleur`, `patrimoine:dossier:validate:autorisation`) puisque le circuit 3 mains dépend du rôle de l'utilisateur connecté.
2. **Multi-tenant** : toutes les tables doivent porter `tenant_id`, cohérent avec le reste du SaaS.
3. **Photos** : à uploader vers le module Drive existant du SaaS si possible, plutôt que de réinventer un stockage dédié — `immobilisation_photo_fichiers.url` pointerait alors vers une ressource Drive.
4. **Priorité de livraison** : la Partie 1 (inventaire) est la priorité immédiate pour le mobile. La Partie 2 peut être développée en parallèle côté web, ou reportée si le mobile n'a pas besoin de validation de dossiers dans un premier temps.
