# Eslint показывает все ошибки в модицифированных файлах.
# Положить в корень проекта и добавить в глобальный .gitignore
git status --porcelain | sed s#^...## | while read f;
do
    if [ ${f: -4} == '.jsx' ] || [ ${f: -3} == '.js' ];
        then
            echo -e "\033[0;32m--- Lint $f\033[0m";
            ./node_modules/.bin/eslint $f;
    fi
done