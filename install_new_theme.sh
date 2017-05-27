if [ $# -ne 2 ]
then
    echo "usage: $0 + git-repository theme-name"
    exit
fi

git clone $1 theme-cloned
mkdir backup
mv _config.yml _layouts _includes _sass assets backup/

cd  theme-cloned
cp -rf _layouts/ _includes _sass assets .. 
cd ..
rm -rf theme-cloned

original=`grep "theme:" backup/_config.yml`

cat ./backup/_config.yml | sed -e "s/${original}/theme: $2/g" > _config.yml
