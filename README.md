PHPTestFest - Virtual Machine
=============================

## Começando

Clone o repositório e inicie o submódulo

```bash
$ git clone https://github.com/PHPTestFestBrasil/PHPTestFest.git
$ cd PHPTestFest/
$ git submodule update --init --recursive
```

## Requisitos
 - [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
 - [VirtualBox Oracle VM VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)
 - [Vagrant](http://www.vagrantup.com/downloads.html)

Inicie a máquina virtual com o Vagrant

```bash
$ vagrant plugin install vagrant-vbguest
$ vagrant plugin install vagrant-cachier
$ vagrant plugin install vagrant-rsync-back
$ vagrant plugin install vagrant-timezone
$ vagrant up
$ vagrant ssh
```

Compile o PHP com os testes

```bash
$ cd php-src
$ ./buildconf
$ ./configure \
    --enable-gcov \
    --enable-debug \
    --enable-sigchild \
    --enable-libgcc \
    --with-openssl \
    --with-kerberos \
    --with-pcre-regex \
    --enable-bcmath \
    --with-bz2 \
    --enable-calendar \
    --with-curl \
    --with-enchant \
    --enable-exif \
    --enable-ftp \
    --with-gd \
    --enable-gd-jis-conv \
    --with-gettext \
    --with-mhash \
    --with-kerberos \
    --with-imap-ssl \
    --enable-intl \
    --enable-mbstring \
    --with-onig \
    --with-pspell \
    --with-recode \
    --with-mm \
    --enable-shmop \
    --with-snmp \
    --enable-soap \
    --enable-sockets \
    --enable-sysvsem \
    --enable-wddx \
    --with-xmlrpc \
    --with-xsl \
    --enable-zip \
    --with-zlib \
    --with-readline \
    --with-libedit$ make
$ make test
```

No fim, responder com Y para mandar os relatórios

## Gerando LCOV code coverage report

Siga os próximos passos para gerar um relatório de cobertura de código como o 
abaixo:

![](lcov_report.png)

Rode os seguintes comandos:

```bash
$ ./configure --enable-gcov # configura o php habilitando essa biblioteca 
$ make
```

Para gerar um relatório de cobertura de um teste, é necessário executar o comando

```bash
$ make lcov TESTS=teste/a/ser/executado  ; xdg-open lcov_html/index.html
```

O relatório em HTML fica disponível em lcov_html/index.html. Assim, é só comparar
o seu relatório de cobertura com o [relatório do PHP QA](http://gcov.php.net/PHP_HEAD/lcov_html/index.php)
para ver se o seu teste testou algo que não era testado antes.

## Testando
```bash
$ make test TESTS=diretorio/
```

```bash
$ make test TESTS=diretorio/*.phpt
```

```bash
$ make test TESTS=diretorio/nome_teste.phpt
```

## Slides

 - [PHPT - Ivan Rosolen (PHPSP)](http://pt.slideshare.net/ivanrosolen/phpt-13829359)
 - [Escrevendo testes com PHPT e contribuindo com o PHP - Rafael Dohms](http://blog.doh.ms/2009/08/19/escrevendo-testes-com-phpt/?lang=pt-br)
 - [PHPSP TestFest 2010 - Rafael Dohms](http://pt.slideshare.net/rdohms/phpsp-testfest-2010)
 - [Writing Tests for PHP Source - php[tek] 2017 - Sammy Kaye Powers](https://speakerdeck.com/sammyk/writing-tests-for-php-source-php-tek-2017)
 
## Fontes para geração desse repositório:

 - [https://gist.github.com/rogeriopradoj/68f4372483814cba62d5](https://gist.github.com/rogeriopradoj/68f4372483814cba62d5)
 - [https://github.com/mauriciovieira/PHPTestFest](https://github.com/mauriciovieira/PHPTestFest)





