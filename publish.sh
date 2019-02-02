wget https://www.oxygenxml.com/InstData/Chemistry/oxygen-pdf-chemistry.zip
unzip oxygen-pdf-chemistry.zip

wget https://www.oxygenxml.com/maven/com/oxygenxml/frameworks/20.1.0.3/frameworks-20.1.0.3.zip
mkdir frameworks
unzip frameworks-20.1.0.3.zip -d frameworks/

mkdir -p out
echo "<h1>XML Prague 2019 Paper</h1>" > out/index.html

for file in `ls *.xml`;
do
  sh "oxygen-pdf-chemistry/chemistry.sh" -in "$file" \
    -css frameworks/docbook/css/docbook.css \
    -out "out/${file%.*}.pdf"
   echo "<a href='${file%.*}.pdf'>View ${file%.*}.pdf</a>" >> out/index.html
   EDIT_URL="https://www.oxygenxml.com/oxygen-xml-web-author/app/oxygen.html?url=${REPOSITORY_URL}/${BRANCH}/${file}"
   echo "<a href='${EDIT_URL}'>Edit ${file%.*}.xml</a>" >> out/index.html
done
