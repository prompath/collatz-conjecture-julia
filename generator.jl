using Gadfly


"""
collatz_generator(n)

Generate an array from performing the Collatz Conjecture operation on a seed number n 
"""
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
for i in 1:100
    push!(y, collatz_generator(i))
end

layers = []
for y_i in y
    layer_i = layer(x=[i for i in 1:length(y_i)], y=y_i, Geom.line, Geom.point)
    push!(layers, layer_i)
end

img = SVG("collatz_plot.svg", 12inch, 8inch)
fig = plot(layers...)
draw(img, fig)
