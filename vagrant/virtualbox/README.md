## Общаяя информация
Vagrantfile описан таким образом, чтобы создавать VM, используя список узлов, описанных в формате YAML (по умолчанию используется файл с именем **hosts.yml**, можно изменить данное поведение в **Vagrantfile**). 

При этом:
* у каждой VM может присутствовать различное количество сетевых интерфейсов (настраивается в **hosts.yml**);
* У каждой VM может быть различное количество памяти и ядер CPU (настраивается в **hosts.yml**);
* в создаваемых VM создается пользователь teligent (настраивается в **Vagrantfile**);
* в создаваемые VM пробрасывается публичный ключ со стандартным именем **id_rsa.pub** из домашнего каталога текущего пользователя;
* также внутри VM открывается парольная аутентификация при доступе по SSH.

Далее приводится инструкция по настройке Vagrant + VirtualBox и использованию данного Vagrantfile.


## Настройка Vagrant + VirualBox

Настройка Vagrat под VirtualBox не требует специфических дйствий. Достаточно установить пакет с официального сайта: https://www.vagrantup.com/downloads.html

## Деплой

1. В **hosts.yml** указать требуемые хосты в следующем формате:
    ````
    - name: <hostname>
      network:
        eth1:
          ip: <ip address>
        ...
        ethX
          ip: <ip address>
      memory: <memory size>
      cpus: <cpu count>
    ````

2. При необходимости изменить версию box в **Vagrantfile**:
    ````
    config.vm.box = "<box>"
    config.vm.box_version = "<box_version>"
    ````

3. При необходимости изменить пользователя и группу в **Vagrantfile**:
    ````
    # OS user configuration.
    USER=<user>
    GROUP=<group>
    PASSWORD=<password>
    ````

4. Запустить деплой VM:
    ````
    vagrant up
    ````

5. Уничтожить VM:
    ````
    vagrant destroy -f
    ````