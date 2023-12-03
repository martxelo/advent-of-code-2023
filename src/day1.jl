

function puzzle1()

    # read all lines
    f = open("data/day1.1.txt", "r")
    lines = readlines(f)
    close(f)

    # initialize count
    total = 0

    for line in lines

        # reverse the line
        reversed_line = reverse(line)

        # get first and last values
        first = parse(Int64, line[findfirst(r"\d", line)])
        last = parse(Int64, reversed_line[findfirst(r"\d", reversed_line)])

        # add to the counter
        total = total + first * 10 + last

    end

    # print result
    println("Solution 1 = ", total)

end


function puzzle2()

    # read all lines
    f = open("data/day1.1.txt", "r")
    lines = readlines(f)
    close(f)

    # pattern
    pattern = r"\d|one|two|three|four|five|six|seven|eight|nine"
    reversed_pattern = r"\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin"

    # dictionary
    translate = Dict([
        ("1", 1), ("2", 2), ("3", 3), ("4", 4), ("5", 5), ("6", 6), ("7", 7), ("8", 8), ("9", 9),
        ("one", 1), ("two", 2), ("three", 3),
        ("four", 4), ("five", 5), ("six", 6),
        ("seven", 7), ("eight", 8), ("nine", 9),
    ])

    # initialize count
    total = 0

    for line in lines

        # reverse the line
        reversed_line = reverse(line)

        # get first and last values
        first_str = line[findfirst(pattern, line)]
        last_str = reversed_line[findfirst(reversed_pattern, reversed_line)]

        first = translate[first_str]
        last = translate[reverse(last_str)]

        # add to the counter
        total = total + first * 10 + last

    end

    # print result
    println("Solution 2 = ", total)

end

puzzle1()
puzzle2()