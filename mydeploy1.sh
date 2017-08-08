LAMBDA_FUNCTION_NAME=myLambdaFunctionName



mkdir -p temp
rm -f temp/app.zip
zip -r temp/app.zip ./ -x "*.sh" -x temp
aws lambda update-function-code --function-name myfunctionName --zip-file fileb://temp/app.zip