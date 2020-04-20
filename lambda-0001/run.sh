#1º criar arquivo com politicas de segurança
#2º criar role de segurança na AWS
aws iam create-role \
    --role-name sample-lambda \
    --assume-role-policy-document file://polices.json \
    | tee logs/role.log

#3º criar arquivo com o conteudo e zipalo
zip function.zip index.js

#4º criar a lambda function
aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::766964384504:role/sample-lambda \
    | tee logs/lambda-create.log

#5 invokar a lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# atualizar a lambda
aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

#remover
aws lambda delete-function \
    --function-name hello-cli

aws iam delete-role \
    --role-name sample-lambda