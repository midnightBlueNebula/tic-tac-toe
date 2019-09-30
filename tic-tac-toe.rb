class TicTacToe
    def initialize
        @game_status = true
        @place_left =  9
        @input_1
        @input_2

        @board = []
        @taken = []


        count_row = 1
        count_col = 1
        while count_row < 4
            row = []
            while count_col < 4
                row.push(count_row.to_s,count_col.to_s)
                count_col += 1
            end
            @board.push(row)
            count_col = 1
            count_row += 1
        end

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
        while @game_status && @place_left > 0
            if @player_1_starts
                puts "Waiting Player 1 input: (#{@player_1})"
                @input_1 = gets.chomp
                if @taken.include?(@input_1)
                    while @taken.include?(@input_1)
                        puts "Place taken please try again: (#{@player_1})"
                        @input_1 = gets.chomp
                    end
                end
                inputting(@player_1,@input_1)
                @taken.push(@input_1)
                @place_left -= 1
                puts "Waiting Player 2 input: (#{@player_2})"
                @input_2 = gets.chomp
                if @taken.include?(@input_2)
                    while @taken.include?(@input_2)
                        puts "Place taken please try again: (#{@player_2})"
                        @input_2 = gets.chomp
                    end
                end
                inputting(@player_2,@input_2)
                @taken.push(@input_2)
                @place_left -= 1
            else
                puts "Waiting Player 2 input: (#{@player_2})"
                @input_2 = gets.chomp
                if @taken.include?(@input_2)
                    while @taken.include?(@input_2)
                        puts "Place taken please try again: (#{@player_2})"
                        @input_2 = gets.chomp
                    end
                end
                inputting(@player_2,@input_2)
                @taken.push(@input_2)
                @place_left -= 1
                puts "Waiting Player 1 input: (#{@player_1})"
                @input_1 = gets.chomp
                if @taken.include?(@input_1)
                    while @taken.include?(@input_1)
                        puts "Place taken please try again: (#{@player_1})"
                        @input_1 = gets.chomp
                    end
                end
                inputting(@player_1,@input_1)
                @taken.push(@input_1)
                @place_left -= 1
            end
        end

        if @game_status
            puts "Draw"
        end
    end

    def inputting(player,place)
        choice = place.split("")
        if choice[1].to_i == 1
            row_m = choice[0].to_i - 1
            col_m = choice[1].to_i - 1
        elsif choice[1].to_i == 3
            row_m = choice[0].to_i - 1
            col_m = choice[1].to_i + 1
        else
            row_m = choice[0].to_i - 1
            col_m = choice[1].to_i
        end
        @board[row_m][col_m] = ""
        @board[row_m][col_m+1] = player + " "
        print "\n" * 3
        print_board
    end

    def print_board
        @board.each do |i|
            iter = 0
            i.each do |j|
                print j
                iter += 1
                print iter%2 == 0 ? "\t" : ""
            end
            print "\n" * 3
        end
    end

end

tic = TicTacToe.new