### Requirement ###
# just >= 1.38.0
# latexmk >= 4.83

source_dir := "src/"
build_dir := "build/"
latexmk_options := "-pdf -cd -output-directory=../" + build_dir + " -xelatex "
latexmk_build_pdf := build_dir + "main.pdf"
latexmk_previewer := "Safari"
main_tex_file := source_dir + "main.tex"

launch:
    latexmk {{ latexmk_options }} {{ main_tex_file }}

preview:
    fswatch -o {{ latexmk_build_pdf }} | while read f; do open {{ latexmk_build_pdf }} -a {{ latexmk_previewer }} -g; done

release:
    cp -f {{ latexmk_build_pdf }} release/modern_computer_principles.pdf

clean:
    rm -rf {{ build_dir }}
