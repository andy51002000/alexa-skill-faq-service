LAMBDA_FUNCTION_NAME=myLambdaFunctionName

git add -A
git commit -m "$1"
git push -u origin master

mkdir temp
rm -f temp/app.zip
zip -r temp/app.zip ./ -x "*.sh" -x temp -x test
aws lambda update-function-code --function-name $LAMBDA_FUNCTION_NAME --zip-file fileb://temp/app.zip
