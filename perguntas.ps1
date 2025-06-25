do {
    $pergunta = Read-Host "Digite a pergunta (ou 'FIM' para sair)"
    if ($pergunta -ne "FIM") {
        $resposta = Invoke-RestMethod -Method Post -Uri "http://localhost:5679/webhook/pergunta-sql" `
            -Headers @{ "Content-Type" = "application/json" } `
            -Body (@{ pergunta = $pergunta } | ConvertTo-Json -Compress)

        Write-Host "`nResposta: $($resposta.resposta)`n"
    }
} while ($pergunta -ne "FIM")