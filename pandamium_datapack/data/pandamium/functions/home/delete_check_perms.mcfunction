execute unless score @s jailed matches 1.. if score @s delhome matches -1 run function pandamium:home/delete_run

execute unless score @s jailed matches 1.. if score @s delhome matches -2 run function pandamium:home/delete_run

execute unless score @s jailed matches 1.. if score @s delhome matches -3 run function pandamium:home/delete_run

execute unless score @s jailed matches 1.. if score @s delhome matches -4 run function pandamium:home/delete_run

execute unless score @s jailed matches 1.. if score @s delhome matches -5 run function pandamium:home/delete_run

execute unless score @s jailed matches 1.. if score @s delhome matches -10..-6 run function pandamium:home/delete_run

execute unless score @s jailed matches 1.. if score @s delhome matches ..-11 run tellraw @s [{"text":"[Home]","color":"dark_red"},{"text":" This is not a valid home ID! You need to set a number between 1 and 10.","color":"red"}]
execute if score @s jailed matches 1.. run tellraw @s [{"text":"","color":"red"},{"text":"[Info]","color":"dark_red"}," You cannot use this trigger in jail!"]
