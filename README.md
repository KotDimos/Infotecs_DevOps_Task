# DevOps стажировка в infotecs

Тестовое задание на позицию DevOps от компании infotecs.


## Задача

1. Скачать [архив](https://www.sqlite.org/2018/sqlite-amalgamation-3260000.zip).
2. Изучить руководство по сборке [sqlite](https://www.sqlite.org/howtocompile.html).
3. Написать CMakeLists.txt для компиляции исходников под (Linux и Windows).
4. Создать Docker (на базе OC debian, centos) и предоставить файл
для сборки легковесного сборочного окружения с gcc, в котором можно собрать ".so".
5. Ознакомиться с технологией docker multi-stage и подготовить Dockerfile,
в котором на первом этапе собирается из исходников nginx,
а во втором осуществлялся запуск веб-сервера с минимальными настройками
(в первом этапе базовый образ на выбор для второго стоит побрать минимальный образ).
6. Подготовить автоматизировано, используя на выбор (vboxmanage, vagrant, packer)
виртуальную машину c операционной системой GNU/Linux
и дистрибутивом Debian11 в среде VirtualBox.
7. Подготовить ansible playbook
([ссылка](https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html)),
который устанавливает на созданную вами виртуальную машину docker.
8. Подготовить ansible playbook
([ссылка](https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html)),
который выполняет пункты 1-4.


# Запуск Docker контейнера

Команда для билда докер контейнера.

    docker build -t my_sqlite3:v1.0 -f Dockerfile.sqlite3 .

Команда для сборки `sqlight.so` в контейнере.

    gcc -shared -o sqlight.so -fPIC shell.c sqlite3.c sqlite3ext.h sqlite3.h


# Ansible запуск в виртуальной машине

Скрипт для создания виртуальной машины.

    ./start-vm.sh

Запуск ansible.

    ansible-playbook -i hosts.ini playbook.yml

Роли для Ansible:

* install-docker
* sqlite3-build
* create-docker


# Файлы

* `README.md` - readme
* `CMakeLists.txt` - файл для 3 пункта.
* `Dockerfile.sqlite3` - docker файл для 4 пункта.
* `sqlite-amalgamation-3260000/` - исходные коды sqlite3.

* `Dockerfile.nginx` - docker файл для 5 пункта.
* `docker-nginx-start.sh` - скрипт для запуска докер контейнера, 5 пункт.
* `nginx_config/` - директория для хранения nginx конфига, 5 пункт.

* `hosts.ini` - инвентарный файл для ansible.
* `playbook.yml` - плэйбук для ansible.
* `roles/` - директория с ролями.
* `start-vm.sh` - скрипт для создания вируальной машины.
* `Vagrantfile` - файл для создания виртуальной машины с помощью Vagrant.

