#!/bin/bash
func1() {
	#echo $1,$2,$3,$4,$5
	
echo '<img__style="position:absolute;top:'$1'px;left:'$3'px;width:'$3'px;height:'$4'px;"__src='$5'__/>'
#<a style="fill: blue; "xlink:href="https://www.w3schools.com/graphics/" target="_blank">ΑΙΩΝ</a>
}
func() {
#echo $1,$2,$3,$4,$5
echo '<div_style="position:absolute;top:'$1'px;left:'$2'px;width:'$3'px;height:'$4'px;"><svg_width="'$3'"_height="'$4'"_style="border:solid_1px_gray"_xmlns="http://www.w3.org/2000/svg"><text_font-family="Verdana"_y="90%"_textLength="'$3'"_lengthAdjust="spacingAndGlyphs">'$5'</text></svg></div>'




#<svg width="431" height="17" style="border:solid 1px" #xmlns="http://www.w3.org/2000/svg">
#    <g>
#        <text y="100%" textLength="431" lengthAdjust="spacingAndGlyphs">
#UGLY TEXT         5         333333gggggffff vgttffff</text>
#    </g>
#</svg>
#</div>


}

currentDir=`dirname $0`
echo $currentDir
cd "$currentDir" 

folder='pdf'
folderout='html'
files=`find $folder -type f -name '*.pdf'`


for file in `echo "$files"`
do

echo "$file"
pdftohtml -xml "$file" "html/"`basename "$file"`

#cat "$file".xml|sed -r 's@text@div@g'|sed -r 's@(top=)"[^"]*"@\10@g'


echo '<!DOCTYPE html><html><body>' > "html/"`basename "$file"`.html


cat "html/"`basename "$file"`.xml|\
sed -rn '/<image/p'|\
sed -r 's@<image.*top="([^"]*)".*left="([^"]*)".*width="([^"]*)".*height="([^"]*)".*src="([^"]*)".*@'`func1 '\\\1' '\\\2' '\\\3' '\\\4' '\\\5'`'@g' |\
sed -r 's@__@ @g' |sed -r 's@'$folderout"/"'@@g' >>"html/"`basename "$file"`.html


#cat "$file".xml|\
#sed -rn '/<text/p'|\
#sed -r #'s@<text.*top="([^"]*)".*left="([^"]*)".*width="([^"]*)".*height="([^"]*)".*@\1\2\3\4@g' 

cat "html/"`basename "$file"`.xml|\
sed -r 's@<a href="">@@g' |\
sed -r 's@</a>@@g' |\
sed -r 's@<b>|<i>@@g' |\
sed -r 's@</b>|</i>@@g' |\
sed -rn '/<text/p'|\
sed -r 's@<text.*top="([^"]*)".*left="([^"]*)".*width="([^"]*)".*height="([^"]*)"[^>]*>([^<]*)</text>@'`func '\\\1' '\\\2' '\\\3' '\\\4'  '\\\5'`'@g' |\
sed -r 's@_@ @g'>>"html/"`basename "$file"`.html

#echo '<!DOCTYPE html><html><body>' > "$file".html
#cat temp >> "$file".html
echo '<script src="scriptF.js"></script>' >> "html/"`basename "$file"`.html
echo '</body></html>' >> "html/"`basename "$file"`.html

#cat "$file".html|\
#sed -r 's@(.*>)([^<]*)(</text></svg></div>)@\2@g' |\
#sed -r 's@([0-9]+)@---\1---@g'





#exit

done
#create index
find html  -name "*.html" |sed -r 's@(.*)@<a href=\1>\1</a><br>@g'>"html/""index.html"



exit
for line in `cat "$file".xml`
do
IFS=' '

for term in `echo $line`
do

echo $term

done

done













