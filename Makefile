docName := draft-pala-klaussner-composite-kofn


default: all

all: txt html

txt: $(docName).txt

$(docName).txt: $(docName).mkd
	@kdrfc $(docName).mkd

xml: $(docName).xml

$(docName).xml:: $(docName).mkd
	@kramdown-rfc2629 $(docName).mkd > $(docName).xml

mkd: $(docName).mkd

$(docName).mkd::
	@kramdown-rfc2629 $(docName).mkd > $(docName).xml

html: xml
	@xml2rfc $(docName).xml --html --text


clean:
	@rm -f $(docName).xml $(docName).html # $(docName).txt
	# Explicitely not deleting the .txt because that should be committed to git for other people's ease of editing.
