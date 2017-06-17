
# SERVEUR RUST

--------------------------------------------------
## UTILISATION DE BASE

### Pour télécharger l'image :

>docker pull sirpixel/rust

### pour exécuter l'image :

>docker run --restart always -p 28015-28016:28015-28016 -p 8080:80 -p 28015-28016:28015-28016/udp -v /home/docker/rust:/home/rustserver -itd --name rust sirpixel/rust

### Si vous souhaiter réaliser des modifications ou vérifier la console vous pouvez exécuter la commande

>docker attach rust
    
## LISTE DES COMMANDES POSSIBLES

Une fois dans le conteneur vous pouvez utiliser les commandes

> /home/rustserver/rustserver start   //Pour démarrer le serveur
 /home/rustserver/rustserver stop    //Pour stoper le serveur
 /home/rustserver/rustserver restart //Pour redémarrer le server
 /home/rustserver/rustserver update //Pour mettre a jour le serveur
 /home/rustserver/rustserver install //Pour installer le serveur
/home/rustserver/rustserver console  //Pour afficher le serveur

Ou directement en dehors du conteneur

>docker exec rust /home/rustserver/rustserver start   //Pour démarrer le serveur
docker exec rust /home/rustserver/rustserver stop    //Pour stoper le serveur
docker exec rust /home/rustserver/rustserver restart //Pour redémarrer le server
docker exec rust /home/rustserver/rustserver update //Pour mettre a jour le serveur
docker exec rust /home/rustserver/rustserver install //Pour installer le serveur
docker exec rust /home/rustserver/rustserver console  //Pour afficher le serveur

Vous pouvez retrouver la liste complète des commandes et de leur utilité ici
[https://gameservermanagers.com/lgsm/rustserver/](https://gameservermanagers.com/lgsm/rustserver/)

## Configuration du serveur

Vous pouvez modifier les informations sur le "port, ip, map etc.." ici 

### rustserver
>/home/rustserver/rustserver

### SOURCE

Cette image docker a été réalisé avec l'installateur automatique de [https://gameservermanagers.com/](https://gameservermanagers.com/)

### INFORMATION

Vous pouvez nous retrouver sur le forum de la communauté RAGECLIC 

[https://www.rageclic.fr/](https://www.rageclic.fr/)

ou sur le teamspeak 

[ts3.rageclic.fr](ts3server://ts3.rageclic.fr)


### Attention !!!!
Les ip failover peuvent rendre difficile la visibilité de votre serveur sur les listes steams et les listes de serveurs dans le jeu ou tout autre listes.
