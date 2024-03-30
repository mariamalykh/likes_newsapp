<br/>
<p align="center">

  <h3 align="center">Приложение для просмотра новостей</h3>

  <p align="center">
    Первое задание курса "Flutter" ВШПИ МФТИ
    <br/>
    <br/>
  </p>
</p>



## About The Project

  ![Screen Shot](/Screenshots/home_screen.png)

Сервис для просмотра новостей, получаемых из удаленного API. Приложение имеет два экрана: первый - для просмотра ленты доступных новостей, второй - для просмотра конкретного объявления. 
Также есть возможность смены темы, кнопка смены темы доступна из TabBar внизу экрана. Появилась возможность поставить лайк понравившейся новости, после чего она будет отображаться на экране
"Liked", доступном из основного.
Доступен APK файл в папке "APK_file"

## Built With



* [Flutter](https://flutter.dev)
* [Dart](https://dart.dev)
* [NewsAPI](https://newsapi.org)

## Getting Started

1. Склонируйте репозиторий:

```sh
git clone https://github.com/mariamalykh/flutter_newsapp.git
```

2. Перейдите в папку news app:
   ```sh
cd flutter newsapp
```
```sh
cd news app
```

3. Получите список доступных эмуляторов, на которых можно запустить приложение:

```sh
flutter devices
```

4. Выберите нужный эмулятор и запустите на нем приложение (запускать из папки news app):

```sh
flutter run -d <device_id>
```

## Usage
* Для просмотра конкретной новости нажмите на нее:
  ![Screen Shot](/Screenshots/item_screen.png)

* Для перехода на первоисточник надмите на кнопку "Read more...":
  ![Screen Shot](/Screenshots/read_more.png)

* Для смены темы перейдите на соответствующую страницу с помощью TapBar и нажмите кнопку смены темы:
  ![Screen Shot](/Screenshots/change_theme.png)
![Screen Shot](/Screenshots/dark_theme.png)

* Для того, чтобы поставить/убрать лайк, нажмите на сердечко рядом с новостью:
![Screen Shot](/Screenshots/add_to_favorites.png)

*Понравившийся пост будет доступен во вкладке "Liked":
![Screen Shot](/Screenshots/liked_list.png)





## Authors

* **Мария Малых** - *Студентка ВШПИ МФТИ* - [Ссылка на GitHub](https://github.com/mariamalykh/)


