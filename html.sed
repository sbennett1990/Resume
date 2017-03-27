# sed scripts to modify the html output by lowdown
# add in the link to the style sheet
/<title>/a\
<link rel="stylesheet" type="text/css" href="style/style.css">
# change the title
/<title>/c\
<title>Scott Bennett</title>
