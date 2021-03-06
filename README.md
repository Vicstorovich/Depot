# README

Каждая компания, которая пользуется услугами доставки еды, рано или поздно приходит к
 Оригинальная идея разработать собственный сервис для заказа обеда.  Многие начинают, но лишь немногие из них приносят
 это до конца.  Цель этой задачи - разработать очень маленький MVP, который можно
 используется уже в производстве.
 Мы постараемся максимально упростить проблему.  Пожалуйста, найдите пользовательские истории ниже. 
  
 Давайте предположим, что в приложении только одна организация, все пользователи принадлежат ей.
    ● Как первый зарегистрированный пользователь в системе, я становлюсь администратором обедов.
    ------
    ● Как гость я должен иметь возможность зарегистрироваться с именем, адресом электронной почты и паролем.
    ● Как гость я должен иметь возможность войти в систему с помощью электронной почты и пароля.
    ------
    ● Как пользователь я могу редактировать свой профиль
    ● Как пользователь я могу видеть дни недели на странице панели инструментов.
    ● Как пользователь, когда я нажимаю на день недели (сегодня или дни в прошлом), я вижу список меню предметов с ценами.
    ● Как пользователь, когда я выбираю элементы из меню, я могу выбрать только один элемент из первого
        блюда, один предмет из второго блюда и один напиток.  Всего 3 шт.
    ● Как пользователь, я могу нажать кнопку Отправить, чтобы обработать мой заказ.
    -----
    ● Как администратор обедов, я могу просматривать зарегистрированных пользователей.
    ● Как администратор обедов, я могу просматривать дни и видеть там заказы пользователей.
    ● Как администратор обедов, я могу добавлять элементы в меню только на сегодняшний день, добавив имя и цена.
    ● Как администратор обедов, я могу загружать фотографии для каждого пункта меню
    ● Как администратор обедов, на странице даты я вижу список заказов и общую стоимость обеда на сегодня.
        
 Давайте предположим, что вместо того, чтобы звонить в компанию по доставке обедов, у них есть умная ERP
 который может запросить заказ на сегодня через наш API в определенное время.
    ● Как система, я должен быть в состоянии предоставить список заказов на сегодня с подробностями для каждого
        человек через конечную точку API RESTful JSON.
    ● Как система, у меня должен быть безопасный API.
    
 Главные примечания
    ● Держите ваш код в чистоте.
    ● Тонкие контроллеры, толстые модели.  Не забывайте о проверках
    ● Предпочитаю качество скорости выполнения этой задачи
    ● Код должен быть покрыт модульными, функциональными и интеграционными тестами.  (Пожалуйста, используйте
        RSpec + Capybara)
    ● Интерфейс может быть очень простым.
    
 ○ Исходный код приложения должен быть загружен на github.com и развернут в
 Герою в итоге.
 
 ○ Подключите TravisCI к вашему общедоступному хранилищу.
 
 Рекомендуемые технологии
 Если вы знаете свой путь, пропустите этот шаг.  В противном случае мы ожидаем от вас использовать эти драгоценные камни в
 проект Rails 4+, разработка, загрузчик Twitter, haml, simple_form, carrierwave, rspec, capybara
 Следующий уровень сложности:
    ● Добавить организации
    ● Добавить регистрацию через Google Apps
    ● Автоматическое предложение для пунктов меню
    ● Еженедельные меню

