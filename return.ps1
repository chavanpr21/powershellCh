
try{
function add()
{
$a = 10
$b = 20c

$global:c = $a+$b

write-Host "before Return"

# return $c

write-Host "after Return"
}
}
catch
{
write-output $_
}

add
write-Host $c 