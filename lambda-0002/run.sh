# instalar
npm i -g serverless

# inicializar
sls

# sempre fazer deploy do ambiente antes de tudo para verificar se esta com o ambiente ok
sls deploy -v

#invokar na AWS
sls invoke -f hello

#invokar local
sls invoke local -f hello --log

#remover servico
sls remove