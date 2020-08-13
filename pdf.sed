# sed(1) commands to modify the html for better pdf output
#
# adjust header top margin
/<h1>Scott Bennett<\/h1>/c\
<h1 style="margin-top: 15px;">Scott Bennett</h1>
#
# adjust skills section margin to help pdf-ifier
/<h2>Technical Skills and Competences<\/h2>/c\
<h2 style="margin-top: 75px;">Technical Skills and Competences</h2>
#
# switch email address to a normal form
/Email: scottb/c\
Email: scottb@fastmail.com<br>
#
# remove the copyright notice, which is 6 lines long
/COPYRIGHT/{N;N;N;N;N;N;d;}
