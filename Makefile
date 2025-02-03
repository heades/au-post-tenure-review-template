layouts_dir := layouts
markdown_dir := markdown
build_dir := packet
scripts_dir := scripts
script_sources := $(wildcard $(scripts_dir)/*.sh)
layout_sources := $(wildcard $(layouts_dir)/*.tex)
markdown_sources := $(wildcard $(markdown_dir)/*.md)
markdown_targets := $(subst $(markdown_dir), $(build_dir),$(subst .md,.pdf,$(markdown_sources)))

all: $(markdown_targets) 

$(build_dir)/%.pdf : $(markdown_dir)/%.md $(script_sources) $(layout_sources) Makefile
	./scripts/pandoc.sh $(build_dir) $(layouts_dir) $<

clean :
	rm -rf $(build_dir)
