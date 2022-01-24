-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (10/1/2022 16:35:53)
-- -----------------------------------------------------------------------------
--      Nom de la base : MLR2
--      Projet : Institut Catisa Coiffure
--      Auteur : ESIG
--      Date de dernière modification : 10/1/2022 16:31:19
-- -----------------------------------------------------------------------------

DROP TABLE ICC_RESERVATION CASCADE CONSTRAINTS;

DROP TABLE ICC_PRESTATION CASCADE CONSTRAINTS;

DROP TABLE ICC_USER CASCADE CONSTRAINTS;

DROP TABLE ICC_COMMANDE CASCADE CONSTRAINTS;

DROP TABLE ICC_CLIENT CASCADE CONSTRAINTS;

DROP TABLE ICC_STOCK CASCADE CONSTRAINTS;

DROP TABLE ICC_PRODUIT CASCADE CONSTRAINTS;

DROP TABLE QUANTITE_STOCK CASCADE CONSTRAINTS;

DROP TABLE RES_PRESTATION CASCADE CONSTRAINTS;

DROP TABLE ASSO_3 CASCADE CONSTRAINTS;

DROP TABLE COMMANDE_ITEM CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE MLR2;

-- -----------------------------------------------------------------------------
--       TABLE : ICC_RESERVATION
-- -----------------------------------------------------------------------------

CREATE TABLE ICC_RESERVATION
   (
    ID_RESERVATION NUMBER(2)  NOT NULL,
    ID_CLIENT NUMBER(2)  NOT NULL,
    COMMENTAIRE_RESERVATION CLOB  NULL,
    DATE_RESERVATION DATE  NULL,
    HEURE_RESERVATION DATE  NULL,
    STATUT_RESERVATION CHAR(32)  NULL
,   CONSTRAINT PK_ICC_RESERVATION PRIMARY KEY (ID_RESERVATION)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ICC_RESERVATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ICC_RESERVATION_ICC_CLIEN
     ON ICC_RESERVATION (ID_CLIENT ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ICC_PRESTATION
-- -----------------------------------------------------------------------------

CREATE TABLE ICC_PRESTATION
   (
    ID_PRESTATION NUMBER(2)  NOT NULL,
    NOM_PRESTATION CHAR(32)  NULL,
    DUREE_PRESTATION DATE  NULL,
    STATUT_PRESTATION CHAR(32)  NULL,
    PRIX_PRESTATION NUMBER(10,2)  NULL
,   CONSTRAINT PK_ICC_PRESTATION PRIMARY KEY (ID_PRESTATION)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ICC_USER
-- -----------------------------------------------------------------------------

CREATE TABLE ICC_USER
   (
    ID_USER CHAR(32)  NOT NULL,
    USERNAME_USER VARCHAR2(128)  NULL,
    PASSWORD_USER VARCHAR2(128)  NULL,
    EMAIL_USER VARCHAR2(255)  NULL,
    LAST_LOGIN DATE  NULL,
    IS_SUPERUSER NUMBER(1)  NULL,
    LAST_NAME VARCHAR2(128)  NULL,
    IS_STAFF NUMBER(1)  NULL,
    IS_ACTIVE NUMBER(1)  NULL,
    DATE_JOINED DATE  NULL,
    FIRST_NAME VARCHAR2(128)  NULL
,   CONSTRAINT PK_ICC_USER PRIMARY KEY (ID_USER)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ICC_COMMANDE
-- -----------------------------------------------------------------------------

CREATE TABLE ICC_COMMANDE
   (
    ID_COMMANDE NUMBER(2)  NOT NULL,
    ID_CLIENT_EST_PASSÉE_PAR_UN NUMBER(2)  NOT NULL,
    DATE_HEURE_COMMANDE DATE  NULL,
    CLIENT_COMMANDE VARCHAR2(128)  NULL,
    STATUT_COMMANDE CHAR(32)  NULL,
    COMPLETE_COMMANDE NUMBER(1)  NULL,
    TRANSACTION_ID NUMBER(2)  NULL
,   CONSTRAINT PK_ICC_COMMANDE PRIMARY KEY (ID_COMMANDE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ICC_COMMANDE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ICC_COMMANDE_ICC_CLIENT
     ON ICC_COMMANDE (ID_CLIENT_EST_PASSÉE_PAR_UN ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ICC_CLIENT
-- -----------------------------------------------------------------------------

CREATE TABLE ICC_CLIENT
   (
    ID_CLIENT NUMBER(2)  NOT NULL,
    ID_USER CHAR(32)  NOT NULL,
    NOM_CLIENT CHAR(32)  NULL,
    PRENOM_CLIENT CHAR(32)  NULL,
    TELEPHONE_CLIENT NUMBER(4)  NULL,
    GENRE_CLIENT RAW(255)  NULL,
    STATUT_CLIENT CHAR(32)  NULL,
    USERNAME_USER VARCHAR2(128)  NULL,
    PASSWORD_USER VARCHAR2(128)  NULL,
    EMAIL_USER VARCHAR2(255)  NULL,
    LAST_LOGIN DATE  NULL,
    IS_SUPERUSER NUMBER(1)  NULL,
    LAST_NAME VARCHAR2(128)  NULL,
    IS_STAFF NUMBER(1)  NULL,
    IS_ACTIVE NUMBER(1)  NULL,
    DATE_JOINED DATE  NULL,
    FIRST_NAME VARCHAR2(128)  NULL
,   CONSTRAINT PK_ICC_CLIENT PRIMARY KEY (ID_CLIENT)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ICC_CLIENT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ICC_CLIENT_ICC_USER
     ON ICC_CLIENT (ID_USER ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ICC_STOCK
-- -----------------------------------------------------------------------------

CREATE TABLE ICC_STOCK
   (
    ID_STOCK NUMBER(2)  NOT NULL,
    DESCRIPTION_STOCK CLOB  NULL
,   CONSTRAINT PK_ICC_STOCK PRIMARY KEY (ID_STOCK)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ICC_PRODUIT
-- -----------------------------------------------------------------------------

CREATE TABLE ICC_PRODUIT
   (
    ID_PRODUIT NUMBER(2)  NOT NULL,
    NOM_PRODUIT CHAR(32)  NULL,
    TYPE_PRODUIT CHAR(32)  NULL,
    IMAGE_PRODUIT BLOB  NULL,
    CAPACITE_PRODUIT NUMBER(2)  NULL,
    STATUT_PRODUIT CHAR(32)  NULL,
    PRIXACHAT_PRODUIT NUMBER(10,2)  NULL,
    PRIXVENTE_PRODUIT NUMBER(10,2)  NULL
,   CONSTRAINT PK_ICC_PRODUIT PRIMARY KEY (ID_PRODUIT)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : QUANTITE_STOCK
-- -----------------------------------------------------------------------------

CREATE TABLE QUANTITE_STOCK
   (
    ID_PRODUIT NUMBER(2)  NOT NULL,
    ID_STOCK NUMBER(2)  NOT NULL,
    QUANTITEENSTOCK CHAR(32)  NULL,
    QUANTITEMAX CHAR(32)  NULL
,   CONSTRAINT PK_QUANTITE_STOCK PRIMARY KEY (ID_PRODUIT, ID_STOCK)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE QUANTITE_STOCK
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_QUANTITE_STOCK_ICC_PRODUI
     ON QUANTITE_STOCK (ID_PRODUIT ASC)
    ;

CREATE  INDEX I_FK_QUANTITE_STOCK_ICC_STOCK
     ON QUANTITE_STOCK (ID_STOCK ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : RES_PRESTATION
-- -----------------------------------------------------------------------------

CREATE TABLE RES_PRESTATION
   (
    ID_PRESTATION NUMBER(2)  NOT NULL,
    ID_RESERVATION NUMBER(2)  NOT NULL,
    DUREEEFFECTIVE_PRESTATION CHAR(32)  NULL,
    PRIX_PRESTATION CHAR(32)  NULL
,   CONSTRAINT PK_RES_PRESTATION PRIMARY KEY (ID_PRESTATION, ID_RESERVATION)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RES_PRESTATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RES_PRESTATION_ICC_PRESTA
     ON RES_PRESTATION (ID_PRESTATION ASC)
    ;

CREATE  INDEX I_FK_RES_PRESTATION_ICC_RESERV
     ON RES_PRESTATION (ID_RESERVATION ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ASSO_3
-- -----------------------------------------------------------------------------

CREATE TABLE ASSO_3
   (
    ID_RESERVATION NUMBER(2)  NOT NULL
,   CONSTRAINT PK_ASSO_3 PRIMARY KEY (ID_RESERVATION)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : COMMANDE_ITEM
-- -----------------------------------------------------------------------------

CREATE TABLE COMMANDE_ITEM
   (
    ID_PRODUIT NUMBER(2)  NOT NULL,
    ID_COMMANDE NUMBER(2)  NOT NULL,
    QUANTITECOMMANDE CHAR(32)  NULL,
    PRIXACHAT NUMBER(10,2)  NULL,
    PRIXVENTE NUMBER(10,2)  NULL,
    PRODUIT CHAR(32)  NULL
,   CONSTRAINT PK_COMMANDE_ITEM PRIMARY KEY (ID_PRODUIT, ID_COMMANDE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE COMMANDE_ITEM
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_COMMANDE_ITEM_ICC_PRODUIT
     ON COMMANDE_ITEM (ID_PRODUIT ASC)
    ;

CREATE  INDEX I_FK_COMMANDE_ITEM_ICC_COMMAND
     ON COMMANDE_ITEM (ID_COMMANDE ASC)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE ICC_RESERVATION ADD (
     CONSTRAINT FK_ICC_RESERVATION_ICC_CLIENT
          FOREIGN KEY (ID_CLIENT)
               REFERENCES ICC_CLIENT (ID_CLIENT))   ;

ALTER TABLE ICC_COMMANDE ADD (
     CONSTRAINT FK_ICC_COMMANDE_ICC_CLIENT
          FOREIGN KEY (ID_CLIENT_EST_PASSÉE_PAR_UN)
               REFERENCES ICC_CLIENT (ID_CLIENT))   ;

ALTER TABLE ICC_CLIENT ADD (
     CONSTRAINT FK_ICC_CLIENT_ICC_USER
          FOREIGN KEY (ID_USER)
               REFERENCES ICC_USER (ID_USER))   ;

ALTER TABLE QUANTITE_STOCK ADD (
     CONSTRAINT FK_QUANTITE_STOCK_ICC_PRODUIT
          FOREIGN KEY (ID_PRODUIT)
               REFERENCES ICC_PRODUIT (ID_PRODUIT))   ;

ALTER TABLE QUANTITE_STOCK ADD (
     CONSTRAINT FK_QUANTITE_STOCK_ICC_STOCK
          FOREIGN KEY (ID_STOCK)
               REFERENCES ICC_STOCK (ID_STOCK))   ;

ALTER TABLE RES_PRESTATION ADD (
     CONSTRAINT FK_RES_PRESTATION_ICC_PRESTATI
          FOREIGN KEY (ID_PRESTATION)
               REFERENCES ICC_PRESTATION (ID_PRESTATION))   ;

ALTER TABLE RES_PRESTATION ADD (
     CONSTRAINT FK_RES_PRESTATION_ICC_RESERVAT
          FOREIGN KEY (ID_RESERVATION)
               REFERENCES ICC_RESERVATION (ID_RESERVATION))   ;

ALTER TABLE ASSO_3 ADD (
     CONSTRAINT FK_ASSO_3_ICC_RESERVATION
          FOREIGN KEY (ID_RESERVATION)
               REFERENCES ICC_RESERVATION (ID_RESERVATION))   ;

ALTER TABLE COMMANDE_ITEM ADD (
     CONSTRAINT FK_COMMANDE_ITEM_ICC_PRODUIT
          FOREIGN KEY (ID_PRODUIT)
               REFERENCES ICC_PRODUIT (ID_PRODUIT))   ;

ALTER TABLE COMMANDE_ITEM ADD (
     CONSTRAINT FK_COMMANDE_ITEM_ICC_COMMANDE
          FOREIGN KEY (ID_COMMANDE)
               REFERENCES ICC_COMMANDE (ID_COMMANDE))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------