require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


#binding.pry



    puts
    	"------------------------------------------------
    	|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
    	|Le but du jeu est d'être le dernier survivant !|
    	-------------------------------------------------"

    print "Par quel nom souhaitez-vous que je vous appelle ?" #name
    	name = gets.chomp #
    	player1 = HumanPlayer.new # Initialisation du joueur: ensuite, le jeu va demander à l'utilisateur son prénom et créer un HumanPlayer portant ce prénom.
    	array_ennemies = [ennemy1 = Player.new("Josiane"), ennemy2 = Player.new("José")] # Initialisation des ennemis : le jeu va maintenant créer nos deux combattants préférés, "Josiane" et "José".
    																					  # Comme nous savons qu'à terme (version 3.0) il y aura plus de 2 ennemis, on va mettre en place une astuce pour manipuler facilement un groupe d'ennemis : le jeu va créer un array enemies qui va contenir les deux objets Player que sont José et Josiane. Tu verras plus tard l'usage qu'on va en faire.
    

    # Le combat : tout comme dans la version 1.0, on peut maintenant lancer 
    # le combat ! Tu vas ouvrir une boucle while qui ne doit s'arrêter que si 
    # le joueur de l'utilisateur (HumanPlayer) meurt 

    # ou si les 2 joueurs "bots" (Player) meurent. 

    # Cette condition d'arrêt n'est pas triviale à écrire 
    # mais je te propose d'essayer ! Sinon la réponse est disponible plus bas. 
    # laisse la boucle while vide pour le moment, on la codera juste après.


     while player1.life_points >0 && (ennemy1.life_points > 0 || ennemy2.life_points >0)

#  Voici ce que tu vas mettre dans la boucle while :

#     Tout d'abord, on te donne la condition d'arrêt de la boucle 
#  	  en partant de l'hypothèse que tu as stocké le HumanPlayer 
#	  dans la variable user et les deux Player dans les variables player1 et player2.

#     while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
#       ...
#     end

#     La première chose qu'on va faire à chaque tour de combat, 

#     c'est afficher l'état du HumanPlayer : rajoute cela.

		puts player1.show_state

#     Ensuite, on va proposer un menu qui doit ressembler à cela :

#     Quelle action veux-tu effectuer ?

#     a - chercher une meilleure arme
#     s - chercher à se soigner 

#     attaquer un joueur en vue :
#     0 - Josiane a 10 points de vie
#     1 - José a 10 points de vie

		puts "Quelle action veux-tu effectuer ?\n\n"
		puts "a - chercher une meilleure arme \ns - chercher à se soigner\n"

#     Évidemment la partie "Josiane a 10 points de vie" et "José a 10 points de vie" 
# 	  devra se mettre à jour quand ils vont recevoir des dégâts. 
# 	  Tu dois donc utiliser la méthode show_state dans cette partie du menu 
# 	  pour afficher l'état réel de chaque Player que l'utilisateur combat.
	
		puts "attaquer un joueur en vue :"
		  array_ennemies.each_with_index do |enemy,index|
			puts "Joueur #{index} : #{ennemy.show_state} points de vie" #pas de 0 ou 1 comme choix d'entrée ---> grâce à l'index
			puts "--->"
	end

#     Une fois cela fait, on laisse l'utilisateur effectuer une saisie. Et en fonction de la saisie, on va :
#         si l'utilisateur tape "a", exécuter sur son HumanPlayer la méthode qui le fait partir à la recherche d'une arme ;
#         si l'utilisateur tape "s", exécuter sur son HumanPlayer la méthode qui le fait partir à la recherche d'un pack de soin ;
#         si l'utilisateur tape "0", faire attaquer Josiane par son Human Player ;
#         si l'utilisateur tape "1", faire attaquer José par son Human Player ;

		choice = gets.chomp
		case choice
			when "a" then player1.search_weapon
			when "s" then player1.search_health_pack
			when "0" then player1.attacks(ennemy1) if ennemy1.life_points > 0
			when "1" then player2.attacks(ennemy1) if ennemy2.life_points > 0
			else
				puts "Demandez moi autre chose."
		end


#     C'est maintenant au tour des ennemis de riposter ! 
#     Tu peux l'indiquer en affichant en console un petit 
#     puts "Les autres joueurs t'attaquent !"

    	puts "Les autres joueurs t'attaquent !!!"

#     On va faire que les 2 Player attaquent le HumanPlayer.
#     Mais au lieu d'écrire 2 lignes quasiment identiques 
#     en mode player1.attacks(user) et player2.attacks(user), 
#     je veux que tu utilises l'array enemies contenant les 2 objets Player. 

#     L'idée est de faire une boucle each sur cet array pour ensuite 
#     exécuter la méthode attacks sur chaque objet. 
#     Pourquoi ? Tout simplement car on anticipe là le fait qu'il y aura bientôt 
#     10 ou 20 ou 30 Player : on va pas se taper 10 ou 20 ou 30 lignes 
#     de playerX.attacks(user) !

    	array_ennemies.select{|enemy| enemy.life_points > 0}.each do |enemy| enemy.attacks(player1) end


#     Ha oui, un petit dernier truc : 
#     il ne faut pas qu'un Player puisse attaquer s'il est mort… 
#     Donc rajoute un petit if dans ta boucle each.

     end    

    # Fin du jeu : maintenant, si on sort de cette boucle while, 
    # c'est que la partie est terminée. 
    # Donc juste en dessous du end de la boucle, 
    # on va préparer un petit message de fin. Le jeu doit afficher :

    puts "La partie est finie" 
    if player1.life_points > 0
    	puts "BRAVO ! TU AS GAGNE !" 
    else
    	puts 
    	"Loser ! Tu as perdu !" 
    end

# Super ! Tu es arrivé au bout de la version 2.0 de ton Fornite-like ! 
# Lance plusieurs combats, fais plein de tests 
# et compare les résultats avec tes fellow moussaillons. 
# N'hésite pas à mettre des petits gets.chomp ici et là 
# qui auront pour seul objectif de faire une petite pause 
# dans l'affichage du texte du jeu sur le terminal. 
# Ça aidera à la lecture et à suivre ce qu'il se passe.
