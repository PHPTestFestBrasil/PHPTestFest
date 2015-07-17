PHPTestFest
===========

##Começando

```bash
$ git clone git@github.com:royopa/PHPTestFest.git
$ git submodule init
$ git submodule update
```

```bash
$ vagrant up
$ vagrant ssh
```

```bash
$ cd php-src
$ ./buildconf
$ ./configure
$ make
$ make test
```

No fim, responder com Y para mandar os relatórios

##Gerando LCOV code coverage report

Para gerar um relatório parecido com esse [http://gcov.php.net/PHP_HEAD/lcov_html/index.php](http://gcov.php.net/PHP_HEAD/lcov_html/index.php) siga os passos abaixo:


Rode os seguintes comandos:

```bash
$ ./configure --enable-gcov # configura o php habilitando essa biblioteca 
$ make
```bash

Para gerar um relatório de cobertura de um teste, é necessário executar o comando

```bash
$ make lcov TESTS=teste/a/ser/executado
```

O relatório em HTML fica disponível em lcov_html/index.html. Assim, é só comparar
o seu relatório de cobertura com o relatório do PHP QA para ver se o seu teste
testou algo que não era testado antes.
