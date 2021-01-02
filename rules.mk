# rules.mk

# generate an output file from an input template via sed
# EDIT should be a locally defined sed expression.
# e.g.: EDIT = -e 's:@pkgdatadir[@]:$(pkgdatadir):g'
%: %.in
	$(AM_V_GEN)$(SED) $(EDIT) < $< > $@
