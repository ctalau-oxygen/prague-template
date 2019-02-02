wget https://www.oxygenxml.com/InstData/Chemistry/oxygen-pdf-chemistry.zip
unzip oxygen-pdf-chemistry.zip

wget https://www.oxygenxml.com/maven/com/oxygenxml/frameworks/20.1.0.3/frameworks-20.1.0.3.zip
mkdir frameworks
unzip frameworks-20.1.0.3.zip -d frameworks/

mkdir -p out
touch out/index.html

for file in `ls *.xml`;
do
  sh "oxygen-pdf-chemistry/chemistry.sh" -in "$file" \
    -css frameworks/docbook/css/docbook.css \
    -out "out/${file%.*}.pdf"
   echo "<a href='${file%.*}.pdf'>${file}</a>" >> out/index.html
done'
