Kiosk SETUP

Besoin :
Avoir Google Chrome d'installé et s'assurer qu'il se trouve bien dans "C:\Program Files\Google\Chrome\Application\chrome.exe"

Installation du kiosk :
- Executer kiosksetup.exe
- Autoriser kiosksetup.exe à apporter des modifications sur l'appareil
- Entrer un nom d'utilisateur ( par defaut: "kiosk" )
- Entrer un mot de passe ( par defaut : "Kiosk75008 )
- Entrer à nouveau le mot de passe
- Confirmer les modifications
- Rebooter la machine
- Passer les premières autorisations lors du premier démarrage Windows

Après le reboot, il n'y a plus besoin de s'indentifier à chaque démarrage ou redémarrage de l'ordinateur. 
Sauf déconnexion de l'user ( Ctrl + alt + suppr ). L'identifiant et le mot de passe sont ceux rentrés pour l'installation du kiosk.
A l'ouverture de chaque session, l'application s'ouvre automatiquement après quelques secondes. Pour quitter l'app : "alt + f4" .

Pour désactiver le login automatique :
- Executer DisableAutoLogin.reg

Pour activer le login automatique :
- Executer EnableAutoLogin.reg

Explication du code :
L'explication du code se trouve en commentaire dans le code.