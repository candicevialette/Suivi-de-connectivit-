:: Script d insertion de lignes dans un fichier batch
:: Herve-hennes - 2015
:: version 0.1.0
 
::Ne pas écrire les commandes exécutées
@echo off
::Couleurs d affichage de la fenetre
color 0A
::Titre de la fenêtre
title Ajouter une entree dans le fichier host
 
::Ce script doit etre execute en administrateur
:: Cf. https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights#11995662
net session >null 2>1&
if %errorLevel% GTR 0) (
 goto erreur_droits
)
 
::Saisie du nom de domaine a ajouter au host
set /p host=Entrer le nom de domaine a ajouter au fichier host :
 
::Saisie du host par defaut
set /p ip=Entrer l ip vers laquelle doit pointer le host (defaut: 127.0.0.1) :
 
::Attribution de la valeur par defaut si pas d ip renseignee
if "%ip%"=="" (
  set ip=127.0.0.1
 )
 
 ::Ecriture de la ligne dans le fichier de host
 :: @ToDo Il faut verifier que l entree n existe pas
 echo %ip% %host% >> %SystemRoot%\system32\drivers\etc\hosts
 
 echo Nouvelle ligne inseree dans le fichier host
 
 ::Permet de ne fermer la fenête que lorsque l utilisateur appuie sur une touche
 pause > null
 exit
 
 :: Texte affiche si les droits d execution du fichier ne sont pas suffisants
 :erreur_droits
  echo Ce script doit etre lance en administrateur pour fonctionner
 
::Permet de ne fermer la fenêtre que lorsque l utilisateur appuie sur une touche
:: mettre pause > null pour ne pas afficher le message
pause