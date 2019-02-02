wget https://www.oxygenxml.com/InstData/Chemistry/oxygen-pdf-chemistry.zip
unzip oxygen-pdf-chemistry.zip

wget https://www.oxygenxml.com/maven/com/oxygenxml/frameworks/20.1.0.3/frameworks-20.1.0.3.zip
mkdir frameworks
unzip frameworks-20.1.0.3.zip -d frameworks/

mkdir -p out
echo "<h1>XML Prague 2019 Paper Draft</h1>" > out/index.html

SLUG=`echo $REPOSITORY_URL | | sed 's/git@github.com://' | sed 's/https:\/\/.*github.com\///'`
USER=`echo $REPOSITORY_URL | cut -d '/' -f 1`
REPO=`echo $REPOSITORY_URL | cut -d '/' -f 2`
CLEAN_REPO_URL=`https://github.com/$USER/$REPO`

for file in `ls *.xml`;
do
  sh "oxygen-pdf-chemistry/chemistry.sh" -in "$file" \
    -css frameworks/docbook/css/docbook.css \
    -out "out/${file%.*}.pdf"
   EDIT_URL="https://www.oxygenxml.com/oxygen-xml-web-author/app/oxygen.html?url=gitgh%3A%2F%2Fhttps%253A%252F%252Fgithub.com%252F${USER}%252F${REPO}%252F${BRANCH}%252F${file}"
   echo "<ul>"
   echo "<li><a href='${file%.*}.pdf'>View generated PDF version</a>" >> out/index.html
   echo "<li><a href='${EDIT_URL}'>Edit Docbook source</a>" >> out/index.html
   echo "<li><a href='${CLEAN_REPO_URL}'>View on GitHub</a>" >> out/index.html
   echo "</ul>"
done
