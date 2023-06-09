-- Discord Webhook
function sendWebhook(webhook, pureContent, color, title, message, footer)
  local contents = {
    {
        ["color"] = color,
        ["title"] = title .."\n",
        ["description"] = message,
        ["footer"] = {
            ["text"] = footer,
        },
    }
}

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', 
  json.encode({
    username = Config.Name, 
    embeds = contents, 
    avatar_url = Config.Avatar,
    content = pureContent
  }), { ['Content-Type'] = 'application/json' })
end

exports('sendWebhook', sendWebhook)

RegisterServerEvent('sendWebhookServer')
AddEventHandler('sendWebhookServer', function(webhook, pureContent, color, title, message, footer) sendWebhook(webhook, pureContent, color, title, message, footer) end)