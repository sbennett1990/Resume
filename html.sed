# sed(1) commands to modify the html output by lowdown
# add in the link to the style sheet
/<title>/a\
<link rel="stylesheet" type="text/css" href="style/style.css">
# change the title
/<title>/c\
<title>Resume of Scott Bennett</title>
# add copyright notice at the bottom of the page
/<\/body>/c\
<!-- COPYRIGHT - 7 lines long -->\
<br>\
<p class="copy">\
<small>\
<em>This site Copyright &copy; 2015-2017 Scott Bennett.</em><br>\
</small>\
</p>\
</body>
