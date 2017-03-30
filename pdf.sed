# sed(1) commands to modify the html for better pdf output
# insert some space to help out the pdf-ifier
/<h2>Technical Skills and Competences<\/h2>/ i\
<p><br><br></p>\

# remove the copyright notice, which is 4 lines long
#/COPYRIGHT/{N;N;N;d;}
