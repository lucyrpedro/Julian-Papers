NAME = papers
RM = rm -f
TAR = tar -cvf  
UNTAR = tar -xvf
ZIP = gzip
UNZIP = gunzip

standard: dvi

all: dvi bib again ps pdf

$(NAME).dvi: $(NAME).tex 
	latex $(NAME)

dvi: 	
	latex $(NAME)

bib:
	bibtex ${NAME}||true

again:
	latex $(NAME)
	latex $(NAME)

ps: $(NAME).ps

$(NAME).ps: $(NAME).dvi
	dvips $(NAME).dvi

pdf: $(NAME).pdf

$(NAME).pdf: $(NAME).ps
	ps2pdf $(NAME).ps $(NAME).pdf

view: dvi
	xdvi $(NAME) &

pack:
	$(TAR) $(NAME) *
	$(ZIP) $(NAME)
	$(RM) *.bmp
                
unpack:
	$(UNZIP) $(NAME).gz
	$(UNTAR) $(NAME)
	$(RM) $(NAME)

clean:
	$(RM) $(NAME).ps
	$(RM) $(NAME).pdf
	$(RM) $(NAME).dvi
	$(RM) $(NAME).log
	$(RM) $(NAME).toc
	$(RM) $(NAME).aux	
	$(RM) $(NAME).out	
	$(RM) $(NAME).bbl	
	$(RM) $(NAME).blg	

