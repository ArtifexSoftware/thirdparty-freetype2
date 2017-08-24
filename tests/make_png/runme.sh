rm -rf ./html/pages
rm -f ./html/top.html
#####################################################################
FT_TEST_TEST_DIR=../..
FT_TEST_BASE_LIB=$FT_TEST_BASE_DIR/objs/.libs/libfreetype.so
FT_TEST_TEST_LIB=$FT_TEST_TEST_DIR/objs/.libs/libfreetype.so
#####################################################################
mkdir ./html/pages
touch ./html/top.html;
#####################################################################
echo '
<!DOCTYPE html>
  <head>
    <script type="text/javascript" src ="scripts/jquery-3.2.1.js"></script>
    <script type="text/javascript" src ="scripts/jquery.animateSprite.js"></script>
    <script type="text/javascript" src ="scripts/top.js" ></script>
    <link rel="stylesheet" type="text/css" href="styles/top.css">
  </head>
  <html>
    <body>
      <iframe id="frame_1" name="frame_1" src="" ></iframe>
      <iframe id="frame_2" name="frame_2" src="diff.html" ></iframe>
      <div class="select">
    '>./html/top.html;
#####################################################################
for i in $FT_TEST_DPI; do
	mkdir ./html/pages/$i
	for j in $FT_TEST_FONT_FILE; do
		mkdir ./html/pages/$i/$j
		for k in $FT_TEST_RENDER_MODE; do
			mkdir ./html/pages/$i/$j/$k
			for l in $FT_TEST_PT_SIZE; do
				mkdir ./html/pages/$i/$j/$k/$l
				mkdir ./html/pages/$i/$j/$k/$l/images
				./tests $FT_TEST_BASE_LIB $FT_TEST_TEST_LIB $j $l $k $i
			done
		done
	done
done
#####################################################################
echo '<label>DPI&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:<select name="dpi" id="dpi" onchange="change()">'>>./html/top.html;
for i in $FT_TEST_DPI; do
	echo "  <option value= $i > $i </option>">>./html/top.html;
done
echo '</select>
    </label><br>'>>./html/top.html;
#####################################################################
echo '<label>Font&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:<select name="font" id="font" onchange="change()">'>>./html/top.html;
for i in $FT_TEST_FONT_FILE; do
	echo "  <option value= $i > $i </option>">>./html/top.html;
done
echo '</select>
    </label><br>'>>./html/top.html;
#####################################################################
echo '<label>Render Mode:<select name="mode" id="mode" onchange="change()">'>>./html/top.html;
for i in $FT_TEST_RENDER_MODE; do
	echo "  <option value= $i > $i </option>">>./html/top.html;
done
echo '</select>
    </label><br>'>>./html/top.html;
#####################################################################
echo '<label>Size&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:<select name="size" id="size" onchange="change()">'>>./html/top.html;
for i in $FT_TEST_PT_SIZE; do
	echo "  <option value= $i > $i </option>">>./html/top.html;
done
echo '</select>
    </label><br>'>>./html/top.html;
#####################################################################
echo '</div>
    </body>
  </html>'>>./html/top.html;
#####################################################################
echo "Font       : " $FT_TEST_FONT_FILE
echo "Size       : " $FT_TEST_PT_SIZE
echo "Render_Mode: " $FT_TEST_RENDER_MODE
echo "DPI        : " $FT_TEST_DPI




