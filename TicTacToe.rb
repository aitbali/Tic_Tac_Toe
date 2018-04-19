


#DECLARATION DE LA CLASSE Game INITIALISEE AVEC LE PARAMETRE coups QUI REPRESENTE LE NOBRE DE COUPS JOUES.
class Game

#ATTRIBUT coups ACCESSIBLE EN LECTURE ET EN ECRITURE
	attr_accessor :coups

#DECLARATION DE LA METHODE D INITIALISATION DE LA CLASSE .
	def initialize(coups)
		@coups = coups
	end

#DECLARATION DE LA METHODE QUI AFFICHE  LA GRILLE AVEC SES REPERES 
	def actions
		puts"\n"
		puts "           1 | 2 | 3 	"
  		puts "          ~~~~~~~~~~~~"
  		puts "           4 | 5 | 6 	"
  		puts "          ~~~~~~~~~~~~"
  		puts "           7 | 8 | 9 	"
		puts"\n"
	end

#DECLARATION DE LA METHODE DETERMINANT LES CONDITIONS DE FIN DE JEU EN FONCTION DU NOMBRE DE COUPS JOUES.
  	def self.fini(coups)
		if self.coups.to_i < 9
  			return false 
  		else 
  			return true
  		end
	end
end



#DECLARATION DE LA CLASSE BoardITIALISEE AVEC LES PARAMETRES table , nom et coups .
class Board < Game

#ATTRIBUTS ACCESSIBLES EN LECTURE ET EN ECRITURE	
	attr_accessor :table, :nom, :coups

#DECLARATION DE LA METHODE D INITIALISATION DE LA CLASSE . table VIDE POUR UN PLATEAU DE JEU VIERGE , nom EN ATTENTE D ECRITURE , coups A ZERO POUR COMMENCER UNE NOUVELLE PARTIE .
	def initialize
		@table = ["   ","   ","   ","   ","   ","   ","   ","   ","   "]
		@nom = nom
		@coups = 0
	end

#METHODE QUI AFFICHE LE PLATEAU DE JEU 
	def build
		puts"\n"
		puts "#{@table[0]}|#{@table[1]}|#{@table[2]}"
  		puts "~~~~~~~~~~~~"
  		puts "#{@table[3]}|#{@table[4]}|#{@table[5]}"
  		puts "~~~~~~~~~~~~"
  		puts "#{@table[6]}|#{@table[7]}|#{@table[8]}"
  		puts"\n"
	end

#METHODE QUI INSCRIT UNE CROIX OU UN CERCLE A L EMPLACEMET CHOISI PAR LE JOUEUR .	
	def change(block , signe )
		if @table[(block.to_i - 1)] == "   "
			@table[(block.to_i - 1)] = " #{signe} "
			@coups += 1
			else
			puts "position deja prise !"
		end 
	end

#METHODE QUI DETERMINE SI UN JOUEUR A GAGNÉ
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


#DECLARATION DE LA CLASSE Player INITIALISEE AVEC LES PARAMETRES nom POUR LE NOM DU JOUEUR ET arme POUR LA CROIX OU LE CERCLE .
class Player 
	attr_accessor :nom, :value

	def initialize(nom)
		@nom = nom
		@points = 0
		@arme = arme
	end
end



#INITIALISATION DU PLATEAU DE JEU EN APPELENT UNE INSTANCE D ELA CLASSE Board
plateau = Board.new

#UN MESSAGE DE INTRODUCTION AU JEU 
puts "\n\n~~~~~~~~~~~~~~~La partie de TIC TAC TOE commence ! \n\n"
puts "\n\n~~~~~~~~~~~~~~~Que le meilleur gagne ! \n\n"
puts "\n\n~~~~~~~~~~~~~~~Presentez vous ! \n\n"

#DEMANDE ET ENREGISTREMENT DES NOMS DES 2 JOUEURS 
puts " Joueur 1 :"
nom1 = gets.chomp

puts " Joueur2 :"
nom2 = gets.chomp

#CREATION DE DEUX INSTANCES DE LA CLASSE Player
joueur_2 = Player.new(nom2)
joueur_1 = Player.new(nom1)


#CREATION D UNE INSTANCE DE LA CLASSE Game
go = Game.new(0)
#AFFICHAGE D UN PLATEAU AVEC LES REPERES 1 A 9 POUR CHOISIR LA CASE A OSSUPER
go.actions


#ON DEMANDE AU PREMIER JOUEUR DE CHOISIR LES CROIX OU LES CERCLES 
puts "Player 1 choose your symbole : X or O ? "
#ON ENREGISTRE SON CHOIX
	sym_1 = gets.chomp
#ON ATTRIBUE LES CROIX ET LES CERCLES EN FONCTION DU CHOIX DU JOUEUR 1	
		if sym_1 == "X"
			joueur_1.arme = "X"
			joueur_2.arme = "O"
			a = 1
		else sym_1 == "O"
			joueur_1.arme = "O"
			joueur_2.arme = "X"
			a = 1
		end
#ON FAIT UNE BOUCLE DE JEU SUFFISAMMENT GRANDE			
		for n in (1..20)
			puts "\n\n~~~~~~~~~~~~~~~PARTIE #{n} ! \n\n"
#CONSTRUCTION DU PLATEAU
			plateau.build
#LE JOUEUR 1 JOUE			
			1.times do
				puts "ACTION : #{joueur_1.nom.upcase} , choisis une case à occuper"
				choix = gets.chomp
#ON INSCRIT LE COUP JOUÉ SUR LE PLATEAU
				plateau.change(choix, joueur_1.arme)
			end
#ON TESTE SI LE JOUEUR A UNE COMBINAISON GAGNANTE 
			break if plateau.gagne(joueur_2)
#ON TESTE SI À COIPS ONT ÉTÉ JOUÉS SOIT LE PLATEAU REMPLI  
			break if plateau.coups == 9
#LE JOUEUR 2 JOUE			
			1.times do
				puts "ACTION : #{joueur_2.nom.upcase} , choisis une case à occuper"
				choix = gets.chomp
#ON INSCRIT LE COUP JOUÉ SUR LE PLATEAU
				plateau.change(choix, joueur_2.arme)
			end
#ON TESTE SI LE JOUEUR A UNE COMBINAISON GAGNANTE
			break if plateau.gagne(joueur_1)
#ON TESTE SI À COIPS ONT ÉTÉ JOUÉS SOIT LE PLATEAU REMPLI
			break if plateau.coups == 9
		end

#OIN INSCRIT LE PLATEAU UNE DERNIERE FOIS POUR RAPPEL
plateau.build

puts "	BONNE JOURNEE ! ET MERCI D AVOIR CHOISI LA THP COMPAGNIE POUR JOUER AU TIOC TAC TOE ! "

