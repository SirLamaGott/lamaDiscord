-- Discord Webhook
exports('createWebhook', function(webhook, pureContent, color, title, message, footer)
  local content = {
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
  embeds = content, 
  avatar_url = Config.Avatar,
  content = pureContent
}), { ['Content-Type'] = 'application/json' })
end)