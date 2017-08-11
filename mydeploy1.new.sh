LAMBDA_FUNCTION_NAME=myLambdaFunctionName



mkdir temp
rm -f temp/app.zip
zip -r temp/app.zip ./ -x "*.sh" -x temp -x test
aws lambda update-function-code --function-name myfunctionName --zip-file fileb://temp/app.zip
