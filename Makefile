#
#
# 	Simple Makefile
# 		* compile latex
#		* bibliography management
#
#
##############################################################
#
# 	
# 	@category   Latex Makefile
# 	@package    texlive-full -yep!-
# 	@author     Anon - Sergio Casanova - David Gueguen 
# 	@copyright  2016   bitwise.com 	   - choucroutage.com
# 	@license    Attribution 4.0 International
# 	@version    1.1
# 	@since      1.0
# 	@deprecated not yet
# 	@link       not link yet
# 	@see        for more ftp://ftp.fau.de/ctan/support/latex-make/latex-make.pdf 
# 	
#
##############################################################
#
#
# pdf type
PDF_TYPE = pdflatex -file-line-error -halt-on-error
#
# output name
NAME_REPORT = STATeOfTHeARtSmardCardsCryptology
FILE_REPORT = $(NAME_REPORT).pdf 
#
# sub-folder structure
DIR_TMP = tmp
DIR_TEX = tex
DIR_IMG = images
#
# list temp files
TMP_FILES =   $(NAME_REPORT).bbl \
			  $(NAME_REPORT).blg \
			  $(NAME_REPORT).idx \
			  $(NAME_REPORT).log \
			  $(NAME_REPORT).out \
	 		  $(NAME_REPORT).toc \
	 		  $(NAME_REPORT).aux \
	 		  $(NAME_REPORT).brf 
			  # bibliographie.bib.bak  		   		  
#
# main tex file
TEX_FILE 	= $(NAME_REPORT).tex 
AUX_FILE   	= $(NAME_REPORT).aux
#
# generic action
all: Makefile setup compile clean

debug: 	
	echo	$(TEX_FILE)
	echo	$(AUX_FILE)
#
# triple latex compilation -working bug weird aux naming!!-
compile: 	Makefile 		 		
			$(PDF_TYPE) 	$(TEX_FILE)
			bibtex 			$(AUX_FILE)
			$(PDF_TYPE) 	$(TEX_FILE) 		
			bibtex 			$(AUX_FILE)
			$(PDF_TYPE) 	$(TEX_FILE)
			mv $(TMP_FILES) $(DIR_TMP)/
			# show finish
			echo "compilation done"
#
# create tmp if needed
setup:
			@if [ -d $(DIR_TMP) ];\
			then \
				echo "Sorry, $(DIR_TMP) is present";\
    		else\
				echo "S$(DIR_TMP) does not exist, creating";\
				mkdir -p $(DIR_TMP);\
			fi
#
# suppress temp files / tmp folder
clean:
			# clean
			rm -f $(DIR_TMP)/*  
			rm -r $(DIR_TMP)
			# show finish
			echo "cleaning done";

