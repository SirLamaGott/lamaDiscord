exports("sendWebhook", sendWebhook)

function sendWebhook(webhook, pureContent, color, title, message, footer)
	TriggerServerEvent('sendWebhookServer', webhook, pureContent, color, title, message, footer)
end 