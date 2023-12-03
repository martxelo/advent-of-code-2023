

function is_set_allowed(set::SubString)

    # limit for allowed set
    max_cubes = Dict([
        ("red", 12),
        ("green", 13),
        ("blue", 14)
    ])

    # split cubes and color
    cubes_color = split(set, ", ")
    
    for cc in cubes_color

        cubes, color = split(cc, " ")
        cubes = parse(Int64, cubes)

        # if cubes higher than max allowed return false
        if cubes > max_cubes[color]
            return false
        end

    end

    return true

end


function is_game_allowed(line::String)

    # split game and sets
    game, sets = split(line, ": ")

    # get game_id number
    game_id = parse(Int64, split(game, ' ')[2])

    # split sets
    sets = split(sets, "; ")

    for set in sets

        # if set not allowed return zero for not adding to the total
        if ~is_set_allowed(set)
            return 0
        end

    end

    return game_id

end


function puzzle1()

    # read all lines
    f = open("data/day2.txt", "r")
    lines = readlines(f)
    close(f)

    total = 0
    for line in lines

        game = is_game_allowed(line)
        total = total + game

    end

    println("Solution 1 = ", total)

end


function count_colors(set::SubString)

    # keep a dictionary with three colors
    max_cubes = Dict([
        ("red", 0),
        ("green", 0),
        ("blue", 0)
    ])

    cubes_color = split(set, ", ")
    
    # if color exist update dictionary
    for cc in cubes_color

        cubes, color = split(cc, " ")
        max_cubes[color] = parse(Int64, cubes)

    end

    return max_cubes["red"], max_cubes["green"], max_cubes["blue"]

end


function calc_game_power(line::String)

    # split game and sets
    _, sets = split(line, ": ")

    # split sets
    sets = split(sets, "; ")

    # initialize to zero
    max_red, max_green, max_blue = 0, 0, 0

    for set in sets

        red, green, blue = count_colors(set)

        max_red = max(max_red, red)
        max_green = max(max_green, green)
        max_blue = max(max_blue, blue)

    end

    return max_red * max_green * max_blue

end

function puzzle2()

    # read all lines
    f = open("data/day2.txt", "r")
    lines = readlines(f)
    close(f)

    total = 0
    for line in lines

        game = calc_game_power(line)
        total = total + game

    end

    println("Solution 2 = ", total)


end

puzzle1()
puzzle2()