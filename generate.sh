docker build -t latex .
docker run --rm -i -v "$PWD":/data latex pdflatex konstantin_tenman_resume.tex
cp konstantin_tenman_resume.pdf /var/www/html/cv.pdf