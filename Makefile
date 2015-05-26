VIMRC=~/.vimrc
VIMRC_GENERAL=~/.vimrc_general
VIMRC_PLUGINS=~/.vimrc_plugins
MUTTRC=~/.muttrc
MUTTDIR=~/.mutt/
OFFLINEIMAP=~/.offlineimaprc
DWB=~/.config/dwb/
BSPWM=~/.config/bspwm/
SXHKD=~/.config/sxhkd/
KHAL=~/.config/khal/
LEDGER=~/finance.ldg
LEDGER_HAUSHALT=~/Dokumente/haushaltskasse.ledger

all: mutt vim offlineimap dwb bspwm sxhkd khal ledger wiki personal

.PHONY: mutt
mutt:
	cp -rf $(MUTTDIR) ./mutt/
	cp $(MUTTRC) muttrc

vim:
	cp $(VIMRC) vimrc
	cp $(VIMRC_GENERAL) vimrc_general
	cp $(VIMRC_PLUGINS) vimrc_plugins

offlineimap:
	gpg --encrypt -r admin@wutzara.de -o offlineimaprc.gpg $(OFFLINEIMAP)

dwb:
	cp -rf $(DWB) ./dwb/

bspwm:
	cp -rf $(BSPWM) ./bspwm/

sxhkd:
	cp -rf $(SXHKD) ./sxhkd/

khal:
	cp -rf $(KHAL) ./khal/

ledger:
	gpg --encrypt -r admin@wutzara.de -o finance.ldg.gpg $(LEDGER)
	gpg --encrypt -r admin@wutzara.de -o haushalskasse.ldg.gpg $(LEDGER_HAUSHALT)

wiki:
	tar -czvf /tmp/wiki.tar.gz ~/Dokumente/wiki/
	gpg --encrypt -r admin@wutzara.de -o wiki.tar.gz.gpg /tmp/wiki.tar.gz

personal:
	tar -czvf /tmp/briefe.tar.gz ~/Dokumente/briefe/
	gpg --encrypt -r admin@wutzara.de -o briefe.tar.gz.gpg /tmp/briefe.tar.gz
