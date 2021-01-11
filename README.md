# Roadmap Projet Data Science
> Analyse de données provenant de l'assurance des motards.
> Objectif : Déterminer des profils types de motard qui vont changer de 2 roues en 2020.
> Problématique : Peut-on aider les concessionnaires moto à anticiper leur vente et à mieux cibler leur marketing ? 

# Sommaire des étapes :
- I- Avec les donnés que peuvent avoir les concessionnaires motos, peut-on former des profils types de motards qui vont changer de véhicules ?
- II- Avec les donnés que peuvent avoir les assurances motos, peut-on former des profils types de motards qui vont changer de véhicules ?
- III- Avec les réponses aux questionnaires en lien avec le covid où un changement en cours d'année, peut-on former des profils types de motards qui vont changer de véhicules ?
- IV- Peut-on trouver des profils types en fonctions de leur réponses aux questions ouvertes suivantes : 
	- avantages du confinement, 
	- inconvénient du confinement, 
	- les 3 premiers mots qui viennent à l’esprit quand on leur dit “2-roues et sortie du confinement”.

## I- Avec les donnés que peuvent avoir les concessionnaires motos, peut-on former des profils types de motards qui vont changer de véhicules ?
> Objectif : Pouvoir aider un concessionnaire à faire des relances où envoyer des promotions pour l'achat d'un véhicule chez eux à leur client les plus susceptible de changer de véhicule en 2020 grâce à la détermination de nos profils types 

### Les grandes étapes :

- Sélectionner les informations que peuvent avoir les concessionnaires sur leurs clients pour créer un sous data frame :
Nous avons sélectionné les questions suivantes : 
Situation familiale
Sexe du membre
Nombre de 2rm conduits par le membre
Nombre d'enfants à charge
Département d'habitation en France
Tranche d'âge du membre
Année de mise en circulation du 2rm 1
Cylindrée du 2rm 1
Segment du 2rm 1
Votre catégorie socioprofessionnelle 
**Aviez-vous l’intention de changer de 2-roues motorisé en 2020 ?**

Pour récupérer ses questions nous avons supposé que les concessionnaires pouvait avoir enregistré ces informations lors de l'achat ou de la demande de renseignement dans leur concession.
Pour la dernière question : *Aviez-vous l’intention de changer de 2-roues motorisé en 2020 ?*
Nous l'avons transformé pour une interprétation plus simple.
Les réponses possible étaient : 

- Non
- Oui, vous allez changer de 2-roues d'ici la fin de l'année
- Oui, vous avez déjà changé de 2-roues cette année
- Non, vous n'aviez pas l'intention d'en changer, mais vous avez changé d'avis
- Oui, vous aviez l'intention d'en changer, mais vous avez changé d'avis

Nous voulions avoir un résultat binaire :
Soit les personnes ont ou vont changer de 2rm **True** grâce aux questions :
- Oui, vous allez changer de 2-roues d'ici la fin de l'année
- Oui, vous avez déjà changé de 2-roues cette année
- Non, vous n'aviez pas l'intention d'en changer, mais vous avez changé d'avis

Soit les personnes ne vont pas changer de 2rm **False** grâce aux questions : 
- Non
- Oui, vous aviez l'intention d'en changer, mais vous avez changé d'avis


Avec ce sous data frame nous avons décidés de faire à l'aide du logiciel Weka passer dans un algorithme supervisé (avec la class binaire) afin de savoir si nous pouvions récupérer des profils types.
Nous en avons comparé plusieurs afin de maximiser nos chances d'avoir des résultats : 
Algorithme de tree, algorithme Ibk, et algorithme de bayes naïf.
L'algorithme Ibk nous as donnés les meilleurs résultats car il était le plus adaptés. Mais malheureusement il classifié correctement 18% des **True** ce qui n'est pas significativement plus élevé qu'un choix au hasard car il n'y a que 15% de **True** dans la base.

Donc à ce stage avec les données que nous avons nous ne sommes pas en mesure d'aider les concessionnaire. 
Ce qui pourrait faire changer cette conclusion serait d'avoir significativement plus de donnés et donc plus de donnés positives afin de pouvoir rapprocher les personnes entres-elles.


### Le but ensuite et de continuer d'avancer en rajoutant des questions et voir si ça permet de changer, puis nous passeront dans un algo non supervisé afin de voir si des colonnes qui sont tranchantes peuvent nous aider à améliorer nos résultats. Nous pourrons enfin comparer nos différents résultats et tirer nos conclusion.
