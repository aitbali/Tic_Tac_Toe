class Game 
	attr_accessor :coups

	def initialize(coups)
		@coups = coups
	end

	def actions
		
		puts"\n"
		puts "           1 | 2 | 3 	"
  		puts "          ~~~~~~~~~~~~"
  		puts "           4 | 5 | 6 	"
  		puts "          ~~~~~~~~~~~~"
  		puts "           7 | 8 | 9 	"
		puts"\n"


  	end

  	def self.fini(coups)

  		if self.coups.to_i < 9
  			return false 
  		else 
  			return true
  		end
	end
	def self.jeu 


	end 

end




class Board < Game
	attr_accessor :table, :nom, :coups, :combis, :gagnante

	def initialize
		@table = ["   ","   ","   ","   ","   ","   ","   ","   ","   "]
		@nom = nom
		@coups = 0
		@gagnante = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	end

	def build
		puts"\n"
		puts "#{@table[0]}|#{@table[1]}|#{@table[2]}"
  		puts "~~~~~~~~~~~~"
  		puts "#{@table[3]}|#{@table[4]}|#{@table[5]}"
  		puts "~~~~~~~~~~~~"
  		puts "#{@table[6]}|#{@table[7]}|#{@table[8]}"
  		puts"\n"
	end
	def change(block , signe )
		if @table[(block.to_i - 1)] == "   "
			@table[(block.to_i - 1)] = " #{signe} "
			@coups += 1
			else
			puts "position deja prise !"
		end 

	end

	   	def gagne(joueur)

          case
      when "#{@table[0]}" == "#{@table[1]}" && "#{@table[0]}" == "#{@table[2]}" && "#{@table[0]}" != "   " && "#{@table[1]}" != "   " && "#{@table[2]}" != "   "
        puts " #{joueur.nom.upcase} YOUUUUUUUU WIN !"
        return true
      when "#{@table[3]}" == "#{@table[4]}" && "#{@table[3]}" == "#{@table[5]}" && "#{@table[3]}" != "   " && "#{@table[4]}" != "   " && "#{@table[5]}" != "   "
        puts " #{joueur.nom.upcase} YOUUUUUUUU WIN !"
        return true
      when "#{@table[6]}" == "#{@table[7]}" && "#{@table[6]}" == "#{@table[8]}" && "#{@table[6]}" != "   " && "#{@table[7]}" != "   " && "#{@table[8]}" != "   "
        puts " #{joueur.nom.upcase} YOUUUUUUUU WIN !"
        return true
      when "#{@table[0]}" == "#{@table[3]}" && "#{@table[0]}" == "#{@table[6]}" && "#{@table[0]}" != "   " && "#{@table[3]}" != "   " && "#{@table[6]}" != "   "
        puts " #{joueur.nom.upcase} YOUUUUUUUU WIN !"
        return true
      when "#{@table[1]}" == "#{@table[4]}" && "#{@table[1]}" == "#{@table[7]}" && "#{@table[1]}" != "   " && "#{@table[4]}" != "   " && "#{@table[7]}" != "   "
        puts " #{joueur.nom.upcase} YOUUUUUUUU WIN !"
        return true
      when "#{@table[2]}" == "#{@table[5]}" && "#{@table[2]}" == "#{@table[8]}" && "#{@table[2]}" != "   " && "#{@table[5]}" != "   " && "#{@table[8]}" != "   "
        puts " #{joueur.nom.upcase} YOUUUUUUUU WIN !"
        return true
      when "#{@table[0]}" == "#{@table[4]}" && "#{@table[0]}" == "#{@table[8]}" && "#{@table[0]}" != "   " && "#{@table[4]}" != "   " && "#{@table[8]}" != "   "
        puts " #{joueur.nom.upcase} YOUUUUUUUU WIN !"
        return true
      when "#{@table[2]}" == "#{@table[4]}" && "#{@table[2]}" == "#{@table[6]}" && "#{@table[2]}" != "   " && "#{@table[4]}" != "   " && "#{@table[4]}" != "   "
        puts " #{joueur.nom.upcase} YOUUUUUUUU WIN !"
        return true
      else
        return false
    end

      	end

 end


class BoardCase < Board
	attr_accessor :nom, :table, :value
	
	def initialize(block)
		puts "bonjour"
		@table = table
		@value = value
	end
	def self.position()
		
	end
end

class Player 
	attr_accessor :nom, :points, :value

	def initialize(nom)
		@nom = nom
		@points = 0
		@value = value
	end
end



#Initialisation du plateau
plateau = Board.new
block = BoardCase.new(self)



puts "\n\n~~~~~~~~~~~~~~~La partie de TIC TAC TOE commence ! \n\n"

puts "\n\n~~~~~~~~~~~~~~~Que le meilleur gagne ! \n\n"

puts "\n\n~~~~~~~~~~~~~~~Presentez vous ! \n\n"

puts " Joueur 1 :"
nom1 = gets.chomp
joueur_1 = Player.new(nom1)


puts " Joueur2 :"
nom2 = gets.chomp
joueur_2 = Player.new(nom2)


go = Game.new(0)
go.actions



	puts "Player 1 choose your symbole : X or O ? "
		sym_1 = gets.chomp
	
			if sym_1 == "X"
				joueur_1.value = "X"
				joueur_2.value = "O"
				a = 1
				
			else sym_1 == "O"
				joueur_1.value = "O"
				joueur_2.value = "X"
				a = 1
				
			end
			
		for n in (1..100)

			puts "\n\n~~~~~~~~~~~~~~~PARTIE #{n} ! \n\n"
	
			#construction du plateau 
			plateau.build
			

	
			1.times do
				puts "ACTION : #{joueur_1.nom.upcase} , choisis une case à occuper"
				choix = gets.chomp
				plateau.change(choix, joueur_1.value)
			end
			break if plateau.gagne(joueur_2)
			break if plateau.coups == 9
			
			1.times do
				puts "ACTION : #{joueur_2.nom.upcase} , choisis une case à occuper"
				choix = gets.chomp
				plateau.change(choix, joueur_2.value)
			end
			break if plateau.gagne(joueur_1)
			break if plateau.coups == 9
		end


plateau.build

puts "	BONNE JOURNEE ! ET MERCI D AVOIR CHOISI LA THP COMPAGNIE POUR JOUER AU TIOC TAC TOE ! "

