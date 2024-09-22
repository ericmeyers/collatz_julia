#using Plots
using GLMakie
using IterTools
using Base.Iterators




function collatz(n :: Int64)
 if n % 2 == 0
    div(n,2)
 else
    3 * n + 1
 end
end


function collatz_length(n :: Int64)
    ans = collect(Int64,Iterators.takewhile(>(1),iterated(collatz, n)));
    length(ans) + 1
end



#it = iterated(collatz, 3433);
#@time ans = [collect(Int64,Iterators.takewhile(>(1),it));1];
#@show ans

xs = range(start = 1, stop = 10000, step = 1)
ys = map(collatz_length, xs)


#GLMakie.closeall()

f,ax = scatter(xs,ys)
display(f)
