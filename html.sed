# sed(1) commands to modify the html output by lowdown
# add in the link to the style sheet
/<title>/a\
<link rel="stylesheet" type="text/css" href="style/style.css">
# change the title
/<title>/c\
<title>Scott Bennett</title>
# add copyright notice
/<\/body>/c\
<small>
<em>This site Copyright &copy; 2015-2017 Scott Bennett.</em><br>
</small>
</body>
