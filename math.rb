# math.rb
#
# expression strings are PARENS_*
# simple regex matches with random number selection

PARENS_FIRST = '(x{op}y){op}z'
PARENS_SECOND = 'x{op}(y{op}z)'
OPS = '+-*'
ns = '0 1 2 3 4 5 6 7 8 9 10'.split(' ')

string = ( (rand 2).zero? ? PARENS_FIRST : PARENS_SECOND )
    .gsub(/(.+)(\{op\})(.+)(\{op\})(.+)/) do
      $1 + OPS[(rand OPS.length)] + $3 + OPS[(rand OPS.length)] + $5
    end
    .gsub(/(x)(.+)(y)(.+)(z)/) do
      ns[(rand ns.length)] + $2 + ns[(rand ns.length)] + $4 + ns[(rand ns.length)]
    end

puts string
puts eval(string)

# 100.times do 
#   $> << eval( ( (rand 2).zero? ? PARENS_FIRST : PARENS_SECOND )
#     .gsub(/(.+)(\{op\})(.+)(\{op\})(.+)/) do
#       $1 + OPS[(rand OPS.length)] + $3 + OPS[(rand OPS.length)] + $5
#     end
#     .gsub(/(x)(.+)(y)(.+)(z)/) do
#       ns[(rand ns.length)] + $2 + ns[(rand ns.length)] + $4 + ns[(rand ns.length)]
#     end
#     ) << ' '
# end