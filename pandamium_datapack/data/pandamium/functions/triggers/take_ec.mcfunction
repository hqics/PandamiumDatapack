tag @s add running_trigger

scoreboard players set <player_exists> variable 0
scoreboard players set <has_items> variable 0
scoreboard players set <empty_chest> variable 0

execute as @a if score @p[tag=running_trigger] take_ec = @s id run scoreboard players set <player_exists> variable 1

execute as @a if score @p[tag=running_trigger] take_ec = @s id if data entity @s EnderItems[0] run scoreboard players add <has_items> variable 1

execute in pandamium:staff_world unless block 7 64 -2 chest run setblock 7 64 -2 minecraft:chest[facing=west,type=single]
execute in pandamium:staff_world unless data block 7 64 -2 Items[0] run scoreboard players set <empty_chest> variable 1

#success
execute if score <player_exists> variable matches 1 if score <has_items> variable matches 1.. if score <empty_chest> variable matches 1 as @a if score @p[tag=running_trigger] take_ec = @s id run tellraw @p[tag=running_trigger] [{"text":"","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger staff_world set 3"},"hoverEvent":{"action":"show_text","value":{"text":"Teleport to Staff World","color":"yellow"}}},{"text":"[Info]","color":"gold"}," Took ",[{"selector":"@s"},"'s"]," ",{"text":"enderchest","bold":true}," items!"]
execute if score <player_exists> variable matches 1 if score <has_items> variable matches 1.. if score <empty_chest> variable matches 1 as @a if score @p[tag=running_trigger] take_ec = @s id in pandamium:staff_world run function pandamium:take/move_ec

#errors
execute if score <player_exists> variable matches 0 run tellraw @p[tag=running_trigger] [{"text":"[Info]","color":"dark_red"},{"text":" No player was found!","color":"red"}]
execute if score <player_exists> variable matches 1 if score <empty_chest> variable matches 0 run tellraw @p[tag=running_trigger] [{"text":"[Info]","color":"dark_red"},{"text":" Staff world chest still contains items!","color":"red"}]
execute if score <player_exists> variable matches 1 if score <empty_chest> variable matches 1 if score <has_items> variable matches 0 as @a if score @p[tag=running_trigger] take_ec = @s id run tellraw @p[tag=running_trigger] [{"text": "[Info]", "color":"dark_red"}," ",{"selector":"@s","color":"red"},{"text":" has no items in their enderchest!","color":"red"}]

tag @s remove running_trigger
scoreboard players reset @s take_ec
scoreboard players enable @s take_ec
