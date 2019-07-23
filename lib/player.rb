class Player

attr_accessor :name (string) :life_points

def initialize(name) #n'importe quel joueur aura un nom et min 10pt de vie
	@name = name
	@life_points = 10
end

def show_state #le programme déclare le nb de pts de vie de tel joueur
puts "#{@name} a #{life_points} points de vie."
end

def gets_damage(damages)
	@life_points -= damages
	if @life_points -< 0
	puts "Le joueur #{@name} a perdu pour cause de décès." 
end


def attacks(from_a_player)
	puts "Le joueur #{@name} attaque le joueur #{from_a_player.name}"
	damages = compute_damage
	puts "Il lui inflige #{damages} points de dommages." 
end


def compute_damage
 return rand (1..6)	
end


