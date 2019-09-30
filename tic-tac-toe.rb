class TicTacToe
    def initialize
        @game_status = true
        @place_left =  9
        @input_1
        @input_2

        @board = []
        @taken = []
        @options = []


        start_board

        print_board
        
        @toss_coin_1 = rand(2)
        @toss_coin_2 = rand(2)
        @player_1_starts = @toss_coin_1 == 0 ? true : false
        puts @player_1_starts ? "Player 1 starts." : "Player 2 starts."
        if @toss_coin_2 == 0
            @player_1 = "X"
            @player_2 = "O"
        else
            @player_1 = "O"
            @player_2 = "X"
        end
        puts "Player 1 puts: #{@player_1}, Player 2 puts: #{@player_2}"

        game_on
    end

    private

    def game_on
        while @game_status == true
            if @player_1_starts
                puts "Waiting Player 1 input: (#{@player_1})"
                @input_1 = gets.chomp
                if @taken.include?(@input_1) || @options.include?(@input_1) == false
                    while @taken.include?(@input_1) || @options.include?(@input_1) == false
                        puts "Place is not available please try again: (#{@player_1})"
                        @input_1 = gets.chomp
                    end
                end
                inputting(@player_1,@input_1)
                @taken.push(@input_1)
                @place_left -= 1
                
                if check_if_won == true
                    @game_status = false
                    next
                elsif @place_left == 0
                    puts "Draw"
                    @game_status = false
                    next
                end
                
                puts "Waiting Player 2 input: (#{@player_2})"
                @input_2 = gets.chomp
                if @taken.include?(@input_2) || @options.include?(@input_2) == false
                    while @taken.include?(@input_2) || @options.include?(@input_2) == false
                        puts "Place is not available please try again: (#{@player_2})"
                        @input_2 = gets.chomp
                    end
                end
                inputting(@player_2,@input_2)
                @taken.push(@input_2)
                @place_left -= 1

                if check_if_won == true
                    @game_status = false
                    next
                elsif @place_left == 0
                    puts "Draw"
                    @game_status = false
                    next
                end
            else
                puts "Waiting Player 2 input: (#{@player_2})"
                @input_2 = gets.chomp
                if @taken.include?(@input_2) || @options.include?(@input_2) == false
                    while @taken.include?(@input_2) || @options.include?(@input_2) == false
                        puts "Place is not available please try again: (#{@player_2})"
                        @input_2 = gets.chomp
                    end
                end
                inputting(@player_2,@input_2)
                @taken.push(@input_2)
                @place_left -= 1
                
                if check_if_won == true
                    @game_status = false
                    next
                elsif @place_left == 0
                    puts "Draw"
                    @game_status = false
                    next
                end
                
                puts "Waiting Player 1 input: (#{@player_1})"
                @input_1 = gets.chomp
                if @taken.include?(@input_1) || @options.include?(@input_1) == false
                    while @taken.include?(@input_1) || @options.include?(@input_1) == false
                        puts "Place is not available please try again: (#{@player_1})"
                        @input_1 = gets.chomp
                    end
                end
                inputting(@player_1,@input_1)
                @taken.push(@input_1)
                @place_left -= 1

                if check_if_won == true
                    @game_status = false
                    next
                elsif @place_left == 0
                    puts "Draw"
                    @game_status = false
                    next
                end
            end
        end
    end

    def inputting(player,place)
        choice = place.split("")
        row_m = choice[0].to_i - 1
        col_m = choice[1].to_i - 1
        @board[row_m][col_m] = player
        print "\n" * 3
        print_board
    end

    def start_board
        count_row = 1
        count_col = 1
        while count_row < 4
            row = []
            while count_col < 4
                row.push(count_row.to_s + count_col.to_s)
                @options.push(count_row.to_s + count_col.to_s)
                count_col += 1
            end
            @board.push(row)
            count_col = 1
            count_row += 1
        end
    end

    def print_board
        @board.each do |i|
            i.each do |j|
                print j
                print "\t"
            end
            print "\n" * 3
        end
    end
    
    def check_if_won
        @board.each do |i|
            if i.all? { |s| s == "X" }
                who_won("X")
                return true
            elsif i.all? { |s| s == "O" }
                who_won("O")
                return true
            end
        end

        col_c = 0
        row_c = 0
        while col_c < 3
            col_store = []
            while row_c < 3
                col_store.push(@board[row_c][col_c])
                row_c += 1
            end
            if col_store.all? { |s| s == "X" } && col_store.length == 3
                who_won("X")
                return true
            elsif col_store.all? { |s| s == "O" } && col_store.length == 3
                who_won("O")
                return true
            end
            col_c += 1
        end

        if @board[0][0]=="X" && @board[1][1]=="X" && @board[2][2]=="X"
            who_won("X")
            return true
        elsif @board[0][2]=="O" && @board[1][1]=="O" && @board[2][0]=="O"
            who_won("O")
            return true
        elsif @board[0][2]=="X" && @board[1][1]=="X" && @board[2][0]=="X"
            who_won("X")
            return true
        elsif @board[0][0]=="O" && @board[1][1]=="O" && @board[2][2]=="O"
            who_won("O")
            return true
        end
    end

    def who_won(stone)
        if stone == @player_1
            puts "Player 1 has won!"
        else
            puts "Game goes to Player 2!"
        end
    end

end

tic = TicTacToe.new