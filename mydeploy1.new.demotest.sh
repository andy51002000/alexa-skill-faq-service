LAMBDA_FUNCTION_NAME=myfunctionName
arg=$1
argsize=${#arg}

if [ $argsize -gt 0 ]
then
	git checkout demotest
	git add -A
	git commit -m "$arg"
	git push -u origin demotest
	echo "upload to git ..."
fi

mkdir temp
rm -f temp/app.zip
zip -r temp/app.zip ./ -x "*.sh" -x temp -x test
aws lambda update-function-code --function-name $LAMBDA_FUNCTION_NAME --zip-file fileb://temp/app.zip
