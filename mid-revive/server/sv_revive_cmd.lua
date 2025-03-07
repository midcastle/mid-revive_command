
RegisterCommand('revive', function(source, args, rawCommand)
    local target = tonumber(args[1]) or source
    
    if IsPlayerAceAllowed(source, 'command.revive') then
        TriggerClientEvent('revive:client', target)
        print(('%s has revived %s'):format(GetPlayerName(source), GetPlayerName(target)))
    else
        print(('Player %s trying to use /revive without permission'):format(GetPlayerName(source)))
    end
end, false)
-- add_ace group.admin command.revive allow