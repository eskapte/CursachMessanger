
window.onload = function(evt) {

    let url = window.location.pathname;
    let csrfToken = getCookie('csrftoken');

    data = {
        'get_connection': 'connection',
        'csrfmiddlewaretoken': csrfToken,
    }

    let username = JSON.parse($("#current_user").text());
    // Получение списка чатов пользователя
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function (response) {
            let getData = JSON.parse(response);
            console.log(getData);
            const WS = new WebSocket(`ws://${window.location.host}/ws/chats/user/${username}/`);
            console.log(WS);
            
            WS.onopen = function (info) {
                console.log(`%cСоединенние установлено успешно`, "color: green");
            }


            WS.onmessage = function (data) {
                // Действия при получении сообщений
                let msg = JSON.parse(data['data']);
                if (msg['chat'] == $('.name-of-chat').text()) {

                    if($('.no-message')) {
                        $('.no-message').remove();
                    }

                    $('.msg-area').append($(`<div class='message'>` +
                                            `<span><b>${msg['author']}</b>` +
                                            `<p>${msg['text'].replace("\n", "<br>")}</p></span>` +
                                            `<span style='float: right;'>${msg['created']}</span>` +
                                            `</div>`));
                    $('.msg-area').scrollTop( function() {
                        return this.scrollHeight;
                    } );
                    
    
                    if (msg['author'] == JSON.parse($('#current_user').text())) {
                        $('.msg-area').scrollTop($('.msg-area').prop('scrollHeight'));    
                    }
      
                } else {
                    // Если непрочитанных сообщений еще нет, выводим span с кол-вом непрочитанных сообщений
                    if ($('.chat-list').find(`.chat>a>h2:contains(${msg['chat']})`).siblings('.not-readed-count').length == 0) {
                        $('.chat-list').find(`.chat>a>h2:contains(${msg['chat']})`).next().next().after(`<span class='not-readed-count'>` +
                                                                                                        `1` +
                                                                                                        `</span>`
                                                                                                        );
                    } else {
                        // иначе прибавляем +1 непрочитанное сообщение
                        console.log($('.chat-list').find(`.chat>a>h2:contains(${msg['chat']})`).siblings('.not-readed-count').text( (i, text) => +text + 1 ));
                    }
                }

                

                $('.chat>a>h2').each(function (i) {
                    if (this.textContent == msg['chat']) {
                        this.nextElementSibling.textContent = msg['text'].split(' ').length > 4 ? `${msg['author']}: ${msg['text'].split(' ').slice(0, 4).join(' ')}...` : `${msg['author']}: ${msg['text']}`;
                        this.nextElementSibling.nextElementSibling.textContent = formatDate();
                    }
                });




                console.log(data['data']);
            };

            // Действия при отключении
            WS.onclose = function (err) {
                if (err.wasClean) {
                    console.log(`c%Соединение закрыто чисто\nкод=${err.code} причина=${err.reason}`, "color: yellow;");
                } else {
                    console.error(`Соединение прервано\nкод=${err.code} причина=${err.reason}`);
                }
            };
            // Отправка по enter и перенос по shift+enter
            $('.send-msg-area').on('keydown', function(evt) {
                if (!evt.shiftKey && evt.keyCode === 13) {
                    $('.send-msg-btn').click();
                    evt.preventDefault();
                } 
            })

            // Действия при отправке
            $('.send-msg-btn').on('click', function (evt) {
                
                let activeChat = $('.name-of-chat').text();
                let message = $('.send-msg-area').val().trim();
                if (message == '') {
                    alert('Введите сообщение');
                    return false;
                }
                let currentUser = JSON.parse($('#current_user').text());
                let dt = new Date();
                let createDate = `${addZiroToDate(dt.getDate())}.${addZiroToDate(dt.getMonth()+1)}.${dt.getFullYear()} ${addZiroToDate(dt.getHours())}:${addZiroToDate(dt.getMinutes())}:${addZiroToDate(dt.getSeconds())}`;
                WS.send(JSON.stringify(
                    {
                        'author': currentUser,
                        'text': message,
                        'created': createDate,
                        'room': activeChat
                    }
                ));
                // Очищаем текстовое поле
                $('.send-msg-area').val("");
                $('.send-msg-area').focus();
            
            });
        },
        error: function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText);
        }
    });

}


function addZiroToDate(dateStr) {
    if (dateStr < 9) {
        return `0${dateStr}`;
    }
    return dateStr;
}


function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function formatDate () {
    data = new Date();
    return data.toLocaleString('ru', {
            day: 'numeric',
            month: 'long',
            year: 'numeric',
            hour: 'numeric',
            minute: 'numeric',
        });
}