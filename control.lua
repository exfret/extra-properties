local rotate = require("scripts.rotate")

script.on_event(defines.events.on_player_rotated_entity, function(event)
    rotate.fix_direction(event.entity)
end)

script.on_event(defines.events.on_player_flipped_entity, function(event)
    rotate.fix_direction(event.entity)
end)

local function do_on_built_changes(event)
    rotate.fix_direction(event.entity)
end

script.on_event(defines.events.on_built_entity, function(event)
    do_on_built_changes(event)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
    do_on_built_changes(event)
end)

script.on_event(defines.events.script_raised_built, function(event)
    do_on_built_changes(event)
end)

script.on_event(defines.events.script_raised_revive, function(event)
    do_on_built_changes(event)
end)