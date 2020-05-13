let activeChat = 0;

// $('nav>a').each(function(i) {
//     $(this).classList.remove('active-link');
// });

$('nav>a').each(function(i) {
    $(this).removeClass('active-link');
});

$('nav>a:first').addClass('active-link');



$('.chat-list').on('click', '.chat', function (evt) {
    if (activeChat != 0 ) {
        activeChat.classList.remove('active');
    }
    // При выборе чата убираем счётчик непрочитанных сообщений
    $(this).find('a>.not-readed-count').remove();
    $('.hello-user').hide();
    evt.preventDefault();
    let hrefa = this.querySelector('a').href;
    // Изменяет адресную строку без обновления страницы
    window.history.pushState('1', 'Title', hrefa);
    this.classList.add('active');
    activeChat = this;

    // Получение имени чата из get параметра и его расшифровка, если символы русские
    let chatName = decodeURI(this.querySelector('a').href.split('?')[1].split('=')[1]);
    let csrfToken = getCookie('csrftoken');

    let data = {
        'chat_name': chatName,
        'csrfmiddlewaretoken': csrfToken,
    }
    let url = window.location.pathname;

    $.ajax({
        type: "POST",
        data: data,
        url: url, 
        success: function (response) {
            let getData = JSON.parse(response);
            // console.log(getData);
            // Формируем окно чата
            // Название чата
            document.querySelector('.chat-box').querySelector('h1').textContent = chatName;
            // Участники чата
            document.querySelector('.participants').querySelector('h3').textContent = "Участников: " + getData['participants'].length;
            // Удаляем старых участников
            if ($('.participant-list').html()) {
                $('.participant-list>b').remove();
            }
            getData['participants'].forEach(p => {
                $('.participant-list').append(`<b>${p}</b>`);
            });


            // Сообщения чата
            if ($('.message').html()) {
                $('.message').remove();
            }
            $('.send-msg-area').val('')
            
            if (getData['messages'].length == 0) {
                // Если сообщений нет
                $('.msg-area').append($(`<div class='message no-message'>` +
                                        `<h2>Сообщений нет</h2>` +
                                        `</div>`
                ));
            } else {
                getData['messages'].forEach(msg => {   
                    $('.msg-area').append($(`<div class='message'>` +
                      `<span><b>${msg['author']}</b>` +
                      `<p>${msg['text'].replace("\n", "<br>")}</p></span>` +
                      `<span style='float: right;'>${msg['created']}</span>` +
                      `</div>`))
                });
                // Прокручивает до последнего сообщения
                $('.msg-area').scrollTop( function() {
                    return this.scrollHeight;
                } );
            }


            $('.msg-area').append();
        },
        error: function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText);
        }
    });

    // Показывает окно сообщений
    $('.chat-box').show();
    // Фокус на форму отправки
    $('.send-msg-area').focus();
});

// Создание нового чата
$('.add-new-chat').on('click', function (evt) {
    // Появляется окно для ввода имени чата
    $('.add-new-chat').hide();
    $('.new-chat').show();
    $('.new-chat>input').focus();
    $('.new-chat>input').on('keydown', function(evt) {
        if (evt.keyCode === 13) {
            $('.new-chat>img').click();
        }
    })
    // Подтверждение создания чата
    $('.new-chat>img').on('click', function (evt) {
        
        let inputName = $('.new-chat>input').val().trim();
        if (!inputName == "") {

            data = {
                'new_chat': inputName,
                'csrfmiddlewaretoken': getCookie('csrftoken')
            }


            // Отправляем запрос на сервер на создание нового чата
            $.ajax({
                type: "POST",
                url: window.location.pathname,
                data: data,
                success: function (response) {
                    let resp = JSON.parse(response);
                    if (resp['error']) {
                        alert('Недопустимое имя чата!');
                    } else {
                        $('.chat-list').append(
                            $(
                                `<div class='chat'>` +
                                `<a href='?name=${inputName}'>` +
                                `<h2 class='chat-title'>${inputName}<img src="/static/messanger/img/delete.png" width='50'></h2>` +
                                `<p class='chat-preview'>:</p>` +
                                `<p class='last-msg-time'></p>` +
                                `</a>` + `</div>`
                            )
                        );
                        $(`.chat>a>h2:contains(${inputName})`).click();
                    }
                    
                },
                error: function(xhr, errmsg, err) {
                    console.log(xhr.status + ": " + xhr.responseText);
                }
            });
        }
        else {
            alert('Введите название чата');
        }


        $('.new-chat').hide();
        $('.add-new-chat').show();

      });


  });

  $('#new-user').on('keydown', function(evt) {
    if (evt.keyCode === 13) {
        $('.new-user>img').click();
        evt.preventDefault();
    } 
})


// Добавление нового пользователя
$('.add-new-user').on('click', function (evt) {
    $('.add-new-user').hide();
    $('.new-user').show();
    $('#new-user').focus();

    $('.new-user>img').on('click', function (evt) {
        let inputUsername = $('#new-user').val().trim();
        let currentChat = $('.name-of-chat').text();
        if (inputUsername != "") {
            
            data = {
                'add_user': inputUsername,
                'chat': currentChat,
                'csrfmiddlewaretoken': getCookie('csrftoken'),
            }

            $.ajax({
                type: "POST",
                url: window.location.pathname,
                data: data,
                success: function (response) {
                    let resp = JSON.parse(response);
                    if (resp['error']) {
                        alert('Пользователь не найден');
                    } else {
                        $('.participant-list').append(`<b>${response}</b>`);
                        let partCnt = $('.participants').text();
                        partCnt.split(' ')[1] += 1;
                        $('.participants').text(partCnt.join(' '));
                    }
                    $('#new-user').val('');
                    
                },
                error: function(xhr, errmsg, err) {
                    console.log(xhr.status + ": " + xhr.responseText);
                }
            });


        } else {
            alert('Введите имя пользователя!');
        }


        $('.new-user').hide();
        $('.add-new-user').show();
    });
});

// Удаление чата
$('.chat-title').on('click', 'img', function(evt) {
    evt.preventDefault();
    evt.stopPropagation();
    let ans = confirm('вы уверены?')

    if (ans) {
        $(this.parentNode.parentNode.parentNode).hide();
        let chatName = $(this.parentNode).text();
        let data = {
            'csrfmiddlewaretoken': getCookie('csrftoken'),
            'delete_chat': chatName
        }

        $.ajax({
            type: "POST",
            url: window.location.pathname,
            data: data,
            success: function(response) {

            },
            error: function(xhr, errmsg, err) {
                console.log(xhr.status + ": " + xhr.responseText);
            }
        });
    }

});



// функция для получения куки
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