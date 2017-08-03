#!/bin/bash
# bot.sh

# Importando API
source ShellBot.sh

# Inicializando o bot
ShellBot.init --token <TOKEN HERE...>

while :
do
    # Aguarda por atualizações
    ShellBot.getUpdates --limit 1 --offset $((update_id+1)) --timeout 10

    # Verifica se há atualizações
    if [ "$update_id" ]; then
        # Verifica se há um novo membro.
        if [ "$message_new_chat_member_id" ]; then
            # Mensagem de boas-vindas.
            msg="Olá *$message_new_chat_member_first_name*. Seja vem vindo ao *$message_chat_title*\n"
            msg+="Qualquer coisa é só me chamar."

            # Enviar mensagem
            ShellBot.sendMessage --chat_id $message_chat_id --text "$(echo -e "$msg")" --parse_mode markdown
        fi

        # Se o texto é um comando válido.
        if [ "$message_text" = "/ajuda" ]; then
                # Envia mensagem para o chat com o texto especificado.
                ShellBot.sendMessage --chat_id $message_chat_id --text "Olá $message_from_first_name, em que posso ajudar ?"
        fi

        if [ "$message_text" = "/fuck" ]; then
        		ShellBot.sendMessage --chat_id $message_chat_id --text "Fuck you é o caralho ... Fuck tu .... Fuck a Porra Toda"
        fi
    fi
done