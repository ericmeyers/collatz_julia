#using Plots
using GLMakie
#using IterTools
#using Base.Iterators
#using PlotlyJS


function collatz_length_brian(n :: Int64)
 if n==1
     1
 elseif n % 2 == 0
    1 + collatz_length_brian(div(n,2))
 else
    1 + collatz_length_brian(3*n + 1)
 end
end

#function collatz(n :: Int64)
# if n % 2 == 0
#    div(n,2)
# else
#    3 * n + 1
# end
#end
#
#
#function collatz_length(n :: Int64)
#    ans = collect(Int64,Iterators.takewhile(>(1),iterated(collatz, n)));
#    length(ans) + 1
#end



#it = iterated(collatz, 3433);
#@time ans = [collect(Int64,Iterators.takewhile(>(1),it));1];
#@show ans

xs = range(start = 1, stop = 5000000, step = 1)
ys = map(collatz_length_brian, xs)
GLMakie.closeall()
p=scatter(xs, ys)
