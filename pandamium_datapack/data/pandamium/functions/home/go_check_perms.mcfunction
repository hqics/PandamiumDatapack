execute if score @s home matches 1 run function pandamium:home/go_check_cooldown
execute if score @s home matches 2..5 if score @s gameplay_perms matches 2 run function pandamium:home/go_check_cooldown

execute if score @s home matches 2..5 unless score @s gameplay_perms matches 2 run tellraw @s [{"text":"[Home]","color":"dark_red"},{"text":" Only donators, Elders, and Veterans can use more than one home! You can check the ","color":"red"}, {"text":"Discord","color":"gold","hoverEvent":{"action":"show_text","value":"discord.pandamium.gg"}},{"text":" for more information on how to donate.","color":"red"}]