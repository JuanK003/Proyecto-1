using Pkg

Pkg.add( "Calculus" )
Pkg.installed()
Pkg.update()

using Calculus

const var1 = 3
a = -1
b = 1.5
hola = true
az = false


function printsumar( j , k )
    println( "suma: " , j + k )
end

function printarray( c )
    println( "Items de array:" )
    for v in c
        print( v , "  ")    
    end
end

a3 = Int32[]
printsum( a3 )

a3 = Int64[]
printsum( a3 )

a4 = collect( 1 : 20 )
println( a4 )


push!( a4 , 21 )
println( a4 )


a7 = repeat( "hola" , 5 )
printsum( a7 )

println( 5 \ 10 )