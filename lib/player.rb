class Player

attr_accessor :name (string) :life_points

	def initialize(name) #n'importe quel joueur aura un nom et min 10pt de vie
		@name = name
		@life_points = 10
	end

	def show_state #le programme déclare le nb de pts de vie de tel joueur
	puts "#{@name} a #{life_points} points de vie."
	end

	def gets_damage(damages) #détermine quand un joueur a perdu : si son niveau de vie passe dans les négatifs ou vaut 0
	@life_points -= damages #les dommages sont soustraits aux points de vie
		if @life_points <= 0
		puts "Le joueur #{@name} a perdu pour cause de décès." 
		life_points = 0
		end
	end


	def attacks(from_a_player)#sert à soustraire les dommage déterminés par le dé (compute_damage) au niveau de vie du joueur attaqué
		puts "Le joueur #{@name} attaque le joueur #{from_a_player.name}"
		damages = compute_damage #les dommages sont égaux au chiffre du dés, aléatoire grâce à la méthode compute_damge avec rand(1..6)
		puts "Il lui inflige #{damages} points de dommages." 
		from_a_player.gets_damage(damages)
		#verify player_living(player)
	end


	def verify_player_living(player)
		if player.life_points > 0
		puts true
		else
		puts false
		end
	end


	def compute_damage #voici un dé "numérique" (si cela fait sens?! disons plutôt voici un dé virtuel)
 		return rand (1..6)	
	end

end


class HumanPlayer < Player #héritage #HumanPlayer aura les mêmes caractéristiques 'initiales' de Player, nous allons le 'custom'

attr_accessor :weapon_level

	def initialize(name)
		super(name)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"	
	end

	def compute_damage
    	rand(1..6) * @weapon_level
	end


	def search_weapon
	found_weapon = rand (1..6)
		if found_weapon > @weapon_level || found_weapon = @weapon_level
			puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
		else
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		end
	end	

	def search_health_pack #le dé peut offrir un pack de vie
	dice = rand(1..6)
		if dice = 1 #when 1 ????
			puts "Tu n'as rien trouvé..."
		if dice = 6 #when 6 ????
			do added_life(80)
			puts "Waow, tu as trouvé un pack de +80 points de vie !" 
		elsif #else??? 
			do added_life(50)
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
		end
	end


	def added_life #on demande l'addition sauf si life_point > ou = 100
		@life_points += life
		if @life_points > 100 # ou || @life_points = 100
		@life_points = 100
		end
	end	

end






# TO DO :
# avec la méthode added_life
# #ajouter des pts de vie
# #empecher HumanPlayer d'avoir un life_points > 100