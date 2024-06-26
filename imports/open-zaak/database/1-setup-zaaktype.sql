CREATE EXTENSION

IF NOT EXISTS "uuid-ossp";
	INSERT INTO accounts_user (
		password
		,first_name
		,last_name
		,username
		,is_superuser
		,email
		,is_staff
		,is_active
		,date_joined
		)
	VALUES (
		'pbkdf2_sha256$150000$5dnJUqLDsmX0$EEbO4AGZqyp88ZCTu+7W2uGRLkdidlL4HkXWc8ZfZV8='
		,'Valtimo'
		,'Demo'
		,'demo'
		,true
		,'demo@valtimo.nl'
		,true
		,true
		,now()
		);

INSERT INTO catalogi_catalogus (
	_admin_name
	,uuid
	,domein
	,rsin
	,contactpersoon_beheer_naam
	,contactpersoon_beheer_telefoonnummer
	,contactpersoon_beheer_emailadres
	,_etag
	)
VALUES (
	'valtimo'
	,'8225508a-6840-413e-acc9-6422af120db1'
	,'VAL'
	,'002564440'
	,'Valtimo Demo'
	,'06-12345678'
	,'demo@valtimo.nl'
	,'_etag'
	);

INSERT INTO authorizations_applicatie (
	uuid
	,client_ids
	,label
	,heeft_alle_autorisaties
	)
VALUES (
	uuid_generate_v4()
	,'{valtimo_client}'
	,'Valtimo'
	,true
	);

INSERT INTO authorizations_applicatie (
	uuid
	,client_ids
	,label
	,heeft_alle_autorisaties
	)
VALUES (
	uuid_generate_v4()
	,'{opennotificaties}'
	,'Open notificaties'
	,true
	);

INSERT INTO authorizations_applicatie (
	uuid
	,client_ids
	,label
	,heeft_alle_autorisaties
	)
VALUES (
	uuid_generate_v4()
	,'{openformulieren}'
	,'Open Formulieren'
	,true
	);

INSERT INTO vng_api_common_jwtsecret (
	identifier
	,secret
	)
VALUES (
	'valtimo_client'
	,'e09b8bc5-5831-4618-ab28-41411304309d'
	);

INSERT INTO vng_api_common_jwtsecret (
	identifier
	,secret
	)
VALUES (
	'opennotificaties'
	,'opennotificaties'
	);

INSERT INTO vng_api_common_jwtsecret (
	identifier
	,secret
	)
VALUES (
	'openformulieren'
	,'openformulieren'
	);

INSERT INTO catalogi_zaaktype (
	id
	,datum_begin_geldigheid
	,datum_einde_geldigheid
	,concept
	,uuid
	,identificatie
	,zaaktype_omschrijving
	,zaaktype_omschrijving_generiek
	,vertrouwelijkheidaanduiding
	,doel
	,aanleiding
	,toelichting
	,indicatie_intern_of_extern
	,handeling_initiator
	,onderwerp
	,handeling_behandelaar
	,doorlooptijd_behandeling
	,servicenorm_behandeling
	,opschorting_en_aanhouding_mogelijk
	,verlenging_mogelijk
	,verlengingstermijn
	,trefwoorden
	,publicatie_indicatie
	,publicatietekst
	,verantwoordingsrelatie
	,versiedatum
	,producten_of_diensten
	,selectielijst_procestype
	,referentieproces_naam
	,referentieproces_link
	,catalogus_id
	,selectielijst_procestype_jaar
	,_etag
	)
VALUES (
	1
	,'2021-01-01'
	,NULL
	,false
	,'744ca059-f412-49d4-8963-5800e4afd486'
	,'bezwaar-behandelen'
	,'Bezwaar behandelen'
	,'Bezwaar behandelen'
	,'zaakvertrouwelijk'
	,'Een uitspraak doen op een ingekomen bezwaar tegen een eerder genomen besluit.'
	,'Er is een bezwaarschrift ontvangen tegen een besluit dat genomen is door de gemeente.'
	,'Conform de Algemene Wet Bestuursrecht (AWB) heeft een natuurlijk of niet-natuurlijk persoon de mogelijkheid om bezwaar te maken tegen een genomen besluit van de gemeente, bijvoorbeeld het niet verlenen van een vergunning.'
	,'extern'
	,'Indienen'
	,'Bezwaar'
	,'Behandelen'
	,'84 days'
	,NULL
	,false
	,true
	,'42 days'
	,'{bezwaar,bezwaarschrift}'
	,false
	,''
	,'{}'
	,'2021-01-01'
	,'{https://github.com/valtimo-platform/valtimo-platform}'
	,'https://selectielijst.openzaak.nl/api/v1/procestypen/e1b73b12-b2f6-4c4e-8929-94f84dd2a57d'
	,'Bezwaar behandelen'
	,'http://www.gemmaonline.nl/index.php/Referentieproces_bezwaar_behandelen'
	,1
	,2017
	,'_etag'
	);

INSERT INTO catalogi_statustype (
	id
	,uuid
	,statustype_omschrijving
	,statustype_omschrijving_generiek
	,statustypevolgnummer
	,informeren
	,statustekst
	,toelichting
	,zaaktype_id
	,_etag
	)
VALUES (
	2
	,uuid_generate_v4()
	,'Intake afgerond'
	,'Intake afgerond'
	,1
	,true
	,'Geachte heer/mevrouw, Op %ZAAK. Registratiedatum% heeft u een bezwaar ingediend. Uw bezwaar is bij ons in behandeling genomen onder zaaknummer %ZAAK. Zaakidentificatie%. Wij vragen u dit zaaknummer te gebruiken in geval van correspondentie over dit bezwaar cq. deze zaak.  U wordt per e-mail op de hoogte gehouden van de status van de behandeling van uw bezwaar.'
	,'Initiële status van de zaak waarbij het bezwaarschrift ontvangen is en naar aanleiding daarvan de zaak aangemaakt en de behandelaar bepaald is. De indiener is een ontvangstbevestiging van zijn (of haar) bezwaar gezonden.'
	,1
	,'_etag'
	);

INSERT INTO catalogi_statustype (
	id
	,uuid
	,statustype_omschrijving
	,statustype_omschrijving_generiek
	,statustypevolgnummer
	,informeren
	,statustekst
	,toelichting
	,zaaktype_id
	,_etag
	)
VALUES (
	3
	,uuid_generate_v4()
	,'Indieningsvereisten getoetst'
	,'Indieningsvereisten getoetst'
	,2
	,true
	,'Geachte heer/mevrouw, Op %ZAAK.Registratiedatum% heeft u een bezwaar ingediend. Uw bezwaar is bij ons in behandeling onder zaaknummer %ZAAK.Zaakidentificatie% en is compleet bevonden. Dit houdt in dat wij uw bezwaar gaan beoordelen.  U wordt per e-mail op de hoogte gehouden van de status van de behandeling van uw bezwaar.'
	,'Het ingediende bezwaar is getoetst op de indieningsvereisten. De uitkomst van deze toets wordt vastgelegd in de eigenschap Uitslag toetsing. Indien er niet aan de indieningseisen wordt voldaan, dan wordt het bezwaar niet-ontvankelijk verklaard en kunnen de volgende vier statussen worden overgeslagen.'
	,1
	,'_etag'
	);

INSERT INTO catalogi_statustype (
	id
	,uuid
	,statustype_omschrijving
	,statustype_omschrijving_generiek
	,statustypevolgnummer
	,informeren
	,statustekst
	,toelichting
	,zaaktype_id
	,_etag
	)
VALUES (
	4
	,uuid_generate_v4()
	,'Bezwaar beoordeeld'
	,'Bezwaar beoordeeld'
	,3
	,true
	,'Geachte heer/mevrouw, Op %ZAAK.Registratiedatum% heeft u een bezwaar ingediend. Uw bezwaar is bij ons in behandeling onder zaaknummer %ZAAK.Zaakidentificatie%. Wij hebben uw bezwaar beoordeeld en gaan nu de hoorzitting voorbereiden.  U wordt per e-mail op de hoogte gehouden van de status van de behandeling van uw bezwaar.'
	,'Het ingediende bezwaar is inhoudelijk beoordeeld. Indien gegrond dan is, indien mogelijk, het besluit herroepen of aangepast. Indien niet gegrond dan heeft, indien van toepassing, mediation plaatsgevonden. Indien het besluit als gegrond is beoordeeld of indien mediation heeft geleid tot overeenstemming, dan wordt de volgende status overgeslagen. In het andere geval wordt een statusmelding verzonden.'
	,1
	,'_etag'
	);

INSERT INTO catalogi_statustype (
	id
	,uuid
	,statustype_omschrijving
	,statustype_omschrijving_generiek
	,statustypevolgnummer
	,informeren
	,statustekst
	,toelichting
	,zaaktype_id
	,_etag
	)
VALUES (
	5
	,uuid_generate_v4()
	,'Hoorzitting gehouden'
	,'Hoorzitting gehouden'
	,4
	,false
	,''
	,'Er is een verweerschrift opgesteld en verstuurd, een pleitnota is opgesteld en er heeft een hoorzitting plaatsgevonden. De bezwarencommissie heeft een advies uitgebracht.'
	,1
	,'_etag'
	);

INSERT INTO catalogi_statustype (
	id
	,uuid
	,statustype_omschrijving
	,statustype_omschrijving_generiek
	,statustypevolgnummer
	,informeren
	,statustekst
	,toelichting
	,zaaktype_id
	,_etag
	)
VALUES (
	6
	,uuid_generate_v4()
	,'Concept-besluit opgesteld'
	,'Concept-besluit opgesteld'
	,5
	,false
	,''
	,'Het conceptbesluit voor de beslisser is opgesteld, indien van toepassing op basis van het advies van de bezwarencommissie.'
	,1
	,'_etag'
	);

INSERT INTO catalogi_statustype (
	id
	,uuid
	,statustype_omschrijving
	,statustype_omschrijving_generiek
	,statustypevolgnummer
	,informeren
	,statustekst
	,toelichting
	,zaaktype_id
	,_etag
	)
VALUES (
	7
	,uuid_generate_v4()
	,'Besluit vastgesteld'
	,'Besluit vastgesteld'
	,6
	,true
	,'Geachte heer/mevrouw, Op %ZAAK.Registratiedatum% hebben wij heeft u een bezwaar ingediend. Uw bezwaar is bij ons in behandeling onder zaaknummer %ZAAK.Zaakidentificatie%.  De gemeente heeft een besluit genomen over uw bezwaar onder besluitnummer %BESLUIT. Besluitidentificatie%.  Het besluit van de gemeente is:  %BESLUIT.Toelichting%  Het schriftelijke besluit op uw bezwaar inclusief motivatie wordt zo spoedig mogelijk per post naar u toegestuurd.'
	,'De uitspraak op het bezwaar is vastgesteld door de beslisser.'
	,1
	,'_etag'
	);

INSERT INTO catalogi_statustype (
	id
	,uuid
	,statustype_omschrijving
	,statustype_omschrijving_generiek
	,statustypevolgnummer
	,informeren
	,statustekst
	,toelichting
	,zaaktype_id
	,_etag
	)
VALUES (
	8
	,uuid_generate_v4()
	,'Zaak afgerond'
	,'Zaak afgerond'
	,7
	,true
	,'Geachte heer/mevrouw, Op %ZAAK. Registratiedatum% heeft u een bezwaar ingediend. Uw bezwaar is bij ons in behandeling onder zaaknummer %ZAAK.Zaakidentificatie%. Onlangs bent u al op de hoogte gesteld van het besluit. Met deze e-mail willen wij u mededelen dat het besluit per post naar u is toegestuurd en dat wij de zaak hebben afgesloten.'
	,'Het besluit is schriftelijk kenbaar gemaakt aan de indiener van het bezwaar. De zaak is gearchiveerd en afgehandeld.'
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschapspecificatie (
	id
	,groep
	,formaat
	,lengte
	,kardinaliteit
	,waardenverzameling
	)
VALUES (
	1
	,'tekst'
	,'tekst'
	,100
	,1
	,'{}'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	1
	,''
	,uuid_generate_v4()
	,'voornaam'
	,'voornaam'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	2
	,''
	,uuid_generate_v4()
	,'achternaam'
	,'achternaam'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	3
	,''
	,uuid_generate_v4()
	,'bsn'
	,'bsn'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	4
	,''
	,uuid_generate_v4()
	,'bezwaar'
	,'bezwaar'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	5
	,''
	,uuid_generate_v4()
	,'straatnaam'
	,'straatnaam'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	6
	,''
	,uuid_generate_v4()
	,'huisnummer'
	,'huisnummer'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	7
	,''
	,uuid_generate_v4()
	,'toevoeging'
	,'toevoeging'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	8
	,''
	,uuid_generate_v4()
	,'postcode'
	,'postcode'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	9
	,''
	,uuid_generate_v4()
	,'plaats'
	,'plaats'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	10
	,''
	,uuid_generate_v4()
	,'telefoonnummer'
	,'telefoonnummer'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	11
	,''
	,uuid_generate_v4()
	,'e-mailadres'
	,'e-mailadres'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	12
	,''
	,uuid_generate_v4()
	,'zaaknummer'
	,'zaaknummer'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	13
	,''
	,uuid_generate_v4()
	,'datumBesluit'
	,'datumBesluit'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	14
	,''
	,uuid_generate_v4()
	,'besluit'
	,'besluit'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	15
	,''
	,uuid_generate_v4()
	,'communicatie'
	,'communicatie'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	16
	,''
	,uuid_generate_v4()
	,'beslissingBezwaar'
	,'beslissingBezwaar'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	17
	,''
	,uuid_generate_v4()
	,'naamBehandelaar'
	,'naamBehandelaar'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	18
	,''
	,uuid_generate_v4()
	,'e-mailBehandelaar'
	,'e-mailBehandelaar'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	19
	,''
	,uuid_generate_v4()
	,'aanvraagAanvulInfo'
	,'aanvraagAanvulInfo'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	20
	,''
	,uuid_generate_v4()
	,'aanvullendeInfo'
	,'aanvullendeInfo'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_eigenschap (
	id
	,toelichting
	,uuid
	,eigenschapnaam
	,definitie
	,specificatie_van_eigenschap_id
	,zaaktype_id
	,_etag
	)
VALUES (
	21
	,''
	,uuid_generate_v4()
	,'naamBeslisser'
	,'naamBeslisser'
	,1
	,1
	,'_etag'
	);

INSERT INTO catalogi_roltype (
	id
	,uuid
	,omschrijving
	,omschrijving_generiek
	,zaaktype_id
	,_etag
	)
VALUES (
	1
	,'1c359a1b-c38d-47b8-bed5-994db88ead61'
	,'Aanvrager'
	,'initiator'
	,1
	,'_etag'
	);

INSERT INTO catalogi_informatieobjecttype (
	id
	,datum_begin_geldigheid
	,datum_einde_geldigheid
	,concept
	,uuid
	,omschrijving
	,vertrouwelijkheidaanduiding
	,catalogus_id
	,_etag
	)
VALUES (
	1
	,'2021-10-04'
	,NULL
	,false
	,'efc332f2-be3b-4bad-9e3c-49a6219c92ad'
	,'test'
	,'zaakvertrouwelijk'
	,1
	,'_etag'
	);

INSERT INTO catalogi_zaaktypeinformatieobjecttype (
	id
	,uuid
	,volgnummer
	,richting
	,informatieobjecttype_id
	,statustype_id
	,zaaktype_id
	,_etag
	)
VALUES (
	1
	,'405da8a9-7296-439c-a2eb-a470b84f17ee'
	,1
	,'inkomend'
	,1
	,NULL
	,1
	,'_etag'
	);

UPDATE notifications_notificationsconfig
SET api_root = 'http://host.docker.internal:8002/api/v1/';

DELETE
FROM zgw_consumers_service
WHERE id = 1;

INSERT INTO zgw_consumers_service (
	id
	,label
	,api_type
	,api_root
	,client_id
	,secret
	,auth_type
	,header_key
	,header_value
	,oas
	,nlx
	,user_id
	,user_representation
	,oas_file
	)
VALUES (
	1
	,'Open formulieren'
	,'nrc'
	,'http://host.docker.internal:8002/api/v1/'
	,'openzaak'
	,'openzaak'
	,'zgw'
	,''
	,''
	,'http://host.docker.internal:8002/api/v1/schema/openapi.yaml'
	,''
	,''
	,''
	,''
	);

INSERT INTO zaken_zaakidentificatie (
	id
	,identificatie
	,bronorganisatie
	)
VALUES (
	1
	,'ZAAK-2021-0000000001'
	,'100000009'
	);

INSERT INTO zaken_zaakidentificatie (
	id
	,identificatie
	,bronorganisatie
	)
VALUES (
	2
	,'ZAAK-2021-0000000002'
	,'100000009'
	);

INSERT INTO zaken_zaakidentificatie (
	id
	,identificatie
	,bronorganisatie
	)
VALUES (
	3
	,'ZAAK-2021-0000000003'
	,'100000009'
	);
	
INSERT INTO zaken_zaakidentificatie (
	id
	,identificatie
	,bronorganisatie
	)
VALUES (
	4
	,'ZAAK-2021-0000000004'
	,'100000009'
	);

INSERT INTO zaken_zaakidentificatie (
	id
	,identificatie
	,bronorganisatie
	)
VALUES (
	5
	,'ZAAK-2021-0000000005'
	,'100000009'
	);

INSERT INTO zaken_zaakidentificatie (
	id
	,identificatie
	,bronorganisatie
	)
VALUES (
	6
	,'ZAAK-2021-0000000006'
	,'100000009'
	);
	INSERT INTO zaken_zaakidentificatie (
	id
	,identificatie
	,bronorganisatie
	)
VALUES (
	7
	,'ZAAK-2021-0000000007'
	,'100000009'
	);
	INSERT INTO zaken_zaakidentificatie (
	id
	,identificatie
	,bronorganisatie
	)
VALUES (
	8
	,'ZAAK-2021-0000000008'
	,'100000009'
	);
	
	INSERT INTO zaken_zaakidentificatie (
	id
	,identificatie
	,bronorganisatie
	)
VALUES (
	9
	,'ZAAK-2021-0000000009'
	,'100000009'
	);
	
	

SELECT setval(pg_get_serial_sequence('zaken_zaakidentificatie', 'id'), 1, true);


INSERT INTO zaken_zaak (
	id
	,uuid
	,identificatie
	,bronorganisatie
	,omschrijving
	,toelichting
	,registratiedatum
	,verantwoordelijke_organisatie
	,startdatum
	,einddatum
	,einddatum_gepland
	,uiterlijke_einddatum_afdoening
	,publicatiedatum
	,producten_of_diensten
	,communicatiekanaal
	,vertrouwelijkheidaanduiding
	,betalingsindicatie
	,laatste_betaaldatum
	,zaakgeometrie
	,verlenging_reden
	,verlenging_duur
	,opschorting_indicatie
	,opschorting_reden
	,selectielijstklasse
	,archiefnominatie
	,archiefstatus
	,archiefactiedatum
	,_zaaktype_id
	,hoofdzaak_id
	,_etag
	,opdrachtgevende_organisatie
	,_zaaktype_base_url_id
	,_zaaktype_relative_url
	,identificatie_ptr_id
	)
VALUES (
	1
	,'703af290-abe0-418c-b9c3-10a65e662788'
	,'ZAAK-2021-0000000001'
	,'051845623'
	,''
	,''
	,now()
	,'051845623'
	,now()
	,NULL
	,NULL
	,NULL
	,NULL
	,'{}'
	,''
	,'openbaar'
	,''
	,NULL
	,NULL
	,''
	,NULL
	,false
	,''
	,''
	,NULL
	,'nog_te_archiveren'
	,NULL
	,1
	,1
	,'_etag'
	,'051845623'
	,NULL
	,NULL
	,1
	);

INSERT INTO zaken_zaak (
	id
	,uuid
	,identificatie
	,bronorganisatie
	,omschrijving
	,toelichting
	,registratiedatum
	,verantwoordelijke_organisatie
	,startdatum
	,einddatum
	,einddatum_gepland
	,uiterlijke_einddatum_afdoening
	,publicatiedatum
	,producten_of_diensten
	,communicatiekanaal
	,vertrouwelijkheidaanduiding
	,betalingsindicatie
	,laatste_betaaldatum
	,zaakgeometrie
	,verlenging_reden
	,verlenging_duur
	,opschorting_indicatie
	,opschorting_reden
	,selectielijstklasse
	,archiefnominatie
	,archiefstatus
	,archiefactiedatum
	,_zaaktype_id
	,hoofdzaak_id
	,_etag
	,opdrachtgevende_organisatie
	,_zaaktype_base_url_id
	,_zaaktype_relative_url
	,identificatie_ptr_id
	)
VALUES (
	2
	,'60b30357-e81c-40f7-80cf-cd715e01a981'
	,'ZAAK-2021-0000000002'
	,'051845623'
	,''
	,''
	,now()
	,'051845623'
	,now()
	,NULL
	,NULL
	,NULL
	,NULL
	,'{}'
	,''
	,'openbaar'
	,''
	,NULL
	,NULL
	,''
	,NULL
	,false
	,''
	,''
	,NULL
	,'nog_te_archiveren'
	,NULL
	,1
	,2
	,'_etag'
	,'051845623'
	,NULL
	,NULL
	,2
	);

INSERT INTO zaken_zaak (
	id
	,uuid
	,identificatie
	,bronorganisatie
	,omschrijving
	,toelichting
	,registratiedatum
	,verantwoordelijke_organisatie
	,startdatum
	,einddatum
	,einddatum_gepland
	,uiterlijke_einddatum_afdoening
	,publicatiedatum
	,producten_of_diensten
	,communicatiekanaal
	,vertrouwelijkheidaanduiding
	,betalingsindicatie
	,laatste_betaaldatum
	,zaakgeometrie
	,verlenging_reden
	,verlenging_duur
	,opschorting_indicatie
	,opschorting_reden
	,selectielijstklasse
	,archiefnominatie
	,archiefstatus
	,archiefactiedatum
	,_zaaktype_id
	,hoofdzaak_id
	,_etag
	,opdrachtgevende_organisatie
	,_zaaktype_base_url_id
	,_zaaktype_relative_url
	,identificatie_ptr_id
	)
VALUES (
	3
	,'59a4e114-cc09-4a09-b324-63ec7e18a896'
	,'ZAAK-2021-0000000003'
	,'051845623'
	,''
	,''
	,now()
	,'051845623'
	,now()
	,NULL
	,NULL
	,NULL
	,NULL
	,'{}'
	,''
	,'openbaar'
	,''
	,NULL
	,NULL
	,''
	,NULL
	,false
	,''
	,''
	,NULL
	,'nog_te_archiveren'
	,NULL
	,1
	,3
	,'_etag'
	,'051845623'
	,NULL
	,NULL
	,3
	);
	
	INSERT INTO zaken_zaak (
	id
	,uuid
	,identificatie
	,bronorganisatie
	,omschrijving
	,toelichting
	,registratiedatum
	,verantwoordelijke_organisatie
	,startdatum
	,einddatum
	,einddatum_gepland
	,uiterlijke_einddatum_afdoening
	,publicatiedatum
	,producten_of_diensten
	,communicatiekanaal
	,vertrouwelijkheidaanduiding
	,betalingsindicatie
	,laatste_betaaldatum
	,zaakgeometrie
	,verlenging_reden
	,verlenging_duur
	,opschorting_indicatie
	,opschorting_reden
	,selectielijstklasse
	,archiefnominatie
	,archiefstatus
	,archiefactiedatum
	,_zaaktype_id
	,hoofdzaak_id
	,_etag
	,opdrachtgevende_organisatie
	,_zaaktype_base_url_id
	,_zaaktype_relative_url
	,identificatie_ptr_id
	)
VALUES (
	4
	,'ba439c9a-5a2d-46da-bb30-7827bd672382'
	,'ZAAK-2021-0000000004'
	,'051845623'
	,''
	,''
	,now()
	,'051845623'
	,now()
	,NULL
	,NULL
	,NULL
	,NULL
	,'{}'
	,''
	,'openbaar'
	,''
	,NULL
	,NULL
	,''
	,NULL
	,false
	,''
	,''
	,NULL
	,'nog_te_archiveren'
	,NULL
	,1
	,4
	,'_etag'
	,'051845623'
	,NULL
	,NULL
	,4
	);
	
	INSERT INTO zaken_zaak (
	id
	,uuid
	,identificatie
	,bronorganisatie
	,omschrijving
	,toelichting
	,registratiedatum
	,verantwoordelijke_organisatie
	,startdatum
	,einddatum
	,einddatum_gepland
	,uiterlijke_einddatum_afdoening
	,publicatiedatum
	,producten_of_diensten
	,communicatiekanaal
	,vertrouwelijkheidaanduiding
	,betalingsindicatie
	,laatste_betaaldatum
	,zaakgeometrie
	,verlenging_reden
	,verlenging_duur
	,opschorting_indicatie
	,opschorting_reden
	,selectielijstklasse
	,archiefnominatie
	,archiefstatus
	,archiefactiedatum
	,_zaaktype_id
	,hoofdzaak_id
	,_etag
	,opdrachtgevende_organisatie
	,_zaaktype_base_url_id
	,_zaaktype_relative_url
	,identificatie_ptr_id
	)
VALUES (
	5
	,'1e1cb360-f6d3-4c2a-b815-119f09aaa95d'
	,'ZAAK-2021-0000000005'
	,'051845623'
	,''
	,''
	,now()
	,'051845623'
	,now()
	,NULL
	,NULL
	,NULL
	,NULL
	,'{}'
	,''
	,'openbaar'
	,''
	,NULL
	,NULL
	,''
	,NULL
	,false
	,''
	,''
	,NULL
	,'nog_te_archiveren'
	,NULL
	,1
	,5
	,'_etag'
	,'051845623'
	,NULL
	,NULL
	,5
	);
	
	INSERT INTO zaken_zaak (
	id
	,uuid
	,identificatie
	,bronorganisatie
	,omschrijving
	,toelichting
	,registratiedatum
	,verantwoordelijke_organisatie
	,startdatum
	,einddatum
	,einddatum_gepland
	,uiterlijke_einddatum_afdoening
	,publicatiedatum
	,producten_of_diensten
	,communicatiekanaal
	,vertrouwelijkheidaanduiding
	,betalingsindicatie
	,laatste_betaaldatum
	,zaakgeometrie
	,verlenging_reden
	,verlenging_duur
	,opschorting_indicatie
	,opschorting_reden
	,selectielijstklasse
	,archiefnominatie
	,archiefstatus
	,archiefactiedatum
	,_zaaktype_id
	,hoofdzaak_id
	,_etag
	,opdrachtgevende_organisatie
	,_zaaktype_base_url_id
	,_zaaktype_relative_url
	,identificatie_ptr_id
	)
VALUES (
	6
	,'f621749d-d222-49b8-9392-eff8723e0922'
	,'ZAAK-2021-0000000006'
	,'051845623'
	,''
	,''
	,now()
	,'051845623'
	,now()
	,NULL
	,NULL
	,NULL
	,NULL
	,'{}'
	,''
	,'openbaar'
	,''
	,NULL
	,NULL
	,''
	,NULL
	,false
	,''
	,''
	,NULL
	,'nog_te_archiveren'
	,NULL
	,1
	,6
	,'_etag'
	,'051845623'
	,NULL
	,NULL
	,6
	);
	
	INSERT INTO zaken_zaak (
	id
	,uuid
	,identificatie
	,bronorganisatie
	,omschrijving
	,toelichting
	,registratiedatum
	,verantwoordelijke_organisatie
	,startdatum
	,einddatum
	,einddatum_gepland
	,uiterlijke_einddatum_afdoening
	,publicatiedatum
	,producten_of_diensten
	,communicatiekanaal
	,vertrouwelijkheidaanduiding
	,betalingsindicatie
	,laatste_betaaldatum
	,zaakgeometrie
	,verlenging_reden
	,verlenging_duur
	,opschorting_indicatie
	,opschorting_reden
	,selectielijstklasse
	,archiefnominatie
	,archiefstatus
	,archiefactiedatum
	,_zaaktype_id
	,hoofdzaak_id
	,_etag
	,opdrachtgevende_organisatie
	,_zaaktype_base_url_id
	,_zaaktype_relative_url
	,identificatie_ptr_id
	)
VALUES (
	7
	,'8c0243f2-6f2c-4757-940a-5140d71b74a0'
	,'ZAAK-2021-0000000007'
	,'051845623'
	,''
	,''
	,now()
	,'051845623'
	,now()
	,NULL
	,NULL
	,NULL
	,NULL
	,'{}'
	,''
	,'openbaar'
	,''
	,NULL
	,NULL
	,''
	,NULL
	,false
	,''
	,''
	,NULL
	,'nog_te_archiveren'
	,NULL
	,1
	,7
	,'_etag'
	,'051845623'
	,NULL
	,NULL
	,7
	);
	
	INSERT INTO zaken_zaak (
	id
	,uuid
	,identificatie
	,bronorganisatie
	,omschrijving
	,toelichting
	,registratiedatum
	,verantwoordelijke_organisatie
	,startdatum
	,einddatum
	,einddatum_gepland
	,uiterlijke_einddatum_afdoening
	,publicatiedatum
	,producten_of_diensten
	,communicatiekanaal
	,vertrouwelijkheidaanduiding
	,betalingsindicatie
	,laatste_betaaldatum
	,zaakgeometrie
	,verlenging_reden
	,verlenging_duur
	,opschorting_indicatie
	,opschorting_reden
	,selectielijstklasse
	,archiefnominatie
	,archiefstatus
	,archiefactiedatum
	,_zaaktype_id
	,hoofdzaak_id
	,_etag
	,opdrachtgevende_organisatie
	,_zaaktype_base_url_id
	,_zaaktype_relative_url
	,identificatie_ptr_id
	)
VALUES (
	8
	,'7b18aa8c-968f-427e-9875-d827bbdc9624'
	,'ZAAK-2021-0000000008'
	,'051845623'
	,''
	,''
	,now()
	,'051845623'
	,now()
	,NULL
	,NULL
	,NULL
	,NULL
	,'{}'
	,''
	,'openbaar'
	,''
	,NULL
	,NULL
	,''
	,NULL
	,false
	,''
	,''
	,NULL
	,'nog_te_archiveren'
	,NULL
	,1
	,8
	,'_etag'
	,'051845623'
	,NULL
	,NULL
	,8
	);
	
	INSERT INTO zaken_zaak (
	id
	,uuid
	,identificatie
	,bronorganisatie
	,omschrijving
	,toelichting
	,registratiedatum
	,verantwoordelijke_organisatie
	,startdatum
	,einddatum
	,einddatum_gepland
	,uiterlijke_einddatum_afdoening
	,publicatiedatum
	,producten_of_diensten
	,communicatiekanaal
	,vertrouwelijkheidaanduiding
	,betalingsindicatie
	,laatste_betaaldatum
	,zaakgeometrie
	,verlenging_reden
	,verlenging_duur
	,opschorting_indicatie
	,opschorting_reden
	,selectielijstklasse
	,archiefnominatie
	,archiefstatus
	,archiefactiedatum
	,_zaaktype_id
	,hoofdzaak_id
	,_etag
	,opdrachtgevende_organisatie
	,_zaaktype_base_url_id
	,_zaaktype_relative_url
	,identificatie_ptr_id
	)
VALUES (
	9
	,'64eaf9ef-37b4-4898-acc9-ae47bee577a2'
	,'ZAAK-2021-0000000009'
	,'051845623'
	,''
	,''
	,now()
	,'051845623'
	,now()
	,NULL
	,NULL
	,NULL
	,NULL
	,'{}'
	,''
	,'openbaar'
	,''
	,NULL
	,NULL
	,''
	,NULL
	,false
	,''
	,''
	,NULL
	,'nog_te_archiveren'
	,NULL
	,1
	,9
	,'_etag'
	,'051845623'
	,NULL
	,NULL
	,9
	);

SELECT setval(pg_get_serial_sequence('zaken_zaak', 'id'), 1, true);


INSERT INTO zaken_rol (
	id
	,uuid
	,betrokkene
	,betrokkene_type
	,omschrijving
	,omschrijving_generiek
	,roltoelichting
	,registratiedatum
	,indicatie_machtiging
	,_roltype_id
	,zaak_id
	,_etag
	,_roltype_base_url_id
	,_roltype_relative_url
	)
VALUES (
	1
	,uuid_generate_v4()
	,1
	,'natuurlijk_persoon'
	,'Aanvrager'
	,'initiator'
	,'Test rol'
	,now()
	,'gemachtigde'
	,1
	,1
	,'_etag'
	,NULL
	,NULL
	);

INSERT INTO zaken_rol (
	id
	,uuid
	,betrokkene
	,betrokkene_type
	,omschrijving
	,omschrijving_generiek
	,roltoelichting
	,registratiedatum
	,indicatie_machtiging
	,_roltype_id
	,zaak_id
	,_etag
	,_roltype_base_url_id
	,_roltype_relative_url
	)
VALUES (
	2
	,uuid_generate_v4()
	,1
	,'natuurlijk_persoon'
	,'Aanvrager'
	,'initiator'
	,'Test rol'
	,now()
	,'gemachtigde'
	,1
	,2
	,'_etag'
	,NULL
	,NULL
	);

INSERT INTO zaken_rol (
	id
	,uuid
	,betrokkene
	,betrokkene_type
	,omschrijving
	,omschrijving_generiek
	,roltoelichting
	,registratiedatum
	,indicatie_machtiging
	,_roltype_id
	,zaak_id
	,_etag
	,_roltype_base_url_id
	,_roltype_relative_url
	)
VALUES (
	3
	,uuid_generate_v4()
	,1
	,'natuurlijk_persoon'
	,'Aanvrager'
	,'initiator'
	,'Test rol'
	,now()
	,'gemachtigde'
	,1
	,3
	,'_etag'
	,NULL
	,NULL
	);
	
	INSERT INTO zaken_rol (
	id
	,uuid
	,betrokkene
	,betrokkene_type
	,omschrijving
	,omschrijving_generiek
	,roltoelichting
	,registratiedatum
	,indicatie_machtiging
	,_roltype_id
	,zaak_id
	,_etag
	,_roltype_base_url_id
	,_roltype_relative_url
	)
VALUES (
	4
	,uuid_generate_v4()
	,1
	,'natuurlijk_persoon'
	,'Aanvrager'
	,'initiator'
	,'Test rol'
	,now()
	,'gemachtigde'
	,1
	,4
	,'_etag'
	,NULL
	,NULL
	);
	
	INSERT INTO zaken_rol (
	id
	,uuid
	,betrokkene
	,betrokkene_type
	,omschrijving
	,omschrijving_generiek
	,roltoelichting
	,registratiedatum
	,indicatie_machtiging
	,_roltype_id
	,zaak_id
	,_etag
	,_roltype_base_url_id
	,_roltype_relative_url
	)
VALUES (
	5
	,uuid_generate_v4()
	,1
	,'natuurlijk_persoon'
	,'Aanvrager'
	,'initiator'
	,'Test rol'
	,now()
	,'gemachtigde'
	,1
	,5
	,'_etag'
	,NULL
	,NULL
	);
	
	INSERT INTO zaken_rol (
	id
	,uuid
	,betrokkene
	,betrokkene_type
	,omschrijving
	,omschrijving_generiek
	,roltoelichting
	,registratiedatum
	,indicatie_machtiging
	,_roltype_id
	,zaak_id
	,_etag
	,_roltype_base_url_id
	,_roltype_relative_url
	)
VALUES (
	6
	,uuid_generate_v4()
	,1
	,'natuurlijk_persoon'
	,'Aanvrager'
	,'initiator'
	,'Test rol'
	,now()
	,'gemachtigde'
	,1
	,6
	,'_etag'
	,NULL
	,NULL
	);
	
	INSERT INTO zaken_rol (
	id
	,uuid
	,betrokkene
	,betrokkene_type
	,omschrijving
	,omschrijving_generiek
	,roltoelichting
	,registratiedatum
	,indicatie_machtiging
	,_roltype_id
	,zaak_id
	,_etag
	,_roltype_base_url_id
	,_roltype_relative_url
	)
VALUES (
	7
	,uuid_generate_v4()
	,1
	,'natuurlijk_persoon'
	,'Aanvrager'
	,'initiator'
	,'Test rol'
	,now()
	,'gemachtigde'
	,1
	,7
	,'_etag'
	,NULL
	,NULL
	);
	
	INSERT INTO zaken_rol (
	id
	,uuid
	,betrokkene
	,betrokkene_type
	,omschrijving
	,omschrijving_generiek
	,roltoelichting
	,registratiedatum
	,indicatie_machtiging
	,_roltype_id
	,zaak_id
	,_etag
	,_roltype_base_url_id
	,_roltype_relative_url
	)
VALUES (
	8
	,uuid_generate_v4()
	,1
	,'natuurlijk_persoon'
	,'Aanvrager'
	,'initiator'
	,'Test rol'
	,now()
	,'gemachtigde'
	,1
	,8
	,'_etag'
	,NULL
	,NULL
	);

INSERT INTO zaken_rol (
	id
	,uuid
	,betrokkene
	,betrokkene_type
	,omschrijving
	,omschrijving_generiek
	,roltoelichting
	,registratiedatum
	,indicatie_machtiging
	,_roltype_id
	,zaak_id
	,_etag
	,_roltype_base_url_id
	,_roltype_relative_url
	)
VALUES (
	9
	,uuid_generate_v4()
	,1
	,'natuurlijk_persoon'
	,'Aanvrager'
	,'initiator'
	,'Test rol'
	,now()
	,'gemachtigde'
	,1
	,9
	,'_etag'
	,NULL
	,NULL
	);

SELECT setval(pg_get_serial_sequence('zaken_rol', 'id'), 1, true);


INSERT INTO zaken_natuurlijkpersoon (
	id
	,inp_bsn
	,anp_identificatie
	,inp_a_nummer
	,geslachtsnaam
	,voorvoegsel_geslachtsnaam
	,voorletters
	,voornamen
	,geslachtsaanduiding
	,geboortedatum
	,rol_id
	)
VALUES (
	1
	,'569312863'
	,''
	,''
	,''
	,''
	,''
	,''
	,'m'
	,''
	,1
	);

INSERT INTO zaken_natuurlijkpersoon (
	id
	,inp_bsn
	,anp_identificatie
	,inp_a_nummer
	,geslachtsnaam
	,voorvoegsel_geslachtsnaam
	,voorletters
	,voornamen
	,geslachtsaanduiding
	,geboortedatum
	,rol_id
	)
VALUES (
	2
	,'569312863'
	,''
	,''
	,''
	,''
	,''
	,''
	,'m'
	,''
	,2
	);

INSERT INTO zaken_natuurlijkpersoon (
	id
	,inp_bsn
	,anp_identificatie
	,inp_a_nummer
	,geslachtsnaam
	,voorvoegsel_geslachtsnaam
	,voorletters
	,voornamen
	,geslachtsaanduiding
	,geboortedatum
	,rol_id
	)
VALUES (
	3
	,'569312863'
	,''
	,''
	,''
	,''
	,''
	,''
	,'m'
	,''
	,3
	);
	
	INSERT INTO zaken_natuurlijkpersoon (
	id
	,inp_bsn
	,anp_identificatie
	,inp_a_nummer
	,geslachtsnaam
	,voorvoegsel_geslachtsnaam
	,voorletters
	,voornamen
	,geslachtsaanduiding
	,geboortedatum
	,rol_id
	)
VALUES (
	4
	,'569312863'
	,''
	,''
	,''
	,''
	,''
	,''
	,'m'
	,''
	,4
	);
	
	INSERT INTO zaken_natuurlijkpersoon (
	id
	,inp_bsn
	,anp_identificatie
	,inp_a_nummer
	,geslachtsnaam
	,voorvoegsel_geslachtsnaam
	,voorletters
	,voornamen
	,geslachtsaanduiding
	,geboortedatum
	,rol_id
	)
VALUES (
	5
	,'569312863'
	,''
	,''
	,''
	,''
	,''
	,''
	,'m'
	,''
	,5
	);
	
	INSERT INTO zaken_natuurlijkpersoon (
	id
	,inp_bsn
	,anp_identificatie
	,inp_a_nummer
	,geslachtsnaam
	,voorvoegsel_geslachtsnaam
	,voorletters
	,voornamen
	,geslachtsaanduiding
	,geboortedatum
	,rol_id
	)
VALUES (
	6
	,'569312863'
	,''
	,''
	,''
	,''
	,''
	,''
	,'m'
	,''
	,6
	);
	
	INSERT INTO zaken_natuurlijkpersoon (
	id
	,inp_bsn
	,anp_identificatie
	,inp_a_nummer
	,geslachtsnaam
	,voorvoegsel_geslachtsnaam
	,voorletters
	,voornamen
	,geslachtsaanduiding
	,geboortedatum
	,rol_id
	)
VALUES (
	7
	,'569312863'
	,''
	,''
	,''
	,''
	,''
	,''
	,'m'
	,''
	,7
	);
	
	INSERT INTO zaken_natuurlijkpersoon (
	id
	,inp_bsn
	,anp_identificatie
	,inp_a_nummer
	,geslachtsnaam
	,voorvoegsel_geslachtsnaam
	,voorletters
	,voornamen
	,geslachtsaanduiding
	,geboortedatum
	,rol_id
	)
VALUES (
	8
	,'569312863'
	,''
	,''
	,''
	,''
	,''
	,''
	,'m'
	,''
	,8
	);
	
INSERT INTO zaken_natuurlijkpersoon (
	id
	,inp_bsn
	,anp_identificatie
	,inp_a_nummer
	,geslachtsnaam
	,voorvoegsel_geslachtsnaam
	,voorletters
	,voornamen
	,geslachtsaanduiding
	,geboortedatum
	,rol_id
	)
VALUES (
	9
	,'569312863'
	,''
	,''
	,''
	,''
	,''
	,''
	,'m'
	,''
	,9
	);

SELECT setval(pg_get_serial_sequence('zaken_natuurlijkpersoon', 'id'), 1, true);
