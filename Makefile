docName = draft-pala-klaussner-composite-kofn


default: all

all: txt html

txt: $(docName).txt

$(docName).txt: $(docName).mkd
	kdrfc $(docName).mkd

xml: $(docName).xml

$(docName).xml: $(docName).mkd
	 kramdown-rfc2629 $(docName).mkd > $(docName).xml
	 # for some reason the kramdown tool seems to be creating invalid xml, so let's fix it
	 sed -i 's/consensus="true">/>/g' $(docName).xml 

html: xml
	xml2rfc $(docName).xml --html --text


clean:
	rm -f $(docName).xml $(docName).txt # $(docName).html
	# Explicitely not deleting the .txt because that should be committed to git for other people's ease of editing.
