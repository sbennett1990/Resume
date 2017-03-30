# sed(1) commands to modify the html for better pdf output
# remove the copyright notice, which is 7 lines long
/COPYRIGHT/{N;N;N;N;N;N;d;}

# insert some space to help out the pdf-ifier
/<h2>Technical Skills and Competences<\/h2>/ i\
<p><br><br></p>\

