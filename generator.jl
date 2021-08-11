using Gadfly


function collatz_generator(n)
    seq = [n]
    while n != 1
        if n % 2 == 0
            n = n / 2
        else
            n = 3n + 1
        end
        push!(seq, n)
    end
    return seq
end


y = []
for i in 1:100000
    push!(y, collatz_generator(i))
end
plot(y=y[50], Geom.point, Geom.line, Geom.path, Guide.xlabel("n"), Guide.ylabel("value"))
