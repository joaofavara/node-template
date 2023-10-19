#!/bin/bash

echo "Starting the project creation"

gh repo create {{ cookiecutter.github_org }}/{{ cookiecutter.project_slug }} --public
git init

npm ci

sleep 60

git branch -M master
git add .
git commit -m "feat: start repository"
git remote add origin git@github.com:joaofavara/learning-cookiecutter.git
git push -u origin master

gh secret set SONAR_TOKEN -b {{ cookiecutter.sonnarcloud_token }}
gh secret set SNYK_TOKEN -b {{ cookiecutter.snyk_token }}


curl --include \
     --request POST \
"https://{{ cookiecutter.sonnarcloud_token}}@sonarcloud.io/api/projects/create?newCodeDefinitionType=days&newCodeDefinitionValue=60&project={{ cookiecutter.github_org }}_{{ cookiecutter.project_slug }}&organization={{ cookiecutter.github_org }}&name={{ cookiecutter.project_slug }}"

code .

echo "Finish the project creation"


