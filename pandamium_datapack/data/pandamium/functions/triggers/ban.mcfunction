tag @s add running_trigger

execute if score @s ban matches 1 run function pandamium:misc/print_nearest_non_staff_player

scoreboard players set <player_exists> variable 0
execute if score @s ban matches 2.. as @a if score @p[tag=running_trigger] ban = @s id unless score @p[tag=running_trigger] staff_perms <= @s staff_perms run scoreboard players set <player_exists> variable 1
execute if score @s ban matches 2.. if score <player_exists> variable matches 0 run tellraw @s [{"text":"","color":"red"},{"text":"[Info]","color":"dark_red"}," No player was found!"]

execute if score @s ban matches 2.. as @a if score @p[tag=running_trigger] ban = @s id unless score @p[tag=running_trigger] staff_perms <= @s staff_perms run function pandamium:misc/get_banned
execute if score @s ban matches 2.. as @a if score @p[tag=running_trigger] ban = @s id if score @p[tag=running_trigger] staff_perms <= @s staff_perms run tellraw @p[tag=running_trigger] [{"text":"","color":"red"},{"text":"[Info]","color":"dark_red"}," You cannot ban ",{"selector":"@s"},"!"]

tag @s remove running_trigger
scoreboard players reset @s ban
scoreboard players enable @s ban
