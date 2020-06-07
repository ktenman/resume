git reset --hard
git pull
docker build -t latex .
docker run --rm -i -v "$PWD":/data latex pdflatex *.tex
cp *.pdf /var/www/html/cv.pdf
cp *.pdf /var/www/html/resume.pdf