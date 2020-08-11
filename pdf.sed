# sed(1) commands to modify the html for better pdf output
#
#
# switch email address to a normal form
/Email: scottb/c\
	Email: scottb@fastmail.com<br>
#
# remove the copyright notice, which is 6 lines long
/COPYRIGHT/{N;N;N;N;N;N;d;}
#
# insert some space to help out the pdf-ifier
#/<h2>Technical Skills and Competences<\/h2>/ i\
#<p><br><br></p>\
